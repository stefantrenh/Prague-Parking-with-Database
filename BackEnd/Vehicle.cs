using System;
using System.Collections.Generic;
using System.Text;

namespace BackEnd
{
    class Vehicle
    {
        public string LicensePlate { get; set; }
        public VehicleType VehicleTypes {get; set;}
        public enum VehicleType
        {
            MC = 1,
            Car = 2
        }

        Vehicle(string licensePlate, VehicleType vehicleType) 
        {
            this.LicensePlate = licensePlate;
            this.VehicleTypes = vehicleType;
        }
    }
}
