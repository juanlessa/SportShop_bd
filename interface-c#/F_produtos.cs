using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Globalization;
using System.Data.SqlClient;



namespace Interface_SportShop
{
    public partial class F_produtos : Form
    {
        F_main f_main;
        public F_produtos(F_main f)
        {
            InitializeComponent();
            f_main = f;
        }

        private void btn_vendas_Click(object sender, EventArgs e)
        {
            f_main.menuControl(1);
        }
        private void btn_financas_Click(object sender, EventArgs e)
        {
            f_main.menuControl(3);
        }

        private void F_produtos_FormClosing(object sender, FormClosingEventArgs e)
        {
            f_main.Close();
        }

        private void F_produtos_Load(object sender, EventArgs e)
        {
            dgv_produtos.DataSource = f_main.obterTodosProdutos(f_main.cn, f_main.loja_code);
            dgv_produtos.Columns[0].Width = 98;
            dgv_produtos.Columns[1].Width = 122;
            dgv_produtos.Columns[2].Width = 100;
            dgv_produtos.Columns[3].Width = 110;
            dgv_produtos.Columns[4].Width = 100;
            dgv_produtos.Columns[5].Width = 95;
            dgv_produtos.Columns[6].Width = 105;
        }

        private void comboBox1_SelectedValueChanged(object sender, EventArgs e)
        {
            cb_especificidade.Items.Clear();
            if (cb_tipoprod.Text.Equals("1 - Roupa"))
            {
                cb_especificidade.Items.Add("XS");
                cb_especificidade.Items.Add("S");
                cb_especificidade.Items.Add("M");
                cb_especificidade.Items.Add("L");
                cb_especificidade.Items.Add("XL");
            }
            else if (cb_tipoprod.Text.Equals("2 - Sapatilha"))
            {
                cb_especificidade.Items.Add("35");
                cb_especificidade.Items.Add("36");
                cb_especificidade.Items.Add("37");
                cb_especificidade.Items.Add("38");
                cb_especificidade.Items.Add("39");
                cb_especificidade.Items.Add("40");
                cb_especificidade.Items.Add("41");
                cb_especificidade.Items.Add("42");
                cb_especificidade.Items.Add("43");
                cb_especificidade.Items.Add("44");
            }
            else if (cb_tipoprod.Text.Equals("3 - Haltere"))
            {
                cb_especificidade.Items.Add("1kg");
                cb_especificidade.Items.Add("2kg");
                cb_especificidade.Items.Add("5kg");
                cb_especificidade.Items.Add("7.5kg");
                cb_especificidade.Items.Add("10kg");
                cb_especificidade.Items.Add("12.5kg");
                cb_especificidade.Items.Add("15kg");
                cb_especificidade.Items.Add("17.5kg");
                cb_especificidade.Items.Add("20kg");
                cb_especificidade.Items.Add("25kg");
                cb_especificidade.Items.Add("27.5kg");
                cb_especificidade.Items.Add("30kg");
            }
            else if (cb_tipoprod.Text.Equals("4 - Acessorio de Desporto"))
            {
                cb_especificidade.Items.Add("Futebol");
                cb_especificidade.Items.Add("Basquetebol");
                cb_especificidade.Items.Add("Voleibol");
                cb_especificidade.Items.Add("Andebol");
                cb_especificidade.Items.Add("Golfe");
                cb_especificidade.Items.Add("Ténis");
                cb_especificidade.Items.Add("Basebol");
                cb_especificidade.Items.Add("Ping-Pong");
            }
        }

        private void btn_addprod_Click(object sender, EventArgs e)
        {
            if (tb_nomeprod.Text.Equals("") || tb_marca.Text.Equals("") || tb_preço.Text.Equals("") || cb_especificidade.Text.Equals("") || cb_tipoprod.Text.Equals(""))
            {
                MessageBox.Show("Preencha todos os campos!");
            }
            else
            {
                if (Double.TryParse(tb_preço.Text, out _))
                {
                    double b = Double.Parse(tb_preço.Text);
                    string[] tipo = cb_tipoprod.Text.Split(' ');
          
                    string sql = "EXEC p_Create_Produto @nome = '" + tb_nomeprod.Text + "', @marca = '" + tb_marca.Text + "', @especificidade = '" + cb_especificidade.Text + "', @preco = "+ b.ToString(new CultureInfo("en-US")) + ", @loja_code = " + f_main.loja_code + ", @tipo_ID = " + tipo[0];
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
                    dgv_produtos.DataSource = f_main.obterTodosProdutos(f_main.cn, f_main.loja_code);
                    tb_nomeprod.Text = "";
                    tb_marca.Text = "";
                    tb_preço.Text = "";
                    MessageBox.Show("Produto adicionado com sucesso!");

                }
            }
        }

