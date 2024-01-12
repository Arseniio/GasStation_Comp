using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using static System.Net.Mime.MediaTypeNames;

namespace GasStationControl {
    /// <summary>
    /// Логика взаимодействия для DataPage.xaml
    /// </summary>
    public partial class DataPage : Page {
        HttpClient httpClient = null;
        string StationID;
        List<int> dbRecords = new List<int>();
        public DataPage(string stationID) {
            InitializeComponent();
            StationID = stationID;
            httpClient = new HttpClient();
            httpClient.BaseAddress = new Uri("http://127.0.0.1:8080/");
            var httpResponse = httpClient.GetAsync("/getStationInfo?id=" + stationID).Result;
            string data = null;
            if (httpResponse.StatusCode != HttpStatusCode.OK) {
                return;
            }
            data = httpResponse.Content.ReadAsStringAsync().Result;
            //Response parser
            var resSplit = data.Split('\n');
            foreach (var line in resSplit) {
                var tokens = line.Split(':');
                switch (tokens[0]) {
                    case "addr":
                        Address.Text = tokens[1];
                        break;
                    case "92":
                        TBox92_amount.Text = tokens[1];
                        TBox92_cost.Text   = tokens[2];
                        dbRecords.Add(int.Parse(tokens[3]));
                        break;
                    case "95":
                        TBox95_amount.Text = tokens[1];
                        TBox95_cost.Text   = tokens[2];
                        dbRecords.Add(int.Parse(tokens[3]));
                        break;
                    case "98":
                        TBox98_amount.Text = tokens[1];
                        TBox98_cost.Text   = tokens[2];
                        dbRecords.Add(int.Parse(tokens[3]));
                        break;
                    case "Disel Fuel":
                        TBoxDF_amount.Text = tokens[1];
                        //
                        TBoxDF_cost.Text   = tokens[2];
                        dbRecords.Add(int.Parse(tokens[3]));
                        break;
                }
            }
        }
        private void BtnBack_Click(object sender, RoutedEventArgs e) {
            if (FrameManager.frame.CanGoBack) FrameManager.frame.GoBack();
        }

        private void BtnSave_Click(object sender, RoutedEventArgs e) {
            StringBuilder sendData = new StringBuilder();
            sendData.AppendLine(String.Format("id:{0}", StationID));
            sendData.AppendLine(String.Format("addr:{0}", Address.Text));
            sendData.AppendLine(String.Format("{0}:{1}:{2}:{3}", "92", TBox92_amount.Text, TBox92_cost.Text, dbRecords[0]));
            sendData.AppendLine(String.Format("{0}:{1}:{2}:{3}", "95", TBox95_amount.Text, TBox95_cost.Text, dbRecords[1]));
            sendData.AppendLine(String.Format("{0}:{1}:{2}:{3}", "98", TBox98_amount.Text, TBox98_cost.Text, dbRecords[2]));
            sendData.AppendLine(String.Format("{0}:{1}:{2}:{3}", "Disel Fuel", TBoxDF_amount.Text, TBoxDF_cost.Text, dbRecords[3]));
            var response = httpClient.PostAsync("setStation", new StringContent(sendData.ToString()));

        }
    }
}
