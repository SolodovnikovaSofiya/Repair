using System;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Navigation;

namespace Repair.Pages
{
    /// <summary>
    /// Логика взаимодействия для AddRequestPage.xaml
    /// </summary>
    public partial class AddRequestPage : Page
    {
        private Entities _context;
        private RepairRequest _repairRequest = new RepairRequest();

        public AddRequestPage()
        {
            InitializeComponent();
            _context = Entities.GetContext();
            this.DataContext = _repairRequest;
            LoadData();
        }

        private void LoadData()
        {
            EquipmentComboBox.ItemsSource = _context.Equipment.ToList();
            EquipmentComboBox.DisplayMemberPath = "name";
            EquipmentComboBox.SelectedValuePath = "EquipmentId";

            FaultTypeComboBox.ItemsSource = _context.FaultType.ToList();
            FaultTypeComboBox.DisplayMemberPath = "name";
            FaultTypeComboBox.SelectedValuePath = "FaultTypeId";

            ClientComboBox.ItemsSource = _context.Client.ToList();
            ClientComboBox.DisplayMemberPath = "name";
            ClientComboBox.SelectedValuePath = "ClientId";

            StatusComboBox.ItemsSource = _context.Status.ToList();
            StatusComboBox.DisplayMemberPath = "name";
            StatusComboBox.SelectedValuePath = "StatusId";
        }

        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder errors = new StringBuilder();

            if (EquipmentComboBox.SelectedItem == null)
                errors.AppendLine("Выберите оборудование!");
            if (FaultTypeComboBox.SelectedItem == null)
                errors.AppendLine("Выберите тип неисправности!");
            if (ClientComboBox.SelectedItem == null)
                errors.AppendLine("Выберите клиента!");
            if (StatusComboBox.SelectedItem == null)
                errors.AppendLine("Выберите статус!");
            if (RequestDatePicker.SelectedDate == null)
                errors.AppendLine("Выберите дату заявки!");
            if (string.IsNullOrWhiteSpace(DescriptionTextBox.Text))
                errors.AppendLine("Укажите описание!");

            if (errors.Length > 0)
            {
                MessageBox.Show(errors.ToString(), "Ошибка");
                return;
            }

            _repairRequest.equipmentId = (int)EquipmentComboBox.SelectedValue;
            _repairRequest.faultTypeId = (int)FaultTypeComboBox.SelectedValue;
            _repairRequest.clientId = (int)ClientComboBox.SelectedValue;
            _repairRequest.statusId = (int)StatusComboBox.SelectedValue;
            _repairRequest.requestDate = RequestDatePicker.SelectedDate.Value;
            _repairRequest.description = DescriptionTextBox.Text;

            _context.RepairRequest.Add(_repairRequest);
            try
            {
                _context.SaveChanges();
                MessageBox.Show("Заявка успешно добавлена.", "Успех");
                NavigationService.Navigate(new DataPage());
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString(), "Ошибка");
            }
        }
    }
}