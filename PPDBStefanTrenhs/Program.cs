using BackendDB;
using System;
using System.Collections.Generic;

namespace PPDBStefanTrenhs
{
    class Program
    {
        static DatabaseSQL databaseSQL = new DatabaseSQL();
        static void Main(string[] args)
        {
            Menu();

            //Test Gitthub
            //Stefan Testar Pulla
        }

        static void Menu()
        {

            string choice;
            do
            {
                Console.WriteLine("\tParking Map Overview");
                ParkingLotOverviewOutPut();
                Console.WriteLine("\n\t\tMenu:");
                Console.WriteLine(" ");
                Console.WriteLine("\t\t1: Add Vehicle");
                Console.WriteLine("\t\t2: Current Parked Vehicles");
                Console.WriteLine("\t\t3: Check Out");
                Console.WriteLine("\t\t4: Move Vehicle");
                Console.WriteLine("\t\t5: Find Vehicle");
                Console.WriteLine("\t\t6: Optimize MC");
                Console.WriteLine("\t\t7: Order Hisotry Log");
                Console.WriteLine("\t\t0: Exit\n");
                Console.Write("\t\tEnter your choice: ");
                choice = Console.ReadLine();
                Console.Clear(); switch (choice)
                {
                    case "1":
                        AddVehicleToSelectedPlace();
                        break;
                    case "2":
                        Console.WriteLine("\t\tParking Map OverView");
                        ParkingLotOverviewOutPut();
                        Console.ForegroundColor = ConsoleColor.DarkCyan;
                        Console.WriteLine("Licenseplate\t\tVehicle\t\tChecked In"); //översikt för att underlätta för användaren
                        Console.ForegroundColor = ConsoleColor.White;
                        List<Vehicle> currentParkList = databaseSQL.CurrentParkedVehicles();
                        foreach (var parkedVehicles in currentParkList)
                        {
                            Console.WriteLine("{0}\t\t\t{1}\t\t{2}",parkedVehicles.LicensePlate,parkedVehicles.Description,parkedVehicles.CheckIn);
                        }
                        Console.ForegroundColor = ConsoleColor.DarkCyan;
                        Console.WriteLine("\n\tVehicle License that have been parked for more than two days");
                        List<Vehicle> vehicles =  databaseSQL.IfParkedMoreThanTwoDays();
                        foreach (var vehicle in vehicles)
                        {
                            int count = 0;
                            count++;
                            if (count == 10 || count == 20)
                            {
                                Console.WriteLine("");
                            }
                            Console.Write("[ {0} ] ",vehicle.LicensePlate);
                        }
                        Console.ForegroundColor = ConsoleColor.White;
                        Console.Write("\n\n\tPress any key.....");
                        Console.ReadKey();
                        Console.Clear();
                        break;
                    case "3":
                        RemoveVehicle();
                        break;
                    case "4":
                        MoveVehicle();
                        break;
                    case "5":
                        FindParkedVehicle();
                        break;
                    case "6":
                        string optimize = databaseSQL.OptimizeMc();
                        Console.WriteLine(optimize);
                        Console.ReadKey();
                        break;
                    case "7":
                        OrderHistoryMenu();
                        break;
                    case "0":
                        break;
                }
            } while (choice != "0");
        } // meny
        static void AddVehicleToSelectedPlace()
        {
            bool vaild = false;

            string lincensePlate;
            string vehicleType;
            int vehicleId = 0;
            int parkinglotId;
            List<int> asp = new List<int>();


            do
            {
                Console.WriteLine("Enter the licenseplate: ");
                lincensePlate = Console.ReadLine().ToUpper();
                if (lincensePlate.Length > 10 || lincensePlate == "")
                {
                    Console.WriteLine("\nInvaild input. The Licenseplate needs to be less than 10 charaters long");
                }
                else
                    vaild = true;
            } while (!vaild);
            do
            {
                Console.WriteLine("Enter Vehicletype MC or CAR ");
                vehicleType = Console.ReadLine().ToUpper();
                if (vehicleType == "MC")
                {
                    vehicleId = 1;
                    Console.WriteLine("Parkinglot Overview For Avalible Places\n\n");
                    databaseSQL.ParkingOverView();
                    vaild = true;
                }
                else if (vehicleType == "CAR")
                {
                    vehicleId = 2;
                    Console.WriteLine("Parkinglot Overview For Avalible Places\n\n");
                    databaseSQL.ParkingOverViewForCarInsert();
                    vaild = true;
                }
                else
                    vaild = false;
            } while (!vaild);

            do
            {
                vaild = false;
                Console.WriteLine("\nEnter a ParkingSpace From The Map Above: ");
                if (vehicleType == "MC")
                {
                    asp = databaseSQL.ErrorHandlingIfWrongParkingLotIDInputForMC();
                }
                else if (vehicleType == "CAR")
                {
                    asp = databaseSQL.ErrorHandlingIfWrongParkingLotIDInputForCar();
                }

                parkinglotId = int.Parse(Console.ReadLine());

                foreach (int parkingid in asp)
                {
                    if (parkinglotId == parkingid)
                    {
                        vaild = true;
                    }
                }

            } while (!vaild);
            Vehicle vehicle = new Vehicle(lincensePlate, vehicleId);
            databaseSQL.InsertVehicleBySelectedPlace(vehicle, parkinglotId);

                Console.WriteLine("You have inserted : ");
                Console.ForegroundColor = ConsoleColor.DarkCyan;
                Console.Write("License Plate: {0}\t\tVehicle Type {1}\t\tParking Space: {2}", vehicle.LicensePlate, vehicleType, parkinglotId);
                Console.ForegroundColor = ConsoleColor.White;

            Console.ReadKey();
            Console.Clear();
        } //lägger till fordon till angiven plats
        static void ParkingLotOverviewOutPut()
        {
            databaseSQL.ParkingOverView();

            Console.WriteLine("\n\n");
            Console.ForegroundColor = ConsoleColor.Green;
            Console.WriteLine("Green = Empty Parkingspace");
            Console.ForegroundColor = ConsoleColor.Yellow;
            Console.WriteLine("Yellow = 1 Parked MC");
            Console.ForegroundColor = ConsoleColor.Red;
            Console.WriteLine("Red = Occupied");
            Console.ForegroundColor = ConsoleColor.Gray;
            Console.WriteLine("");
        } //output för konsoll
        static void FindParkedVehicle()
        {
            Console.Write("Enter a LicensePlate : ");
            string license = Console.ReadLine().ToUpper();
            Console.ForegroundColor = ConsoleColor.DarkCyan;
            Console.WriteLine("Parkinglot ID\tLicenseplate\t\tVehicle\t\tChecked-In");
            Console.ForegroundColor = ConsoleColor.White;
            Vehicle vehicle = databaseSQL.FindVehicle(license);
            Console.WriteLine($"{vehicle.ParkID}\t{vehicle.LicensePlate}\t\t{vehicle.Description}\t\t{vehicle.CheckIn}");
            Console.ReadKey();
            Console.Clear();
        } // Översikt på parkerade fordon just nu
        static void MoveVehicle()  // flytta fordon
        {
            bool vaild = false;
            List<int> asp = new List<int>();
            int parkinglotId;
            Console.WriteLine("Current Parked Vehicle");
            ParkingLotOverviewOutPut();
            Console.ForegroundColor = ConsoleColor.DarkCyan;
            Console.WriteLine("Licenseplate\t\tVehicle\t\tChecked In"); //översikt för att underlätta för användaren
            Console.ForegroundColor = ConsoleColor.White;
            List<Vehicle> currentParkList = databaseSQL.CurrentParkedVehicles();
            foreach (var parkedVehicles in currentParkList)
            {
                Console.WriteLine("{0}\t\t\t{1}\t\t{2}", parkedVehicles.LicensePlate, parkedVehicles.Description, parkedVehicles.CheckIn);
            }
            Console.WriteLine("");
            Console.Write("Enter a LicensePlate : ");
            string license = Console.ReadLine().ToUpper();
            Vehicle vehicle = databaseSQL.GetVehicleObjectBackWhenSearchedByLicense(license); // får fordons objekt

            if (vehicle.VehicleTypeId == 1) // om MC
            {
                Console.WriteLine("Parkinglot Overview For Avalible Places\n\n");
                databaseSQL.ParkingOverView();
            }
            else if (vehicle.VehicleTypeId == 2) // om Bil
            {
                Console.WriteLine("Parkinglot Overview For Avalible Places\n\n");
                databaseSQL.ParkingOverViewForCarInsert();
            }

            do
            {
                if (vehicle.VehicleTypeId == 1)
                {
                    asp = databaseSQL.ErrorHandlingIfWrongParkingLotIDInputForMC();
                }
                else if (vehicle.VehicleTypeId == 2)
                {
                    asp = databaseSQL.ErrorHandlingIfWrongParkingLotIDInputForCar();
                }
                Console.WriteLine("\nEnter a ParkingSpace Number From The Map Above That You Would Like To Move Your Vehicle To: ");
                Console.ForegroundColor = ConsoleColor.Red;
                Console.WriteLine("NOTE!: If you regret to move your vehicle enter 0");
                Console.ForegroundColor = ConsoleColor.White;
                parkinglotId = int.Parse(Console.ReadLine());
                if (parkinglotId == 0)
                {
                    Menu();
                }
                foreach (int parkingid in asp)
                {
                    if (parkinglotId == parkingid)
                    {
                        vaild = true;
                    }
                }
            } while (!vaild);

            databaseSQL.MoveVehicle(vehicle.LicensePlate,vehicle.VehicleTypeId,vehicle.ExtraValue,parkinglotId);
            Console.WriteLine("\t\tYou Moved");
            Console.ForegroundColor = ConsoleColor.DarkCyan;
            Console.WriteLine($"License: {vehicle.LicensePlate}\t FROM PARKINGSPACE: {vehicle.ExtraValue} TO {parkinglotId}");
            Console.ForegroundColor = ConsoleColor.White;
            Console.Write("\nPress any key....");
            Console.ReadKey();
            Console.Clear();

        }
        static void RemoveVehicle() // ta bort fordon
        {
            bool vaild = false;
            int freeParking = 0;
            Console.WriteLine("Current Parked Vehicle");
            ParkingLotOverviewOutPut();
            Console.ForegroundColor = ConsoleColor.DarkCyan;
            Console.WriteLine("Licenseplate\t\tVehicle\t\tChecked In"); //översikt för att underlätta för användaren
            Console.ForegroundColor = ConsoleColor.White;
            List<Vehicle> currentParkList = databaseSQL.CurrentParkedVehicles();
            foreach (var parkedVehicles in currentParkList)
            {
                Console.WriteLine("{0}\t\t\t{1}\t\t{2}", parkedVehicles.LicensePlate, parkedVehicles.Description, parkedVehicles.CheckIn);
            }
            Console.WriteLine("");
            Console.Write("Enter a LicensePlate : ");
            string license = Console.ReadLine().ToUpper();
            Vehicle vehicle = databaseSQL.GetRemoveVehicleData(license);
            Console.ForegroundColor = ConsoleColor.DarkCyan;
            Console.WriteLine("Parkinglot ID\tLicenseplate\t\tVehicle\t\tChecked-In");
            Console.ForegroundColor = ConsoleColor.White;
            Vehicle vehicle2 = databaseSQL.FindVehicle(license);
            Console.WriteLine($"{vehicle2.ParkID}\t\t{vehicle2.LicensePlate}\t\t\t{vehicle2.Description}\t\t{vehicle2.CheckIn}");
            do
            {
                Console.WriteLine("\nAre You Sure That You Want To Check Out This Vehicle? (Yes/No):  ");
                Console.ForegroundColor = ConsoleColor.Red;
                Console.WriteLine("Note! if there is no vehicle data written, the vehicle is not found! Enter (No) and try again.");
                Console.ForegroundColor = ConsoleColor.White;
                Console.Write("Enter:  ");
                string input = Console.ReadLine().ToUpper();
                if (input == "YES")
                {
                    vaild = true;
                }
                else if (input == "NO")
                {
                    Console.Clear();
                    Menu();
                }
            } while (!vaild);

            do {
                vaild = false;
                Console.WriteLine("IS IT FOR FREEE !?!?!??! (Yes/No)");
                string input = Console.ReadLine().ToUpper();
                if (input == "YES")
                {
                    freeParking = 1;
                    vaild = true;
                }
                else if (input == "NO")
                {
                    freeParking = 0;
                    vaild = true;
                }
            } while (!vaild);
            Console.WriteLine("\n\n");
            Console.ForegroundColor = ConsoleColor.DarkCyan;
            databaseSQL.CheckOutGetPrice(vehicle.LicensePlate, freeParking, vehicle.VehicleTypeId);
            databaseSQL.UpdateParkingLotAfterDeletion(vehicle.VehicleTypeId, vehicle.ExtraValue);
            Vehicle vehicledata =  databaseSQL.GetFullDataOfVehicleBeforeCheckout(license);
            if (vehicledata == null)
            {
                Console.WriteLine("cannot remove dosent exit");
                Console.Write("\n\nPress Any key.....");
                Console.ReadKey();
                Console.Clear();
            }
            else
            { 
        
            Console.WriteLine($"\tParking Space: {vehicledata.ParkID}\tLicenseplate: {vehicledata.LicensePlate}\tVehicle Type: {vehicledata.Description}");
            Console.WriteLine($"Checked IN: {vehicledata.CheckIn}\t\tChecked Out: {vehicledata.CheckOut}\tPrice: {vehicledata.Price}");
            string result = databaseSQL.DeleteVehicleAfterCheckOut(vehicle.LicensePlate);
            if (result == null)
            {
                Console.WriteLine("Vechile has not removed");
            }
            else
            {
                Console.WriteLine(result);

            }
                Console.ForegroundColor = ConsoleColor.White;
                Console.Write("\n\nPress Any key.....");
                Console.ReadKey();
                Console.Clear();
            }
        }
        static void OrderHistoryMenu()
        {
            string choice;
            do
            {
                Console.WriteLine("\n\t\tMenu:");
                Console.WriteLine(" ");
                Console.WriteLine("\t\t1: History Log");
                Console.WriteLine("\t\t2: Check Daily Profit");
                Console.WriteLine("\t\t3: Check Profit By Intervalls");
                Console.WriteLine("\t\t0: Exit\n");
                Console.Write("\t\tEnter your choice: ");
                choice = Console.ReadLine();
                Console.Clear(); switch (choice)
                {
                    case "1":
                        Console.ForegroundColor = ConsoleColor.Green;
                        Console.WriteLine("ID\tChecked IN\t\tChecked Out\t\tPrice\t   Licenseplate\t");
                        Console.ForegroundColor = ConsoleColor.White;
                        List<OrderHistory> logg = databaseSQL.GetOrderHistoryLog();
                        foreach (var orderhistory in logg)
                        {
                            Console.WriteLine("{0}\t{1}\t{2}\t{3}\t\t{4}",orderhistory.ID,orderhistory.CheckedIn,orderhistory.CheckedOut,orderhistory.Price,orderhistory.License);
                        }
                        logg.Clear();
                        break;
                    case "2":
                        Console.ForegroundColor = ConsoleColor.Green;
                        Console.WriteLine("Date\t\tIncome\t\tAvarage CashFlow each Vehicle");
                        Console.ForegroundColor = ConsoleColor.White;
                        List<OrderHistory> orders = databaseSQL.DailyIncomeReports();
                        foreach (var order in orders)
                        {
                            Console.WriteLine("{0}\t{1}\t\t{2}",order.Description,order.Price,order.Avarage);
                        }
                        orders.Clear();
                        break;
                    case "3":
                        Console.WriteLine("Enter a Start Date:");
                        Console.ForegroundColor = ConsoleColor.Red;
                        Console.WriteLine("Reminder: Please INPUT DATE (YYYY-MM-DD)");
                        Console.ForegroundColor = ConsoleColor.White;
                        string startDate = Console.ReadLine();
                        Console.WriteLine("Enter a End Date:");
                        Console.ForegroundColor = ConsoleColor.Red;
                        Console.WriteLine("Reminder: Please INPUT DATE (YYYY-MM-DD)");
                        Console.ForegroundColor = ConsoleColor.White;
                        string endDate = Console.ReadLine();
                        List<OrderHistory> intervallHistorys = databaseSQL.GetOrderHistoryDataFromIntervalls(startDate,endDate);
                        Console.WriteLine($"\nIncome Report From {startDate} TO {endDate}");
                        Console.ForegroundColor = ConsoleColor.Green;
                        Console.WriteLine("Total Income\tAvarage Cash Flow On Vehicle\t\tAvarage Cash Flow Daily");
                        foreach (var historys in intervallHistorys)
                        {
                            Console.WriteLine($"{historys.Price}\t\t{historys.Avarage}\t\t\t\t{historys.DailyCashFlow}");
                        }
                        Console.ForegroundColor = ConsoleColor.White;
                        break;
                    case "0":
                        break;
                }
            } while (choice != "0");
        }
    }
}
//databaseSQL.InsertHundredParkingSpacesInParkingLot(); metod för att skapa 100 parkeringsplatser