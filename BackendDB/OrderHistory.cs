using System;

namespace BackendDB
{
    public class OrderHistory
    {
        public int ID { get; set; }
        public DateTime CheckedOut { get; set; }
        public DateTime CheckedIn { get; set; }
        public decimal Price { get; set; }
        public decimal DailyCashFlow { get; set; }
        public string Description { get; set; }
        public decimal Avarage { get; set; }
        public string License { get; set; }

        public OrderHistory()
        {

        }
        public OrderHistory(int id, DateTime checkIN, DateTime checkOut, decimal price, string license, decimal avarage, string description, decimal dailyCashflow)
        {
            this.ID = id;
            this.CheckedIn = checkIN;
            this.CheckedOut = checkOut;
            this.Price = price;
            this.License = license;
            this.Avarage = avarage;
            this.Description = description;
            this.DailyCashFlow = dailyCashflow;
        }
    }
}