        private void btn_canceladdprod_Click(object sender, EventArgs e)
        {
            tb_nomeprod.Text = "";
            tb_marca.Text = "";
            tb_preço.Text = "";
        }

        private void bnt_Funcionarios_Click(object sender, EventArgs e)
        {
            f_main.menuControl(5);
        }

        private void btn_Clientes_Click(object sender, EventArgs e)
        {
            f_main.menuControl(4);
        }

        private void button3_Click(object sender, EventArgs e)
        {
            DataTable dt = f_main.obterProduto(f_main.cn, tb_searchpid.Text, f_main.loja_code);
            if (dt.Rows.Count ==1)
            {
                lb_addnome.Text = dt.Rows[0][1].ToString();
                lb_addmarca.Text = dt.Rows[0][2].ToString();
                lb_addesp.Text = dt.Rows[0][3].ToString();
                lb_addpreco.Text = dt.Rows[0][4].ToString() + " €";
            }
            else
            {
                MessageBox.Show("Produto ID invalido!");
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            lb_addnome.Text = "";
            lb_addmarca.Text = "";
            lb_addesp.Text = "";
            lb_addpreco.Text = "";
            nud_addarm.Value = 0;
            nud_addloja.Value = 0;
            tb_searchpid.Text = "";
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if ((nud_addarm.Value > 0 || nud_addloja.Value > 0) && !(tb_searchpid.Text.Equals("")) && (f_main.obterProduto(f_main.cn, tb_searchpid.Text, f_main.loja_code).Rows.Count == 1))
            {
                string sql = "EXEC p_Update_Stock @produto_ID = " + tb_searchpid.Text + ", @quantidade_Loja = "+ nud_addloja.Value +", @quantidade_Armazem = " + nud_addarm.Value;
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
                MessageBox.Show("Quantidades adicionadas com sucesso!");
                dgv_produtos.DataSource = f_main.obterTodosProdutos(f_main.cn, f_main.loja_code);
                lb_addnome.Text = "";
                lb_addmarca.Text = "";
                lb_addesp.Text = "";
                lb_addpreco.Text = "";
                nud_addarm.Value = 0;
                nud_addloja.Value = 0;
                tb_searchpid.Text = "";
            }
            else
            {
                MessageBox.Show("Quantidades ou Produto ID invalidos!");
            }
        }

        private void btn_search_Click(object sender, EventArgs e)
        {
            if ("Sem Filtro".Equals(gb_filtros.Controls.OfType<RadioButton>().SingleOrDefault(RadioButton => RadioButton.Checked).Text))
            {
                dgv_produtos.DataSource = f_main.obterTodosProdutos(f_main.cn, f_main.loja_code);
            }
            else if (tb_search.Text.Equals(""))
            {
                MessageBox.Show("Preencha o campo de busca!");
            }
            else
            {
                string filtra = "";
                filtra = gb_filtros.Controls.OfType<RadioButton>().SingleOrDefault(RadioButton => RadioButton.Checked).Text;
                if (filtra.Equals(""))
                {
                    MessageBox.Show("Selecione um filtro");
                }
                else
                {
                    if ("Produto ID".Equals(filtra) && int.TryParse(tb_search.Text, out _))
                    {
                        filtra = "SPORT_SHOP.Produto.produto_ID = " + tb_search.Text;
                        dgv_produtos.DataSource = f_main.obterProdutoFiltrado(f_main.cn, f_main.loja_code, filtra);
                    }
                    else if ("Marca".Equals(filtra))
                    {
                        filtra = "SPORT_SHOP.Produto.marca = '" + tb_search.Text + "'";
                        dgv_produtos.DataSource = f_main.obterProdutoFiltrado(f_main.cn, f_main.loja_code, filtra);
                    }
                    else if ("Nome".Equals(filtra))
                    {
                        filtra = "SPORT_SHOP.Produto.nome_Produto = '" + tb_search.Text +"'";
                        dgv_produtos.DataSource = f_main.obterProdutoFiltrado(f_main.cn, f_main.loja_code, filtra);
                    }
                    else if ("Sem Filtro".Equals(filtra))
                    {
                        dgv_produtos.DataSource = f_main.obterTodosProdutos(f_main.cn, f_main.loja_code);
                    }
                    else
                    {
                        MessageBox.Show("Parametro de busca invalido");
                    }

                }
            }
        }
    }
}
