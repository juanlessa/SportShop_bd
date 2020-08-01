using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace Interface_SportShop
{
    public partial class F_clientes : Form
    {
        F_main f_main;
        public F_clientes(F_main f)
        {
            InitializeComponent();
            f_main = f;
        }

        private void bnt_Funcionarios_Click(object sender, EventArgs e)
        {
            f_main.menuControl(5);
        }

        private void btn_financas_Click(object sender, EventArgs e)
        {
            f_main.menuControl(3);
        }

        private void btn_produtos_Click(object sender, EventArgs e)
        {
            f_main.menuControl(2);
        }

        private void btn_vendas_Click(object sender, EventArgs e)
        {
            f_main.menuControl(1);
        }

        private void F_clientes_FormClosing(object sender, FormClosingEventArgs e)
        {
            f_main.Close();
        }

        private void F_clientes_Load(object sender, EventArgs e)
        {
            dgv_clientes.DataSource = f_main.obterTodosClientes(f_main.cn);
            dgv_clientes.Columns[0].Width = 250;
            dgv_clientes.Columns[1].Width = 190;
            dgv_clientes.Columns[2].Width = 290;
            //dgv_clientes.colunm[0].width
        }

        private void btn_addprod_Click(object sender, EventArgs e)
        {
            if (tb_addcc.Text.Equals("") || tb_addnome.Text.Equals("") || tb_addmail.Text.Equals(""))
            {
                MessageBox.Show("Preencha todos os campos");
            }
            else
            {
                if(int.TryParse(tb_addcc.Text, out _))
                {
                    string sql = "EXEC p_Create_Cliente @num_ID = " + tb_addcc.Text +", @mail = '" + tb_addmail.Text + "', @nome = '" + tb_addnome.Text + "'";
                    SqlDataAdapter da = null;
                    DataTable dt = new DataTable();
                    var cmd = f_main.cn.CreateCommand();
                    try
                    {
                        cmd.CommandText = sql;
                        da = new SqlDataAdapter(cmd.CommandText, f_main.cn);
                        da.Fill(dt);
                    }
                    catch (Exception ex)
                    {

                    }
                    dgv_clientes.DataSource = f_main.obterTodosClientes(f_main.cn);


                    tb_addcc.Text = "";
                    tb_addmail.Text = "";
                    tb_addnome.Text = "";
                    MessageBox.Show("Cliente adicionado com sucesso!");
                }
                else
                {
                    MessageBox.Show("Cartão Cidadão invalido!");
                }
            }
        }

        private void btn_canceladdprod_Click(object sender, EventArgs e)
        {
            tb_addcc.Text = "";
            tb_addmail.Text = "";
            tb_addnome.Text = "";
        }

        private void button3_Click(object sender, EventArgs e)
        {
            if (tb_searchnumid.Text.Equals(""))
            {
                MessageBox.Show("Preencha o campo Cartão Cidadão!");
            }
            else
            {
                if (int.TryParse(tb_searchnumid.Text, out _))
                {
                    DataTable dt = f_main.obterWithNome(f_main.cn, tb_searchnumid.Text);
                    if (dt.Rows.Count ==1)
                    {
                        lb_remonome.Text = dt.Rows[0][0].ToString();
                        lb_remomail.Text = dt.Rows[0][2].ToString();
                    }
                    else
                    {
                        MessageBox.Show("Cartão Cidadão invalido!");
                    }
                }
                else
                {
                    MessageBox.Show("Cartão Cidadão invalido!");
                }

            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (tb_searchnumid.Text.Equals(""))
            {
                MessageBox.Show("Insira um Cartão Cidadão");
            }
            else if ((f_main.obterWithNome(f_main.cn, tb_searchnumid.Text).Rows.Count == 1))
            {
                string sql = "EXEC p_Delete_Cliente @num_ID = " + tb_searchnumid.Text;
                SqlDataAdapter da = null;
                DataTable dt = new DataTable();
                var cmd = f_main.cn.CreateCommand();
                try
                {
                    cmd.CommandText = sql;
                    da = new SqlDataAdapter(cmd.CommandText, f_main.cn);
                    da.Fill(dt);
                }
                catch (Exception ex)
                {

                }
                MessageBox.Show("Cliente removido com sucesso!");
                tb_searchnumid.Text = "";
                lb_remomail.Text = "";
                lb_remonome.Text = "";
                dgv_clientes.DataSource = f_main.obterTodosClientes(f_main.cn);
            }
            else
            {
                MessageBox.Show("Cartão Cidadão invalido!");
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            tb_searchnumid.Text = "";
            lb_remomail.Text = "";
            lb_remonome.Text = "";
        }
    }
}
