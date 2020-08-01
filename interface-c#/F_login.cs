using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Threading;
using System.Data.SqlClient;

namespace Interface_SportShop
{
    public partial class F_login : Form
    {
        private SqlConnection cn;
        public F_login()
        {
            InitializeComponent();
        }

        private void F_login_Load(object sender, EventArgs e)
        {
            cn = getSGBDConnection();
            if (!verifySGBDConnection())
            {
                return;
            }
        }

        private void btn_login_Click(object sender, EventArgs e)
        {
            //get typed informactions
            string workid = tb_workid.Text.Trim();
            string pass = tb_password.Text;
            //validation

            string sql = "SELECT * FROM SPORT_SHOP.Funcionario WHERE work_ID ="+workid+ "AND [password] = '"+ pass + "'";
            SqlDataAdapter da = null;
            DataTable dt = new DataTable();
            var cmd = cn.CreateCommand();
            try 
            {
                cmd.CommandText = sql;
                da = new SqlDataAdapter(cmd.CommandText, cn);
                da.Fill(dt);
            }
            catch (Exception ex)
            {
                
            }

            if (dt.Rows.Count == 1)
            {           
                cn.Close();
                F_main f_main = new F_main(this, workid);
                f_main.Show();
                this.Hide();
            }
            else 
            {
                    MessageBox.Show("Login ou Senha incorretos");
             }

        }
            
 
        private SqlConnection getSGBDConnection()
        {
            return new SqlConnection("data source =DESKTOP-6FL8J2P;integrated security=true;initial catalog=SPORT_SHOP");
        }

        private bool verifySGBDConnection()
        {
            if (cn == null)
                cn = getSGBDConnection();

            if (cn.State != ConnectionState.Open)
                cn.Open();

            return cn.State == ConnectionState.Open;
        }

        private void F_login_FormClosing(object sender, FormClosingEventArgs e)
        {
            cn.Close();
        }
    }
}
