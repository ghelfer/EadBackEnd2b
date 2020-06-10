using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EadBackEnd2b
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        { }

        protected void btn_Click(object sender, EventArgs e)
        {
            string cpf = txtCPF.Text;
            string email = txtEmail.Text;
            
            //encriptação simples
            byte[] bytes = Encoding.ASCII.GetBytes(cpf);
            string cpf2 = Convert.ToBase64String(bytes);

            try
            {
                MySqlConnection con = new MySqlConnection(Provider.StrConnection());
                con.Open();
                string sql = "INSERT INTO usuarios (cpf,email) VALUES ('" + cpf2 + "','" + email + "')";
                MySqlCommand command = new MySqlCommand(sql, con);
                //Executa a Query SQL
                command.ExecuteNonQuery();
                // Fecha a conexão
                con.Close();
                labRes.Text = "Dados gravados com sucesso!";
            }
            catch (Exception ex)
            {
                labRes.Text = "Erro ao gravados dados!";
                Debug.WriteLine(ex.Message);
            }
        }

        protected void btn2_Click(object sender, EventArgs e)
        {
            try
            {
                string cpf = txtCPF.Text;
                MySqlConnection con = new MySqlConnection(Provider.StrConnection());
                con.Open();
                string sql = "SELECT email FROM usuarios WHERE cpf = " + cpf + ";";
                MySqlCommand command = new MySqlCommand(sql, con);
                object email = command.ExecuteScalar();
                con.Close();

                labRes2.Text = email.ToString();
            }
            catch (Exception ex)
            {
                labRes2.Text = "Erro ao buscar dados!";
                Debug.WriteLine(ex.Message);
            }
        }
    }

    
}

