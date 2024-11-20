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
    /// Логика взаимодействия для AddRequestPage.xaml
    /// </summary>
    public partial class AddRequestPage : Page
    {
        private Entities _context;

        public AddRequestPage()
        {
            InitializeComponent();
            _context = Entities.GetContext();
            LoadData();
        }

        private void LoadData()
        {
            EquipmentComboBox.ItemsSource = _context.Equipment.ToList();
            EquipmentComboBox.DisplayMemberPath = "Name";
            EquipmentComboBox.SelectedValuePath = "EquipmentId";

            FaultTypeComboBox.ItemsSource = _context.FaultType.ToList();
            FaultTypeComboBox.DisplayMemberPath = "Name";
            FaultTypeComboBox.SelectedValuePath = "FaultTypeId";

            ClientComboBox.ItemsSource = _context.Client.ToList();
            ClientComboBox.DisplayMemberPath = "Name";
            ClientComboBox.SelectedValuePath = "ClientId";

            StatusComboBox.ItemsSource = _context.Status.ToList();
            StatusComboBox.DisplayMemberPath = "Name";
            StatusComboBox.SelectedValuePath = "StatusId";

            PerformerComboBox.ItemsSource = _context.Performer.ToList();
            PerformerComboBox.DisplayMemberPath = "Name";
            PerformerComboBox.SelectedValuePath = "PerformerId";
        }

        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {
            if (EquipmentComboBox.SelectedItem == null || FaultTypeComboBox.SelectedItem == null ||
                ClientComboBox.SelectedItem == null || StatusComboBox.SelectedItem == null ||
                RequestDatePicker.SelectedDate == null)
            {
                MessageBox.Show("Заполните все поля.", "Ошибка");
                return;
            }

            var newRequest = new RepairRequest
            {
                equipmentId = (int)EquipmentComboBox.SelectedValue,
                faultTypeId = (int)FaultTypeComboBox.SelectedValue,
                clientId = (int)ClientComboBox.SelectedValue,
                statusId = (int)StatusComboBox.SelectedValue,
                assignedTo = (int?)PerformerComboBox.SelectedValue,
                requestDate = RequestDatePicker.SelectedDate.Value,
                description = DescriptionTextBox.Text,
                report = ReportTextBox.Text
            };

            _context.RepairRequest.Add(newRequest);
            _context.SaveChanges();

            MessageBox.Show("Заявка успешно добавлена.", "Успех");
            NavigationService.Navigate(new DataPage());
        }
    }
}