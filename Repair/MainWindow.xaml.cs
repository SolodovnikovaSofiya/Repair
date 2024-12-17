using Repair.Pages;
using System.Windows;
using System.Windows.Controls;

namespace Repair
{
    public partial class MainWindow : Window
    {
        public DataGrid DataGridUser { get; set; }

        public MainWindow()
        {
            InitializeComponent();
            MainFrame.Navigate(new DataPage(this)); 
        }

        private void NavigateToRepairList_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.Navigate(new DataPage(this));
        }

        private void NavigateToAddRepair_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.Navigate(new AddRequestPage(null)); 
        }

        private void NavigateToEditRepair_Click(object sender, RoutedEventArgs e)
        {
            if (DataGridUser != null && DataGridUser.SelectedItem != null)
            {
                var selectedRequest = DataGridUser.SelectedItem as RepairRequest;
                if (selectedRequest != null)
                {
                    MainFrame.Navigate(new AddRequestPage(selectedRequest));
                }
            }
            else
            {
                MessageBox.Show("Пожалуйста, выберите заявку для редактирования.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        // Переход к назначению исполнителя
        private void NavigateToAssignExecutor_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.Navigate(new AssignExecutorPage());
        }

        private void NavigateToStatistics_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.Navigate(new StatisticsPage());
        }

        private void GoBack_Click(object sender, RoutedEventArgs e)
        {
            if (MainFrame.CanGoBack)
            {
                MainFrame.GoBack();
            }
        }
    }
}