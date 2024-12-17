using System.Linq;
using System.Windows.Controls;

namespace Repair.Pages
{
    public partial class DataPage : Page
    {
        private Entities _context;
        private MainWindow _mainWindow;

        public DataPage(MainWindow mainWindow)
        {
            InitializeComponent();

            _context = new Entities();

            _mainWindow = mainWindow;

            _mainWindow.DataGridUser = DataGridUser;

            LoadData();
        }

        private void LoadData()
        {
            DataGridUser.ItemsSource = _context.RepairRequest.ToList();
        }
    }
}