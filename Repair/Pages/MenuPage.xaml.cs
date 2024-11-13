using System;
using System.Collections.Generic;
using System.Linq;
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

namespace Repair.Pages
{
    /// <summary>
    /// Логика взаимодействия для MenuPage.xaml
    /// </summary>
    public partial class MenuPage : Page
    {
        public MenuPage()
        {
            InitializeComponent();
        }

        private void Button_Clients_Click(object sender, RoutedEventArgs e)
        {
            NavigationService?.Navigate(new ClientPage());
        }

        private void Button_Comment_Click(object sender, RoutedEventArgs e)
        {
            NavigationService?.Navigate(new CommentPage());
        }

        private void Button_Equip_Click(object sender, RoutedEventArgs e)
        {
            NavigationService?.Navigate(new EquipmentPage());
        }

        private void Button_Fauilt_Click(object sender, RoutedEventArgs e)
        {
            NavigationService?.Navigate(new FaultTypePage());
        }

        private void Button_Perform_Click(object sender, RoutedEventArgs e)
        {
            NavigationService?.Navigate(new PerformerPage());
        }

        private void Button_Status_Click(object sender, RoutedEventArgs e)
        {
            NavigationService?.Navigate(new StatusPage());
        }

        private void Button_Requests_Click(object sender, RoutedEventArgs e)
        {
            NavigationService?.Navigate(new RepairRequestPage());
        }
    }
}
