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
                Logs.Text += "\n-----------";
                switch (request.Url.Segments.Last()) {
                    case "getStationInfo":
                        //Parse GET reqest
                        var stationId = Convert.ToInt32(request.Url.Query.Split('=')[1]);
                        Logs.Text += "\ngetStationInfo; ID = " + stationId;
                        //find correct station
                        var station = context.Gas_Station_ID.ToList().Where(p => p.ID == stationId).ToList();
                        if (station.Count != 0) {
                            Logs.Text += "\nStations records Found: " + station.Count;
                            string jsonData = JsonSerializer.Serialize(station.First(), new JsonSerializerOptions() { ReferenceHandler = ReferenceHandler.IgnoreCycles });
                            //send data to control app
                            serverContext.Response.Close(Encoding.UTF8.GetBytes(jsonData.ToString()), false);
                        }
                        else {
                            stationId = Convert.ToInt32(request.Url.Query.Split('=')[1]);
                            Logs.Text += "\nNo " + stationId + " station found, creating new; sending template JSON";
                            //filling new fuel list to send
                            Fuel_List[] _Lists = new Fuel_List[4];
                            string[] fueltypes = new[] { "92", "95", "98", "DF" };
                            for (int i = 0; i < _Lists.Length; i++) {
                                _Lists[i] = new Fuel_List
                                {
                                    Name = fueltypes[i],
                                    Station_ID = stationId
                                };

                            }
                            //creating new station for serializing; maybe save is not needed
                            Gas_Station_ID _gas_Station_ID = new Gas_Station_ID { ID = stationId, Address = null, Fuel_List = _Lists, Gas_Station = new Gas_Station() { Gas_station1 = "0000" } };
                            GasStationdbEntities.GetContext().Gas_Station_ID.Add(_gas_Station_ID);
                            GasStationdbEntities.GetContext().SaveChanges();
                            var serializedObject = JsonNode.Parse(JsonSerializer.Serialize(_gas_Station_ID, new JsonSerializerOptions() { ReferenceHandler = ReferenceHandler.IgnoreCycles }));
                            serverContext.Response.Close(Encoding.UTF8.GetBytes(serializedObject.ToString()), false);
                        }
                        break;
                    case "setStation":
                        Logs.AppendText("\nGot POST reqest");
                        string content = null;
                        using (var reader = new StreamReader(request.InputStream))
                            content = reader.ReadToEnd();
                        var jsonPOSTData = JsonSerializer.Deserialize<Gas_Station_ID>(content);
                        GasStationdbEntities.GetContext().Fuel_List.AddOrUpdate(jsonPOSTData.Fuel_List.ToArray());
                        GasStationdbEntities.GetContext().Gas_Station.AddOrUpdate(jsonPOSTData.Gas_Station);
                        GasStationdbEntities.GetContext().Gas_Station_ID.AddOrUpdate(jsonPOSTData);
                        try {
                            GasStationdbEntities.GetContext().SaveChanges();
                            Logs.AppendText("\nData saved!");

                        }
                        catch (Exception) {

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
