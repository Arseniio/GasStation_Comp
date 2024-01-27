using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Text.Json;
using System.Text.Json.Nodes;
using System.Text.RegularExpressions;
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
        JsonNode jsonData = null;
        JsonNode fuelData = null;
        public DataPage(string stationID) {
            InitializeComponent();
            StationID = stationID;
            httpClient = new HttpClient();
            httpClient.BaseAddress = new Uri("http://127.0.0.1:8080/");
            var httpResponse = httpClient.GetAsync("/getStationInfo?id=" + stationID).Result;
            string data = null;
            if (httpResponse.StatusCode != HttpStatusCode.OK) {
                MessageBox.Show("Retrive data from server error");
                return;
            }
            data = httpResponse.Content.ReadAsStringAsync().Result;
            jsonData = JsonNode.Parse(data);
            //Response parser
            fuelData = jsonData!["Fuel_List"];
            if (((string?)jsonData!["Address"]) == null) {
                return;
            }
            Address.Text = jsonData["Address"].ToString();
            foreach (var record in fuelData.AsArray()) {
                switch (record!["Name"].ToString()) {
                    case "92":
                        TBox92_amount.Text = record!["AmountOfFuel"].ToString();
                        TBox92_cost.Text = record!["Price"].ToString();
                        break;
                    case "95":
                        TBox95_amount.Text = record!["AmountOfFuel"].ToString();
                        TBox95_cost.Text = record!["Price"].ToString();
                        break;
                    case "98":
                        TBox98_amount.Text = record!["AmountOfFuel"].ToString();
                        TBox98_cost.Text = record!["Price"].ToString();
                        break;
                    case "Disel Fuel":
                        TBoxDF_amount.Text = record!["AmountOfFuel"].ToString();
                        TBoxDF_cost.Text = record!["Price"].ToString();
                        break;
                }
            }
        }
        private void BtnBack_Click(object sender, RoutedEventArgs e) {
            if (FrameManager.frame.CanGoBack) FrameManager.frame.GoBack();
        }


            private void BtnSave_Click(object sender, RoutedEventArgs e) {
            var i = 0;
            if (!string.IsNullOrEmpty(Address.Text)) jsonData!["Address"] = Address.Text;
            foreach (var fuelType in new[] { "92", "95", "98", "DF" }) {
                ///чат гпт интересную конструкцию подсказал(не особо фанат,использую только пока json изучаю),
                ///это подставит название из верхнего массива и вернёт TextBox
                ///так же для примерно такой же штуки можно использовать nameof,вернёт название переменной как строку :)
                TextBox TBAmount = FindName($"TBox{fuelType}_amount") as TextBox;
                TextBox TBCost = FindName($"TBox{fuelType}_cost") as TextBox;
                if (string.IsNullOrEmpty(TBAmount.Text) || string.IsNullOrEmpty(TBAmount.Text)) return;
                fuelData.AsArray()[i]!["AmountOfFuel"] = int.Parse(TBAmount.Text);
                fuelData.AsArray()[i]!["Price"] = decimal.Parse(TBCost.Text.Replace('.', ','));
                i++;
            }
            var response = httpClient.PostAsync("setStation", new StringContent(jsonData.ToString()));
        }


    }
}
