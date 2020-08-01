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
    public partial class F_funcionarios : Form
    {
        F_main f_main;
        public F_funcionarios(F_main f)
        {
            InitializeComponent();
            f_main = f;
        }


        private void F_funcionarios_Load(object sender, EventArgs e)
        {
            dgv_funcionarios.DataSource = f_main.obterFuncionario(f_main.cn);
            dgv_funcionarios.Columns[0].Width = 240;
            dgv_funcionarios.Columns[1].Width = 195;
            dgv_funcionarios.Columns[2].Width = 195;
            dgv_funcionarios.Columns[3].Width = 100;
        }

        private void btn_vendas_Click(object sender, EventArgs e)
        {
            f_main.menuControl(1);
        }

        private void F_funcionarios_FormClosing(object sender, FormClosingEventArgs e)
        {
            f_main.Close();
        }

        private void btn_produtos_Click(object sender, EventArgs e)
        {
            f_main.menuControl(2);
        }

        private void btn_financas_Click(object sender, EventArgs e)
        {
            f_main.menuControl(3);
        }

        private void btn_Clientes_Click(object sender, EventArgs e)
        {
            f_main.menuControl(4);
        }

        private void btn_addprod_Click(object sender, EventArgs e)
        {
            if (tb_cartcid.Text.Equals("") || tb_nome.Text.Equals("") || tb_pass1.Text.Equals("") || tb_pass2.Text.Equals(""))
            {
                MessageBox.Show("Preencha todos os campos!");
            }
            else if (!(tb_pass1.Text.Equals(tb_pass2.Text)))
            {
                MessageBox.Show("As senhas inseridas não coincidem");
            }
            else if (!(int.TryParse(tb_cartcid.Text, out _)))
            {
                MessageBox.Show("Cartão Cidadão invalido!");
            }
            else
            {
                string sql = "EXEC p_Create_Funcionario @num_ID = " + tb_cartcid.Text + ", @password = '" + tb_pass1.Text + "', @nome = '" + tb_nome.Text + "', @loja_code = " + f_main.loja_code;
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
                dgv_funcionarios.DataSource = f_main.obterFuncionario(f_main.cn);

                tb_cartcid.Text = "";
                tb_nome.Text = "";
                tb_pass1.Text = "";
                tb_pass2.Text = "";
                MessageBox.Show("Funcionario adicionado com sucesso!");

            }
        }

        private void btn_canceladdprod_Click(object sender, EventArgs e)
        {

            tb_cartcid.Text = "";
            tb_nome.Text = "";
            tb_pass1.Text = "";
            tb_pass2.Text = "";
        }

        private void button3_Click(object sender, EventArgs e)
        {
            if (tb_searchworkid.Text.Equals(""))
            {
                MessageBox.Show("Preencha o campo Work ID!");
            }
            else
            {
                if (int.TryParse(tb_searchworkid.Text, out _))
                {
                    DataTable dt = f_main.obterFuncionarioById(f_main.cn, tb_searchworkid.Text);
                    if (dt.Rows.Count == 1)
                    {
                        lb_remonome.Text = dt.Rows[0][0].ToString();
                        lb_remolc.Text = dt.Rows[0][3].ToString();
                        lb_remocc.Text = dt.Rows[0][1].ToString();
                    }
                    else
                    {
                        MessageBox.Show("Work ID invalido!");
                    }
                }
                else
                {
                    MessageBox.Show("Work ID invalido!");
                }

            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            tb_searchworkid.Text = "";
            lb_remocc.Text = "";
            lb_remolc.Text = "";
            lb_remonome.Text = "";
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (tb_searchworkid.Text.Equals(""))
            {
                MessageBox.Show("Insira um Work ID");
            }
            else if ((f_main.obterFuncionarioById(f_main.cn, tb_searchworkid.Text).Rows.Count == 1))
            {
                string sql = "EXEC p_Delete_Funcionario @work_ID = " + tb_searchworkid.Text;
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
                MessageBox.Show("Funcionario removido com sucesso!");
                tb_searchworkid.Text = "";
                lb_remocc.Text = "";
                lb_remonome.Text = "";
                lb_remolc.Text = "";
                dgv_funcionarios.DataSource = f_main.obterFuncionario(f_main.cn);
            }
            else
            {
                MessageBox.Show("Work ID invalido!");
            }
        }
    }
}
