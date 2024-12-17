using System;
using System.Collections.Generic;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Navigation;

namespace Repair.Pages
{
    /// <summary>
    /// Логика взаимодействия для AssignExecutorPage.xaml
    /// </summary>
    public partial class AssignExecutorPage : Page
    {
        private List<RepairRequest> _repairRequests;
        private List<Executor> _executors;

        public AssignExecutorPage()
        {
            InitializeComponent();
            LoadData();
        }

        private void LoadData()
        {
            _repairRequests = Database.GetRepairRequests();
            _executors = Database.GetExecutors();

            RepairRequestComboBox.ItemsSource = _repairRequests;
            ExecutorComboBox.ItemsSource = _executors;

            if (_repairRequests.Count > 0)
                RepairRequestComboBox.SelectedIndex = 0;

            if (_executors.Count > 0)
                ExecutorComboBox.SelectedIndex = 0;
        }

        private void AssignExecutor_Click(object sender, RoutedEventArgs e)
        {
            if (RepairRequestComboBox.SelectedItem == null || ExecutorComboBox.SelectedItem == null)
            {
                MessageBox.Show("Пожалуйста, выберите заявку и исполнителя.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            var selectedRequest = (RepairRequest)RepairRequestComboBox.SelectedItem;
            var selectedExecutor = (Executor)ExecutorComboBox.SelectedItem;

            selectedRequest.ExecutorId = selectedExecutor.Id;

            MessageBox.Show("Исполнитель успешно назначен.", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);
        }

        private void GoBack_Click(object sender, RoutedEventArgs e)
        {
            if (NavigationService.CanGoBack)
            {
                NavigationService.GoBack();
            }
        }
    }

    public class RepairRequest
    {
        public int Id { get; set; }
        public string Description { get; set; }
        public int? ExecutorId { get; set; }
    }

    public class Executor
    {
        public int Id { get; set; }
        public string Name { get; set; }
    }

    public static class Database
    {
        public static List<RepairRequest> GetRepairRequests()
        {
            return new List<RepairRequest>
            {
                new RepairRequest { Id = 1, Description = "Ремонт принтера" },
                new RepairRequest { Id = 2, Description = "Замена жесткого диска" }
            };
        }

        public static List<Executor> GetExecutors()
        {
            return new List<Executor>
            {
                new Executor { Id = 1, Name = "Иван Иванов" },
                new Executor { Id = 2, Name = "Петр Петров" }
            };
        }
    }
}