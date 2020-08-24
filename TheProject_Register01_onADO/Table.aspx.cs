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
    public partial class Table : System.Web.UI.Page
    {
        SqlConnection _connectionn;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Чтение значения строки подключения из web.config из секции <connectionStrings>
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            // Настройка объекта подключения к базе и открытие подключения.
            _connectionn = new SqlConnection(connectionString);
            _connectionn.Open();

            try
            {
                //В общем, я не стал париться с тем, как сделать проверку записи на уникальность. 
                //Поэтому в бд может творится хаус, но так как мы выбираем только уникальные значения нам пофиг.
                SqlCommand command = new SqlCommand
                ("SELECT [Id] FROM [Users] WHERE (([Login] = @Login) AND ([Password] = @Password))", _connectionn);


                command.Parameters.AddWithValue("Login", Session["LoginSS"]);
                command.Parameters.AddWithValue("Password", Session["PasswordSS"]);


                if (command.ExecuteScalar() != null)
                {
                    Session["idSS"] = Convert.ToInt32(command.ExecuteScalar());
                }

                //Проверка на наличие доступа к доменам

                SqlCommand command2 = new SqlCommand
                ("SELECT DISTINCT [IdUser] FROM [Tables] WHERE ([IdUser] = @IdUser)", _connectionn);
                // Инициализация переменных в запросе.

                command2.Parameters.AddWithValue("IdUser", Session["idSS"]);

                //command2.ExecuteNonQuery();

                    if (command2.ExecuteScalar() == null)
                    {
                        Label2.Visible = true;
                    }

                //Проверка на доступ к добавлению данных
                
                //SqlCommand command3 = new SqlCommand
                //("SELECT IdUser From (SELECT DISTINCT [IdUser], [Domens] FROM [Tables] WHERE ([IdUser] = @IdUser) )", _connectionn);
                //// Инициализация переменных в запросе.

                //command3.Parameters.AddWithValue("IdUser", Session["idSS"]);

                ////command3.ExecuteNonQuery();

                //if (command3.ExecuteScalar() == null)
                //{
                //   Button1.Enabled = false;
                //}

            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex);
            }
            
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
            try
            {
                SqlCommand command = new SqlCommand
                ("INSERT INTO Tables (IdUser, Domens) VALUES(@Id, @Domens)", _connectionn);
                // Инициализация переменных в запросе.

                command.Parameters.AddWithValue("Id", TextBox1.Text);
                command.Parameters.AddWithValue("Domens", DropDownList1.SelectedValue);

                // Выполнение запроса.

                command.ExecuteNonQuery();
                Label1.Visible = true;
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex);
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/WebForm1.aspx");
        }
    }
    }
