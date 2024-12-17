using Repair;
using System.Linq;
using System.Windows.Controls;

namespace Repair.Pages
{
    public partial class StatisticsPage : Page
    {
        public StatisticsPage()
        {
            InitializeComponent();
            CalculateStatistics();
        }

        private void CalculateStatistics()
        {
            var context = Entities.GetContext();
            var completedRequests = context.RepairRequest
                .Where(r => r.statusId == 3) // Статус "Выполнено"
                .ToList();

            int totalCompleted = completedRequests.Count;
            double averageTime = completedRequests.Any()
                ? completedRequests.Average(r => (r.completionDate - r.requestDate).Value.TotalDays)
                : 0;

            CompletedRequestsTextBlock.Text = totalCompleted.ToString();
            AverageTimeTextBlock.Text = $"{averageTime:F2} дней";
        }
    }
}