using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;

namespace BackEnd
{
    public class DatabaseSQLExpress

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

        public void InsertHundredParkingSpacesInParkingLot()
        {
            string query = "INSERT INTO Parkinglot(size) VALUES(0)";
            SqlConnection conn = DataBaseCon();
            SqlDataReader rdr = null;

            try
            {
                conn.Open(); // open connection
                SqlCommand sqlCmd = new SqlCommand(); // sql command
                for (int i = 1; i <= 100; i++)
                {
                    sqlCmd.CommandText = query;
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
        }

        static SqlConnection DataBaseCon()
        {
            SqlConnection conn = new SqlConnection(
             //"Data Source=(localhost);Initial Catalog=NorthwindDB;Integrated Security=SSPI");
             @"Server=LAPTOP-14R42PPR\SQLEXPRESS;Database=PPDBStefanTrenh;Integrated Security=SSPI;");
            return conn;
        }
    }
}
