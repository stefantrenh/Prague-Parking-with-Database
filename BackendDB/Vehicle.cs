using System;
namespace BackendDB

{
   public class Vehicle
    {

        
        public string LicensePlate { get; set; }
        public int VehicleTypeId { get; set; }
        public int ParkID { get; set; }
        public int ExtraValue { get; set; } //om jag vill ha extra ID där den flyttades osv
        public decimal Price { get; set; }
        public string Description { get; set; }
        public DateTime CheckOut { get; set; }
        public DateTime CheckIn { get; set; }
        public Vehicle()
        {

        }

        public Vehicle(string licensePlate, int vehicleType) : this(null,0,0,0,DateTime.MinValue,DateTime.MinValue,null,0) //chainad
        {
            this.LicensePlate = licensePlate;
            this.VehicleTypeId = vehicleType;
        }


        public Vehicle(string licensePlate, int vehicleTypeId, int extraValue,int parkID ,DateTime checkout,DateTime checkin,string description,decimal price)
        {
            this.LicensePlate = licensePlate;
            this.VehicleTypeId = vehicleTypeId;
            this.ParkID = parkID;
            this.ExtraValue = extraValue;
            this.CheckOut = checkout;
            this.CheckIn = checkin;
            this.Description = description;
            this.Price = price;
        }
    }
}
