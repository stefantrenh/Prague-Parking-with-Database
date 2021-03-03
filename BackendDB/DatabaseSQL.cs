using System;
using System.Data.SqlClient;
using System.Collections.Generic;

namespace BackendDB
{
    public class DatabaseSQL
    {
        static void InsertVehicle()
        {
            string query = "";
            SqlConnection conn = DataBaseCon();
            SqlDataReader rdr = null;

            try
            {
                conn.Open(); // open connection
                SqlCommand sqlCmd = new SqlCommand(query, conn); // sql command
            }
            finally
            {
                // close the reader
                if (rdr != null)
                {
                    rdr.Close();
                }
                // 5. Close the connection
                if (conn != null)
                {
                    conn.Close();
                }

            }
        }
        public string OptimizeMc()
        {
            string query = "EXEC OptimizeMC";
            SqlConnection conn = DataBaseCon();
            SqlDataReader rdr = null;

            try
            {
                conn.Open(); // open connection
                SqlCommand sqlCmd = new SqlCommand(query, conn); // sql command
                sqlCmd.ExecuteNonQuery();
            }
            catch (Exception)
            {
                return null;
            }
            finally
            {
                // close the reader
                if (rdr != null)
                {
                    rdr.Close();
                }
                // 5. Close the connection
                if (conn != null)
                {
                    conn.Close();
                }

            }
            return "The parking lot has been optimized!";
        }
        public List<OrderHistory> GetOrderHistoryDataFromIntervalls(string firstIntervall,string secondIntervall)
        {
            string query = $"EXEC CountIntervallDateIncome '{firstIntervall}' , '{secondIntervall}'";
            SqlConnection conn = DataBaseCon();
            SqlDataReader rdr = null;
            List<OrderHistory> orderHistories = new List<OrderHistory>();
            try
            {
                conn.Open(); // open connection
                SqlCommand sqlCmd = new SqlCommand(query, conn); // sql command
                rdr = sqlCmd.ExecuteReader();
                while (rdr.Read())
                {
                    OrderHistory order = new OrderHistory();
                    order.Price = rdr.GetDecimal(1);
                    order.Avarage = rdr.GetDecimal(2);
                    order.DailyCashFlow = rdr.GetDecimal(3);
                    orderHistories.Add(order);
                }
            }
            finally
            {
                // close the reader
                if (rdr != null)
                {
                    rdr.Close();
                }
                // 5. Close the connection
                if (conn != null)
                {
                    conn.Close();
                }
            }
            return orderHistories;
        }
        public List<OrderHistory> DailyIncomeReports()
        {
            string query = "SELECT CAST(CheckedOut AS date) AS [Date], SUM(Price) AS [Daily Income],AVG(Price) AS [Avarage Income] " +
                "FROM OrderHistory GROUP BY CAST(CheckedOut AS date)";
            SqlConnection conn = DataBaseCon();
            SqlDataReader rdr = null;
            List<OrderHistory> orders = new List<OrderHistory>();
            try
            {
                conn.Open(); // open connection
                SqlCommand sqlCmd = new SqlCommand(query, conn); // sql command
                rdr = sqlCmd.ExecuteReader();
                while (rdr.Read()) 
                {
                    OrderHistory orderHistory = new OrderHistory();
                    DateTime date = (DateTime)rdr[0];
                    string dateString = date.ToString("yyyy-MM-dd");
                    orderHistory.Description = dateString;
                    orderHistory.Price = rdr.GetDecimal(1);
                    orderHistory.Avarage = rdr.GetDecimal(2);
                    orders.Add(orderHistory);
                }
            }
            finally
            {
                // close the reader
                if (rdr != null)
                {
                    rdr.Close();
                }
                // 5. Close the connection
                if (conn != null)
                {
                    conn.Close();
                }

            }
            return orders;
        }  
        public List<OrderHistory> GetOrderHistoryLog() //orderhistory logg
        {
        
            List<OrderHistory> list = new List<OrderHistory>();
            string query = "SELECT * FROM OrderHistory";
            SqlConnection conn = DataBaseCon();
            SqlDataReader rdr = null;
            
            try
            {
                conn.Open(); // open connection
                SqlCommand sqlCmd = new SqlCommand(query, conn); // sql command
                rdr = sqlCmd.ExecuteReader();
                while (rdr.Read())
                {
                    OrderHistory orders = new OrderHistory();
                    orders.ID = (int)rdr[0];
                    orders.CheckedIn = (DateTime)rdr[1];
                    orders.CheckedOut = (DateTime)rdr[2];
                    orders.Price = (decimal)rdr[3];
                    orders.License = (string)rdr[4];

                    list.Add(orders);
                }
                
            }
            finally
            {
                // close the reader
                if (rdr != null)
                {
                    rdr.Close();
                }
                // 5. Close the connection
                if (conn != null)
                {
                    conn.Close();
                }           
            }
            return list;
        } 
        public List<Vehicle> IfParkedMoreThanTwoDays() // kollar vilka reg som är parkerad mer än 2 dagar
        {
            List<Vehicle> list = new List<Vehicle>();
            string query = "SELECT ve.LicensePlate " +
                "FROM Vehicle ve " +
                "WHERE DATEDIFF(HOUR,ve.CheckedIn,GETDATE()) >= 48";
            SqlConnection conn = DataBaseCon();
            SqlDataReader rdr = null;
  
            try
            {
                conn.Open(); // open connection
                SqlCommand sqlCmd = new SqlCommand(query, conn); // sql command
                rdr = sqlCmd.ExecuteReader();
                while (rdr.Read())
                {
                    Vehicle vehicle = new Vehicle();
                    vehicle.LicensePlate = rdr.GetString(0);
                    list.Add(vehicle);
                }
            }
            finally
            {
                // close the reader
                if (rdr != null)
                {
                    rdr.Close();
                }
                // 5. Close the connection
                if (conn != null)
                {
                    conn.Close();
                }

            }
            return list;
        }
        public Vehicle GetRemoveVehicleData(string reg)
        {
            string query = $"EXEC GetRemoveData '{reg}'";
            SqlConnection conn = DataBaseCon();
            SqlDataReader rdr = null;
            Vehicle vehicle = new Vehicle();

            try
            {
                conn.Open(); // open connection
                SqlCommand sqlCmd = new SqlCommand(query, conn); // sql command
                rdr = sqlCmd.ExecuteReader();
                while (rdr.Read())
                {
                    vehicle.LicensePlate = rdr.GetString(2);
                    vehicle.VehicleTypeId = rdr.GetInt32(1);
                    vehicle.ExtraValue = rdr.GetInt32(0); //parkingsid
                }
            }
            finally
            {
                // close the reader
                if (rdr != null)
                {
                    rdr.Close();
                }
                // 5. Close the connection
                if (conn != null)
                {
                    conn.Close();
                }

            }
            return vehicle;
        } // sök metod via reg och hämtar ut reg, fordonstypid samt parkingsid, return object
        public string UpdateParkingLotAfterDeletion(int vehicleType,int parkingLotID)
        {
            string query = $"EXEC updateParkinglotAfterDelete {vehicleType},{parkingLotID}";
            SqlConnection conn = DataBaseCon();
            SqlDataReader rdr = null;

            try
            {
                conn.Open(); // open connection
                SqlCommand sqlCmd = new SqlCommand(query, conn); // sql command
                sqlCmd.ExecuteNonQuery();
            }
            finally
            {
                // close the reader
                if (rdr != null)
                {
                    rdr.Close();
                }
                // 5. Close the connection
                if (conn != null)
                {
                    conn.Close();
                }

            }
            return "The ParkingSpot Are Now availbe.";
        }  // Updaterar Size på Parkering  //object FIX!
        public Vehicle GetFullDataOfVehicleBeforeCheckout(string license)
        {
            string query = $"EXEC GetFullDataOfVehicleBeforeCheckout {license}";
            SqlConnection conn = DataBaseCon();
            SqlDataReader rdr = null;
            Vehicle vehicle = new Vehicle();
            try
            {
                conn.Open(); // open connection
                SqlCommand sqlCmd = new SqlCommand(query, conn); // sql command
                rdr = sqlCmd.ExecuteReader();
                while (rdr.Read())
                {
                    vehicle.ParkID = rdr.GetInt32(0);
                    vehicle.LicensePlate = rdr.GetString(1);
                    vehicle.Description = rdr.GetString(2);
                    vehicle.CheckIn = rdr.GetDateTime(3);
                    vehicle.CheckOut = rdr.GetDateTime(4);
                    vehicle.Price = rdr.GetDecimal(5);
                    //Console.WriteLine($"\tParking Space: {rdr[0]}\tLicenseplate: {rdr[1]}\tVehicle Type: {rdr[2]}");
                    //Console.WriteLine($"Checked IN: {rdr[3]}\t\tChecked Out: {rdr[4]}\tPrice: {rdr[5]}");
                }
            }

            catch
            {
                return null;
            }
            finally
            {
                // close the reader
                if (rdr != null)
                {
                    rdr.Close();
                }
                // 5. Close the connection
                if (conn != null)
                {
                    conn.Close();
                }
            }
            return vehicle;
        }  // "Kvitto" vid utcheckning -- objekt fix!
        public string DeleteVehicleAfterCheckOut(string license)
        {
            string query = $"EXEC DeleteVehicleFromTableWhenCheckOut {license}";
            SqlConnection conn = DataBaseCon();
            SqlDataReader rdr = null;

            try
            {
                conn.Open(); // open connection
                SqlCommand sqlCmd = new SqlCommand(query, conn); // sql command
                sqlCmd.ExecuteNonQuery();
            }
            catch
                {
                return null;
                }

            finally
            {
                // close the reader
                if (rdr != null)
                {
                    rdr.Close();
                }
                // 5. Close the connection
                if (conn != null)
                {
                    conn.Close();
                }

            }
            return "The Vehicle Has Been Removed";
        }  // OBS! En Trigger görs! Orderhistory insertas
        public void CheckOutGetPrice(string license,int discount,int vehicleType)
        {
            string query = $"EXEC getPrice '{license}',{discount},{vehicleType}";
            SqlConnection conn = DataBaseCon();
            SqlDataReader rdr = null;

            try
            {
                conn.Open(); // open connection
                SqlCommand sqlCmd = new SqlCommand(query, conn); // sql command
                sqlCmd.ExecuteNonQuery();
            }
            finally
            {
                // close the reader
                if (rdr != null)
                {
                    rdr.Close();
                }
                // 5. Close the connection
                if (conn != null)
                {
                    conn.Close();
                }

            }
        } // checkar ut, hämtar pris via proc, DB
        public Vehicle FindVehicle(string reg)
        {
            string query = $"EXEC FindVehicle '{reg}'";
            SqlConnection conn = DataBaseCon();
            SqlDataReader rdr = null;
            Vehicle vehicle = new Vehicle();
            try
            {
                conn.Open(); // open connection
                SqlCommand sqlCmd = new SqlCommand(query, conn); // sql command
                rdr = sqlCmd.ExecuteReader();
                while (rdr.Read()) 
                {
                    vehicle.ParkID = rdr.GetInt32(0);
                    vehicle.LicensePlate = rdr.GetString(1);
                    vehicle.Description = rdr.GetString(2);
                    vehicle.CheckIn = rdr.GetDateTime(3);
                    //Console.ForegroundColor = ConsoleColor.DarkCyan;
                    //Console.WriteLine("{0}\t\t{1}\t\t\t{2}\t\t{3}", rdr[0], rdr[1], rdr[2], rdr[3]);
                    //Console.ForegroundColor = ConsoleColor.White;
                }

            }
            finally
            {
                // close the reader
                if (rdr != null)
                {
                    rdr.Close();
                }
                // 5. Close the connection
                if (conn != null)
                {
                    conn.Close();
                }
            }
            return vehicle;
        } // sök metod via reg 
        public string InsertVehicleBySelectedPlace(Vehicle vehicle,int parkinglotID)
        {
            string query = $"EXEC insertVehicle '{vehicle.LicensePlate}',{vehicle.VehicleTypeId},{parkinglotID}";
            SqlConnection conn = DataBaseCon();
            SqlDataReader rdr = null;

            try
            {
                conn.Open(); // open connection
                SqlCommand sqlCmd = new SqlCommand(query, conn); // sql command
                sqlCmd.ExecuteNonQuery();
            }
            catch (Exception)
            {
                return null;
            }
            finally
            {
                // close the reader
                if (rdr != null)
                {
                    rdr.Close();
                }
                // 5. Close the connection
                if (conn != null)
                {
                    conn.Close();
                }

            }
            return "";
        } // lägg till fordon vid angiven plats
        public void InsertHundredParkingSpacesInParkingLot()
        {
            string query = "INSERT INTO Parkinglot(size) VALUES(0)";
            SqlConnection conn = DataBaseCon();
            SqlDataReader rdr = null;

            try
            {
                conn.Open(); // open connection
                SqlCommand sqlCmd = new SqlCommand(query, conn); // sql command
                for (int i = 1; i <= 100; i++)
                {
                    sqlCmd.ExecuteNonQuery();
                }
            }
            finally
            {
                // close the reader
                if (rdr != null)
                {
                    rdr.Close();
                }
                // 5. Close the connection
                if (conn != null)
                {
                    conn.Close();
                }

            }
        } // metod för att skapa 100 parkeringplatser, OBS! sätt inte igång denna igen
        public void ParkingOverView()
        {
            string query = "SELECT * FROM Parkinglot";
            SqlConnection conn = DataBaseCon();
            SqlDataReader rdr = null;
            int count = 0;
            try
            {
                conn.Open(); // open connection
                SqlCommand sqlCmd = new SqlCommand(query, conn); // sql command
                rdr = sqlCmd.ExecuteReader();
                while (rdr.Read())
                {
                    count++;
                    if (count == 10 || count == 20 || count == 30 || count == 40 || count == 50 || count == 60 || count == 70 || count == 80 || count == 90)
                    {
                        Console.WriteLine("");
                    }
                    int size = rdr.GetInt32(1);
                    if (size == 0)
                    {
                        Console.ForegroundColor = ConsoleColor.Green;
                        Console.Write("[{0}]", rdr[0]);
                        Console.ForegroundColor = ConsoleColor.White;
                    }
                    else if (size == 1)
                    {
                        Console.ForegroundColor = ConsoleColor.Yellow;
                        Console.Write("[{0}]", rdr[0]);
                        Console.ForegroundColor = ConsoleColor.White;
                    }
                    else if (size == 2)
                    {
                        Console.ForegroundColor = ConsoleColor.Red;
                        Console.Write("[{0}]", rdr[0]);
                        Console.ForegroundColor = ConsoleColor.White;
                    }
                }
            }
            finally
            {
                // close the reader
                if (rdr != null)
                {
                    rdr.Close();
                }
                // 5. Close the connection
                if (conn != null)
                {
                    conn.Close();
                }

            }
        } // översikt i hela parkeringen
        public void ParkingOverViewForCarInsert()
        {
            string query = "SELECT * FROM Parkinglot";
            SqlConnection conn = DataBaseCon();
            SqlDataReader rdr = null;
            int count = 0;
            try
            {
                conn.Open(); // open connection
                SqlCommand sqlCmd = new SqlCommand(query, conn); // sql command
                rdr = sqlCmd.ExecuteReader();
                while (rdr.Read())
                {
                    count++;
                    if (count == 10 || count == 20 || count == 30 || count == 40 || count == 50 || count == 60 || count == 70 || count == 80 || count == 90)
                    {
                        Console.WriteLine("");
                    }
                    int size = rdr.GetInt32(1);
                    if (size == 0)
                    {
                        Console.ForegroundColor = ConsoleColor.Green;
                        Console.Write("[{0}]", rdr[0]);
                        Console.ForegroundColor = ConsoleColor.White;
                    }
                    else if (size == 1)
                    {
                        Console.ForegroundColor = ConsoleColor.Red;
                        Console.Write("[{0}]", rdr[0]);
                        Console.ForegroundColor = ConsoleColor.White;
                    }
                    else if (size == 2)
                    {
                        Console.ForegroundColor = ConsoleColor.Red;
                        Console.Write("[{0}]", rdr[0]);
                        Console.ForegroundColor = ConsoleColor.White;
                    }
                }
            }
            finally
            {
                // close the reader
                if (rdr != null)
                {
                    rdr.Close();
                }
                // 5. Close the connection
                if (conn != null)
                {
                    conn.Close();
                }

            }
        } // översikt i hela parkeringen
        public List<Vehicle> CurrentParkedVehicles()
        {
            string query = "SELECT park.ParkinglotID,ve.LicensePlate,veType.Vehicle,ve.CheckedIn " +
                "FROM Parkinglot park " +
                "JOIN Vehicle ve ON ve.ParkinglotID = park.ParkinglotID " +
                "JOIN VehicleType veType ON veType.VehicleTypeID = ve.VehicleTypeID " +
                "ORDER BY park.ParkinglotID";
            SqlConnection conn = DataBaseCon();
            SqlDataReader rdr = null;
            List<Vehicle> veList = new List<Vehicle>();
            try
            {
                conn.Open(); // open connection
                SqlCommand sqlCmd = new SqlCommand(query, conn); // sql command
                rdr = sqlCmd.ExecuteReader();
                while (rdr.Read())
                {
                    Vehicle vehicle = new Vehicle();
                    vehicle.ParkID = rdr.GetInt32(0);
                    vehicle.LicensePlate = rdr.GetString(1);
                    vehicle.Description = rdr.GetString(2);
                    vehicle.CheckIn = rdr.GetDateTime(3);

                    veList.Add(vehicle);
                }
            }
            finally
            {
                // close the reader
                if (rdr != null)
                {
                    rdr.Close();
                }
                // 5. Close the connection
                if (conn != null)
                {
                    conn.Close();
                }

            }
            return veList;
        } // En mer "finslippad" översikt på vilka fordon och vad.
        public List<int> ErrorHandlingIfWrongParkingLotIDInputForMC() // felhantering om man matar in fel parkeringsid
        {
            List<int> aps = new List<int>();
            string query = "EXEC AvailbleSpace 'MC'";
            SqlConnection conn = DataBaseCon();
            SqlDataReader rdr = null;
            try
            {
                
                conn.Open(); // open connection
                SqlCommand sqlCmd = new SqlCommand(query, conn); // sql command
                rdr = sqlCmd.ExecuteReader();
                while (rdr.Read())
                {
                    aps.Add(rdr.GetInt32(0));
                }
                Console.ForegroundColor = ConsoleColor.White;
                
            }
            finally
            {
                // close the reader
                if (rdr != null)
                {
                    rdr.Close();
                }
                // 5. Close the connection
                if (conn != null)
                {
                    conn.Close();
                }

            }
            return aps;
        }
        public List<int> ErrorHandlingIfWrongParkingLotIDInputForCar() // felhantering om man matar in fel parkeringsid
        {
            List<int> aps = new List<int>();
            string query = "EXEC AvailbleSpace 'CAR'";
            SqlConnection conn = DataBaseCon();
            SqlDataReader rdr = null;
            try
            {

                conn.Open(); // open connection
                SqlCommand sqlCmd = new SqlCommand(query, conn); // sql command
                rdr = sqlCmd.ExecuteReader();
                while (rdr.Read())
                {
                    aps.Add(rdr.GetInt32(0));
                }
                Console.ForegroundColor = ConsoleColor.White;

            }
            finally
            {
                // close the reader
                if (rdr != null)
                {
                    rdr.Close();
                }
                // 5. Close the connection
                if (conn != null)
                {
                    conn.Close();
                }

            }
            return aps;
        }
        public Vehicle GetVehicleObjectBackWhenSearchedByLicense(string reg)
        {
            string query = $"EXEC GetMoveData '{reg}'";
            SqlConnection conn = DataBaseCon();
            SqlDataReader rdr = null;
            Vehicle vehicle = new Vehicle();
            try
            {
                conn.Open(); // open connection
                SqlCommand sqlCmd = new SqlCommand(query, conn); // sql command
                rdr = sqlCmd.ExecuteReader();
                while (rdr.Read())
                {
                    vehicle.LicensePlate = rdr.GetString(0);
                    vehicle.VehicleTypeId = rdr.GetInt32(1);
                    vehicle.ExtraValue = rdr.GetInt32(2);
                }

            }
            finally
            {
                // close the reader
                if (rdr != null)
                {
                    rdr.Close();
                }
                // 5. Close the connection
                if (conn != null)
                {
                    conn.Close();
                }

            }
            return vehicle;
            
        } // metod som returnerar objekt reg,veType,ParkID
        public string MoveVehicle(string license,int vehicleType,int oldParkinglotID, int newParkinglotID)
        {
            string query = $"EXEC MoveVehicle '{license}',{vehicleType},{oldParkinglotID},{newParkinglotID}";
            SqlConnection conn = DataBaseCon();
            SqlDataReader rdr = null;

            try
            {
                conn.Open(); // open connection
                SqlCommand sqlCmd = new SqlCommand(query, conn); // sql command
                sqlCmd.ExecuteNonQuery();
            }
            finally
            {
                // close the reader
                if (rdr != null)
                {
                    rdr.Close();
                }
                // 5. Close the connection
                if (conn != null)
                {
                    conn.Close();
                }

            } return "The Vehicle has been Moved!";
        } // flyttar fordon
        static SqlConnection DataBaseCon()
        {
            SqlConnection conn = new SqlConnection(
             //"Data Source=(localhost);Initial Catalog=NorthwindDB;Integrated Security=SSPI");
             @"Server=LAPTOP-14R42PPR\SQLEXPRESS;Database=PPDBStefanTrenh;Integrated Security=SSPI;");
            return conn;
        } // av ren lathet orkar jag inte skriva detta hela tiden därför finns han.
    }
}

