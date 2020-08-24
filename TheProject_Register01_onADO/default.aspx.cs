using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TheProject_Register01_onADO
{
    public partial class _default : System.Web.UI.Page
    {

        SqlConnection _connectionn;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Чтение значения строки подключения из web.config из секции <connectionStrings>
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            // Настройка объекта подключения к базе и открытие подключения.
            _connectionn = new SqlConnection(connectionString);
            _connectionn.Open();
        }

        protected void Page_Unload(object sender, EventArgs e)
        {
            // При выгрузке страницы из памяти сервера закрываем подключение к базе данных.
            if (_connectionn != null && _connectionn.State != ConnectionState.Closed)
            {
                _connectionn.Close();
            }
        }



        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["LoginSS"] = inputLogin.Text;
            Session["PasswordSS"] = inputPassword.Text;
            Session.Timeout = 30;
            try
                {
                    SqlCommand command = new SqlCommand
                    ("SELECT * FROM Users WHERE Login = @Login And Password = @Password", _connectionn);
                    // Инициализация переменных в запросе.

                    command.Parameters.AddWithValue("Login", inputLogin.Text);
                    command.Parameters.AddWithValue("Password", inputPassword.Text);

                    // Выполнение запроса.
                    command.ExecuteScalar();
                if (command.ExecuteScalar() != null)
                {
                    Response.Redirect("~/Table.aspx");
                }
                else
                {
                    Label1.Visible = true;
                }
                }
                catch (Exception ex)
                {
                    Response.Write("Error: " + ex);
                }
            }
        
    }
}