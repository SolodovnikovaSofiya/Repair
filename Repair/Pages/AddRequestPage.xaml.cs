using System;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;

namespace Repair.Pages
{
    public partial class AddRequestPage : Page
    {
        private Repair.RepairRequest _currentRequest;

        public AddRequestPage(Repair.RepairRequest selectedRequest)
        {
            InitializeComponent();

            _currentRequest = selectedRequest;
            DataContext = _currentRequest;

            LoadData();
        }

        private void LoadData()
        {
            using (var context = new Entities())
            {
                EquipmentComboBox.ItemsSource = context.Equipment.ToList();
                FaultTypeComboBox.ItemsSource = context.FaultType.ToList();
                ClientComboBox.ItemsSource = context.Client.ToList();
                StatusComboBox.ItemsSource = context.Status.ToList();

                if (_currentRequest != null)
                {
                    EquipmentComboBox.SelectedValue = _currentRequest.equipmentId;
                    FaultTypeComboBox.SelectedValue = _currentRequest.faultTypeId;
                    ClientComboBox.SelectedValue = _currentRequest.clientId;
                    StatusComboBox.SelectedValue = _currentRequest.statusId;

                    RequestDatePicker.SelectedDate = _currentRequest.requestDate;
                    DescriptionTextBox.Text = _currentRequest.description;
                }
            }
        }

        private void ButtonSave_Click(object sender, RoutedEventArgs e)
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
            if (string.IsNullOrWhiteSpace(DescriptionTextBox.Text))
                errors.AppendLine("Укажите описание!");

            if (errors.Length > 0)
            {
                MessageBox.Show(errors.ToString());
                return;
            }

            _currentRequest.equipmentId = (int)EquipmentComboBox.SelectedValue;
            _currentRequest.faultTypeId = (int)FaultTypeComboBox.SelectedValue;
            _currentRequest.clientId = (int)ClientComboBox.SelectedValue;
            _currentRequest.statusId = (int)StatusComboBox.SelectedValue;
            _currentRequest.requestDate = RequestDatePicker.SelectedDate ?? DateTime.Now;
            _currentRequest.description = DescriptionTextBox.Text;

            using (var context = new Entities())
            {
                try
                {
                    if (_currentRequest.requestId == 0)
                    {
                        context.RepairRequest.Add(_currentRequest);
                    }
                    else
                    {
                        context.Entry(_currentRequest).State = System.Data.Entity.EntityState.Modified;
                    }

                    context.SaveChanges();
                    MessageBox.Show("Данные успешно сохранены!");
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString());
                }
            }
        }
    }
}