using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Runtime.Remoting.Contexts;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Text.Json;
using System.Text.Json.Nodes;
using System.Text.Json.Serialization;
using System.IO;
using System.Windows.Markup;
using System.Data.Entity.Migrations;
using System.Diagnostics;

namespace CentralServer {
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    /// Запросы
    /// getStationInfo?id=NN
    /// setStation
    public partial class MainWindow : Window {
        HttpListener server = null;
        GasStationdbEntities context = null;

        async void Listener() {
            while (true) {
                HttpListenerContext serverContext = await server.GetContextAsync();
                HttpListenerRequest request = serverContext.Request;
                //Logs.Text += "\n-----------";
                switch (request.Url.Segments.Last()) {
                    case "getStationInfo":
                        //Parse GET reqest
                        var stationId = Convert.ToInt32(request.Url.Query.Split('=')[1]);
                        Logs.Text += "\ngetStationInfo; ID = " + stationId;
                        //find correct station
                        var station = context.Fuel_List.ToList().Where(p => p.Station_ID == stationId).ToList();
                        if (station.Count != 0) {
                            Logs.Text += "\nStations records Found: " + station.Count;
                            StringBuilder fueldata = new StringBuilder();
                            fueldata.AppendLine("addr:" + context.Gas_Station_ID.ToList().Where(p => p.ID == stationId).ToList().First().Address);
                            foreach (var item in station) {
                                Logs.Text += "\n" + String.Format("{0} at {1}L costs {2} at sql ID {3}", item.Name, item.AmountOfFuel, item.Price, item.ID);
                                //building data for sending to server
                                fueldata.AppendLine(String.Format("{0}:{1}:{2}:{3}", item.Name, item.AmountOfFuel, item.Price, item.ID));
                            }
                            //send data to control app
                            serverContext.Response.Close(Encoding.UTF8.GetBytes(fueldata.ToString()), false);
                        }
                        else {
                            Logs.Text += "\nNo such station found";
                            ///TODO: creating new station not implemented yet
                            ///need to make new station address TextBox writable if StatusCode == 500 
                            ///on Control project
                            serverContext.Response.StatusCode = 500;
                            serverContext.Response.Close();

                        }
                        break;
                    case "setStation":
                        Logs.AppendText("\nGot POST reqest");
                        string content = null;
                        Fuel_List overrideStation = new Fuel_List();
                        Gas_Station_ID overrideStationID = new Gas_Station_ID();
                        using (var reader = new StreamReader(request.InputStream))
                            content = reader.ReadToEnd();
                        var resSplit = content.Split('\n');
                        foreach (var line in resSplit) {
                            var tokens = line.Split(':');
                            switch (tokens[0]) {
                                case "id":
                                    overrideStationID.ID = int.Parse(tokens[1]);
                                    overrideStation.Station_ID = int.Parse(tokens[1]);
                                    break;
                                case "": break;
                                case "addr":
                                    overrideStationID.Address = tokens[1];
                                    break;
                                default:
                                    Fuel_List editedEntry = GasStationdbEntities.GetContext().Fuel_List.ToList().Find(
                                        (p) => p.ID == int.Parse(tokens[3])
                                        );
                                    if (editedEntry != null) {
                                        editedEntry.Name = tokens[0];
                                        editedEntry.Price = decimal.Parse(tokens[2]);
                                        editedEntry.AmountOfFuel = int.Parse(tokens[1]);
                                    }
                                    GasStationdbEntities.GetContext().Fuel_List.AddOrUpdate(editedEntry);
                                    GasStationdbEntities.GetContext().SaveChanges();
                                    var modifList = GasStationdbEntities.GetContext().Fuel_List.ToList();

                                    //overrideStation.Name = tokens[0];
                                    //overrideStation.Price = decimal.Parse(tokens[2]);
                                    //overrideStation.AmountOfFuel = int.Parse(tokens[1]);
                                    //overrideStation.ID = int.Parse(tokens[3]);
                                    ////push changes to db
                                    //GasStationdbEntities.GetContext().Fuel_List.Remove(
                                    //    GasStationdbEntities.GetContext().Fuel_List.ToList().Find(
                                    //        (p) => p.ID == overrideStation.ID
                                    //    )
                                    //    );
                                    //GasStationdbEntities.GetContext().Fuel_List.Add(overrideStation);
                                    ////GasStationdbEntities.GetContext().Fuel_List.Add(overrideStation);
                                    break;
                            }
                            //push new address to db
                            GasStationdbEntities.GetContext().Gas_Station_ID.AddOrUpdate(overrideStationID);

                        }
                        break;
                }
                Logs.ScrollToEnd();
                serverContext.Response.Close();
            }
        }


        public MainWindow() {
            InitializeComponent();
            server = new HttpListener();
            context = GasStationdbEntities.GetContext();
        }

        private void StartBtn_Click(object sender, RoutedEventArgs e) {
            if (server.Prefixes.Count == 0) {
                server.Prefixes.Add("http://127.0.0.1:8080/");
                server.Start();
                Logs.AppendText("Server is running");
            }
            Listener();
        }
    }
}
