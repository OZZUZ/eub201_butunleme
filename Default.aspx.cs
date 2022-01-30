using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace but1
{
    public partial class _Default : Page
    {
        public string orderBy = "ID";
        public string order = "desc";
        SqlConnection sqlConnection = new SqlConnection("Server=localhost;Database=master;Trusted_Connection=True;");
        public string tableStr = "";


        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            this.RefreshUsers();
        }

        /**
         * Ekleme düğmesi için fonksiyon
         */
        protected void Button1_Click(object sender, EventArgs e)
        {

            int id = int.Parse(TextBox1.Text), age = int.Parse(TextBox4.Text);
            int goals = int.Parse(TextBox6.Text), assists = int.Parse(TextBox7.Text);
            int yellowCards = int.Parse(TextBox8.Text), redCards = int.Parse(TextBox9.Text);
            string firstName = TextBox2.Text, lastName = TextBox3.Text;
            int active = CheckBox1.Checked ? 1 : 0;

            string sqlCommand = $"INSERT INTO Footballers (ID,firstName,lastName,age,active,goals,assists,yellowCards,redCards) values ({id}, '{firstName}', '{lastName}', {age}, {active}, {goals}, {assists}, {yellowCards}, {redCards})"; 
            
            sqlConnection.Open();
            SqlCommand command = new SqlCommand(sqlCommand, sqlConnection);
            command.ExecuteNonQuery();
            sqlConnection.Close();

            this.RefreshUsers();

        }


        /**
         * Güncelleme düğmesi için fonksiyon
         */
        protected void Button2_Click(object sender, EventArgs e)
        {
            
            int id = int.Parse(TextBox1.Text), age = int.Parse(TextBox4.Text);
            int goals = int.Parse(TextBox6.Text), assists = int.Parse(TextBox7.Text);
            int yellowCards = int.Parse(TextBox8.Text), redCards = int.Parse(TextBox9.Text);
            string firstName = TextBox2.Text, lastName = TextBox3.Text;
            int active = CheckBox1.Checked ? 1 : 0;

            string sqlCommand = $"UPDATE Footballers SET firstName='{firstName}', lastName='{lastName}', age={age}, active={active}, goals={goals}, assists={assists}, yellowCards={yellowCards}, redCards={redCards} where ID = {id}"; 

            sqlConnection.Open();
            SqlCommand command = new SqlCommand(sqlCommand, sqlConnection);
            command.ExecuteNonQuery();
            sqlConnection.Close();
            

            this.RefreshUsers();
        }

         /**
         * Silme düğmesi için fonksiyon
         */
        protected void Button3_Click(object sender, EventArgs e)
        {
            int id = int.Parse(TextBox1.Text);

            string sqlCommand = $"DELETE Footballers where ID = {id}"; 

            sqlConnection.Open();
            SqlCommand command = new SqlCommand(sqlCommand, sqlConnection);
            command.ExecuteNonQuery();
            sqlConnection.Close();

            this.RefreshUsers();
        }


         /**
         * SQL sorgusu yapıp tabloyu güncelleyen fonksiyon
         * Bu fonksiyon dinamik olarak tablonun satırlarını HTML olarak oluşturur
         */
        public void RefreshUsers()
        {
            this.order = DropDownList3.SelectedItem.Value;
            this.orderBy = DropDownList2.SelectedItem.Value;
            string htmlStr = "";
            SqlCommand command = new SqlCommand($"SELECT * from Footballers order by {orderBy} {order}", sqlConnection);           
            sqlConnection.Open();
            SqlDataReader reader = command.ExecuteReader();

            while (reader.Read())
            {
                int id = reader.GetInt32(0);
                string firstName = reader.GetString(1);
                string lastName = reader.GetString(2);
                int age = reader.GetInt32(3);
                string active = reader.GetBoolean(4) ? "Aktif" : "Emekli";
                int goals = reader.GetInt32(5);
                int assists = reader.GetInt32(6);
                int yellowCards = reader.GetInt32(7);
                int redCards = reader.GetInt32(8);
                htmlStr += $"<tr><td>{id}</td><td>{firstName}</td><td>{lastName}</td><td>{age}</td><td>{active}</td><td>{goals}</td><td>{assists}</td><td>{yellowCards}</td><td>{redCards}</td></tr>";
            }

            sqlConnection.Close();
            this.tableStr = htmlStr;
        }

        /**
        * Yenile düğmesi için fonksiyon
        */
        protected void Button4_Click(object sender, EventArgs e)
        {
            this.RefreshUsers();
        }
    }
}