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
                        var station = context.Gas_Station_ID.ToList().Where(p => p.ID == stationId).ToList();
                        if (station.Count != 0) {
                            Logs.Text += "\nStations records Found: " + station.Count;
                            string jsonData = JsonSerializer.Serialize(station.First(),new JsonSerializerOptions(){ ReferenceHandler = ReferenceHandler.IgnoreCycles });
                            //send data to control app
                            serverContext.Response.Close(Encoding.UTF8.GetBytes(jsonData.ToString()), false);
                        }
                        else {
                            stationId = Convert.ToInt32(request.Url.Query.Split('=')[1]);
                            Logs.Text += "\nNo " + stationId + " station found, creating new";
                            serverContext.Response.Close(Encoding.UTF8.GetBytes(stationId.ToString()), false);
                        }
                        break;
                    case "setStation":
                        Logs.AppendText("\nGot POST reqest");
                        string content = null;
                        string newAddr = "";
                        using (var reader = new StreamReader(request.InputStream))
                            content = reader.ReadToEnd();
                        ///TODO:
                        ///Rewrite this part of code to work with JSON structure
                        var resSplit = content.Split('\n');
                        int currStationID = 0;
                        Gas_Station_ID gas_Station_ID = new Gas_Station_ID();
                        foreach (var line in resSplit) {
                            var tokens = line.Split(':');
                            switch (tokens[0]) {
                                case "id":
                                    currStationID = Convert.ToInt32(tokens[1]);
                                    break;
                                case "": break;
                                case "addr":
                                    Gas_Station gas_Station = new Gas_Station();
                                    gas_Station.ID = Convert.ToInt32(currStationID);
                                    gas_Station.Gas_Station_ID = gas_Station_ID;
                                    gas_Station.Gas_station1 = "test";
                                    gas_Station_ID.Address = tokens[1];
                                    gas_Station_ID.ID = currStationID;

                                    GasStationdbEntities.GetContext().Gas_Station.AddOrUpdate(gas_Station);
                                    GasStationdbEntities.GetContext().Gas_Station_ID.AddOrUpdate(gas_Station_ID);
                                    break;
                                default:
                                    Fuel_List editedEntry = GasStationdbEntities.GetContext().Fuel_List.ToList().Find(
                                        (p) => p.ID == int.Parse(tokens[3])
                                        );
                                    if (editedEntry == null) {
                                        editedEntry = new Fuel_List();
                                        editedEntry.ID = 0;
                                    }
                                    if (editedEntry != null) {
                                        editedEntry.Name = tokens[0];
                                        editedEntry.Gas_Station_ID = gas_Station_ID;
                                        editedEntry.Station_ID = currStationID;
                                        editedEntry.Price = decimal.Parse(tokens[2]);
                                        editedEntry.AmountOfFuel = int.Parse(tokens[1]);
                                    }
                                    GasStationdbEntities.GetContext().Fuel_List.AddOrUpdate(editedEntry);
                                    break;
                            }
                            //push new address to db
                        }
                        GasStationdbEntities.GetContext().SaveChanges();
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
