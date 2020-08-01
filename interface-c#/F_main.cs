using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.Windows.Forms.VisualStyles;
using System.Globalization;

namespace Interface_SportShop
{
    public partial class F_main : Form
    {
        public SqlConnection cn;
        public string workid;
        public string loja_code;
        F_login f_login;
        F_produtos f_produtos;
        F_financas f_financas;
        F_funcionarios f_funcionarios;
        F_clientes f_clientes;

        DataTable produtos = new DataTable();
        DataRow p_row;
        DataColumn p_column;
        public F_main(F_login f,string work)
        {
            InitializeComponent();
            workid = work;
            f_login = f;
            f_produtos = new F_produtos(this);
            f_financas = new F_financas(this);
            f_funcionarios = new F_funcionarios(this);
            f_clientes = new F_clientes(this);
        }

        private void F_main_Load(object sender, EventArgs e)
        {
            cn = getSGBDConnection();
            if (!verifySGBDConnection())
            {
                return;
            }

            string sql = "SELECT loja_code FROM SPORT_SHOP.Funcionario WHERE work_ID = " + workid;
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
                loja_code = dt.Rows[0][0].ToString();
            }
            dgv_vendas.DataSource = obterVendas(cn);
            dgv_vendas.Columns[0].Width = 110;
            dgv_vendas.Columns[1].Width = 122;
            dgv_vendas.Columns[2].Width = 119;
            dgv_vendas.Columns[3].Width = 120;
            dgv_vendas.Columns[4].Width = 130;
            dgv_vendas.Columns[5].Width = 130;

            //datagridview para adicionar produto a venda

            p_column = new DataColumn();
            p_column.DataType = Type.GetType("System.String");
            p_column.ColumnName = "Produto ID";
            produtos.Columns.Add(p_column);
            p_column = new DataColumn();
            p_column.DataType = Type.GetType("System.String");
            p_column.ColumnName = "Nome";
            produtos.Columns.Add(p_column);
            p_column = new DataColumn();
            p_column.DataType = Type.GetType("System.String");
            p_column.ColumnName = "Marca";
            produtos.Columns.Add(p_column);
            p_column = new DataColumn();
            p_column.DataType = Type.GetType("System.String");
            p_column.ColumnName = "Especificidade";
            produtos.Columns.Add(p_column);
            p_column = new DataColumn();
            p_column.DataType = Type.GetType("System.String");
            p_column.ColumnName = "Preço";
            produtos.Columns.Add(p_column);
            p_column = new DataColumn();
            p_column.DataType = Type.GetType("System.String");
            p_column.ColumnName = "Quantidade";
            produtos.Columns.Add(p_column);

            //fim datagridview para adicionar produto a venda
        }



        private void btn_produtos_Click(object sender, EventArgs e)
        {
            menuControl(2);
        }
        private void btn_financas_Click(object sender, EventArgs e)
        {
            menuControl(3);
        }

        private void btn_Clientes_Click(object sender, EventArgs e)
        {
            menuControl(4);
        }
        private void bnt_Funcionarios_Click(object sender, EventArgs e)
        {
            menuControl(5);
        }


        public void menuControl(int m)
        {
            switch (m)
            {
                case 1:

                    this.Show();
                    f_produtos.Hide();
                    f_financas.Hide();
                    f_clientes.Hide();
                    f_funcionarios.Hide();
                    break;
                case 2:
                    this.Hide();
                    f_produtos.Show();
                    f_financas.Hide();
                    f_clientes.Hide();
                    f_funcionarios.Hide();
                    break;
                case 3:
                    this.Hide();
                    f_produtos.Hide();
                    f_financas.Show();
                    f_clientes.Hide();
                    f_funcionarios.Hide();
                    break;
                case 4:
                    this.Hide();
                    f_produtos.Hide();
                    f_financas.Hide();
                    f_clientes.Show();
                    f_funcionarios.Hide();
                    break;
                case 5:
                    this.Hide();
                    f_produtos.Hide();
                    f_financas.Hide();
                    f_clientes.Hide();
                    f_funcionarios.Show();
                    break;
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

        public DataTable obterVendas(SqlConnection cn)
        {
            string sql = "SELECT ID_venda as 'ID Venda', precoTotal as 'Valor', quantidade as 'Quantidade Itens', data_venda as 'Data', num_ID as 'Cliente', work_ID as 'Funcionario' FROM SPORT_SHOP.Venda WHERE loja_code="+loja_code;
            SqlDataAdapter da = null;
            DataTable dt = new DataTable();
            var cmd = cn.CreateCommand();
            try
            {
                cmd.CommandText = sql;
                da = new SqlDataAdapter(cmd.CommandText, cn);
                da.Fill(dt);
            }catch (Exception ex)
            {

            }
            return dt;
        }
        public DataTable obterVendaFiltrada(SqlConnection cn, string filtro)
        {
            string sql = "SELECT ID_venda as 'ID Venda', precoTotal as 'Valor', quantidade as 'Quantidade Itens', data_venda as 'Data', num_ID as 'Cliente', work_ID as 'Funcionario' FROM SPORT_SHOP.Venda WHERE " + filtro;
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
            return dt;
        }
        public DataTable obterInclui(SqlConnection cn, string vendaid)
        {
            string sql = "SELECT SPORT_SHOP.Inclui.ID_venda as 'ID Venda', SPORT_SHOP.Inclui.quantidadeProduto as 'Quantidade', SPORT_SHOP.Inclui.produto_ID as 'Produto ID', SPORT_SHOP.Produto.nome_Produto as 'Nome', SPORT_SHOP.Produto.marca as 'Marca', SPORT_SHOP.Produto.especificidade as 'Especificdade', SPORT_SHOP.Produto.preco as 'Preço Unidade' FROM SPORT_SHOP.Inclui INNER JOIN SPORT_SHOP.Produto ON SPORT_SHOP.Inclui.produto_ID = SPORT_SHOP.Produto.produto_ID WHERE SPORT_SHOP.Inclui.ID_venda = " + vendaid;
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
            return dt;
        }
        public DataTable obterProduto(SqlConnection cn, string id, string loja)
        {
            string sql = "SELECT * FROM SPORT_SHOP.Produto WHERE produto_ID = " + id + "AND loja_code =" + loja;
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
            return dt;
        }
        public DataTable obterTodosProdutos(SqlConnection cn, string loja)
        {
            string sql = "SELECT SPORT_SHOP.Produto.produto_ID as 'Produto ID', SPORT_SHOP.Produto.nome_Produto as 'Nome', SPORT_SHOP.Produto.marca as 'Marca', SPORT_SHOP.Produto.especificidade as 'Especificidade', SPORT_SHOP.Produto.preco as 'Preço', SPORT_SHOP.Stock.quantidade_Loja as 'Stock Loja', SPORT_SHOP.Stock.quantidade_Armazem as 'Stock Armazen' FROM SPORT_SHOP.Produto INNER JOIN SPORT_SHOP.Stock ON SPORT_SHOP.Produto.produto_ID = SPORT_SHOP.Stock.produto_ID WHERE SPORT_SHOP.Produto.loja_code = " + loja;
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
            return dt;
        }
        public DataTable obterProdutoFiltrado(SqlConnection cn, string loja, string filtra)
        {
            string sql = "SELECT SPORT_SHOP.Produto.produto_ID as 'Produto ID', SPORT_SHOP.Produto.nome_Produto as 'Nome', SPORT_SHOP.Produto.marca as 'Marca', SPORT_SHOP.Produto.especificidade as 'Especificidade', SPORT_SHOP.Produto.preco as 'Preço', SPORT_SHOP.Stock.quantidade_Loja as 'Stock Loja', SPORT_SHOP.Stock.quantidade_Armazem as 'Stock Armazen' FROM SPORT_SHOP.Produto INNER JOIN SPORT_SHOP.Stock ON SPORT_SHOP.Produto.produto_ID = SPORT_SHOP.Stock.produto_ID WHERE SPORT_SHOP.Produto.loja_code = " + loja +" AND " +filtra;
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
            return dt;
        }
        public DataTable obterTodosClientes(SqlConnection cn)
        {
            string sql = "SELECT SPORT_SHOP.Utilizador.nome as 'Nome', SPORT_SHOP.Cliente.num_ID as 'Cartão Cidadão', SPORT_SHOP.Cliente.mail as 'Mail' FROM SPORT_SHOP.Utilizador INNER JOIN SPORT_SHOP.Cliente ON SPORT_SHOP.Utilizador.num_ID = SPORT_SHOP.Cliente.num_ID";
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
            return dt;
        }
        public DataTable obterWithNome(SqlConnection cn, string cid)
        {
            string sql = "SELECT SPORT_SHOP.Utilizador.nome as 'Nome', SPORT_SHOP.Cliente.num_ID as 'Cartão Cidadão', SPORT_SHOP.Cliente.mail as 'Mail' FROM SPORT_SHOP.Utilizador INNER JOIN SPORT_SHOP.Cliente ON SPORT_SHOP.Utilizador.num_ID = SPORT_SHOP.Cliente.num_ID WHERE SPORT_SHOP.Utilizador.num_ID = " + cid;
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
            return dt;
        }
        public DataTable obterCliente(SqlConnection cn, string id)
        {
            string sql = "SELECT * FROM SPORT_SHOP.Cliente WHERE num_ID = " + id;
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
            return dt;
        }
        public DataTable obterFuncionario(SqlConnection cn)
        {
            string sql = "SELECT SPORT_SHOP.Utilizador.nome as 'Nome', SPORT_SHOP.Funcionario.num_ID as 'Cartão Cidadão', SPORT_SHOP.Funcionario.work_ID as 'Work ID', SPORT_SHOP.Funcionario.loja_code as 'Loja' FROM SPORT_SHOP.Utilizador INNER JOIN SPORT_SHOP.Funcionario ON SPORT_SHOP.Utilizador.num_ID = SPORT_SHOP.Funcionario.num_ID";
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
            return dt;
        }
        public DataTable obterFuncionarioById(SqlConnection cn, string id)
        {
            string sql = "SELECT SPORT_SHOP.Utilizador.nome as 'Nome', SPORT_SHOP.Funcionario.num_ID as 'Cartão Cidadão', SPORT_SHOP.Funcionario.work_ID as 'Work ID', SPORT_SHOP.Funcionario.loja_code as 'Loja' FROM SPORT_SHOP.Utilizador INNER JOIN SPORT_SHOP.Funcionario ON SPORT_SHOP.Utilizador.num_ID = SPORT_SHOP.Funcionario.num_ID WHERE SPORT_SHOP.Funcionario.work_ID =" + id;
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
            return dt;
        }


        private void F_main_FormClosing(object sender, FormClosingEventArgs e)
        {
            f_login.Close();
        }


        private void dgv_vendas_SelectionChanged(object sender, EventArgs e)
        {
            DataGridView dgv = (DataGridView)sender;
            if (dgv.SelectedRows.Count > 0)
            {
                string vendaid = dgv.SelectedRows[0].Cells[0].Value.ToString();
                dgv_inclui.DataSource = obterInclui(cn, vendaid);
                dgv_inclui.Columns[0].Width = 90;
                dgv_inclui.Columns[1].Width = 102;
                dgv_inclui.Columns[2].Width = 109;
                dgv_inclui.Columns[3].Width = 127;
                dgv_inclui.Columns[4].Width = 90;
                dgv_inclui.Columns[5].Width = 110;
                dgv_inclui.Columns[6].Width = 120;
            }
        }

        private void btn_adicionar_Click(object sender, EventArgs e)
        {
            if (tb_produto.Text.Equals(""))
            {
                MessageBox.Show("Digite um Produto ID");
            }
            else
            {
                if (nud_quantprod.Value == 0)
                {
                    MessageBox.Show("Quantidade inválida");
                }
                else if(nud_quantprod.Value > 10)
                {
                    MessageBox.Show("Não é possivel comprar mais de 10 itens");
                }
                else
                {
                    DataTable dt = obterProduto(cn, tb_produto.Text.ToString(), loja_code);
                    if (dt.Rows.Count == 1)
                    {
                        string sql = "SELECT quantidade_Loja, quantidade_Armazem FROM SPORT_SHOP.Stock WHERE produto_ID = " + tb_produto.Text + " AND loja_code = " + loja_code;
                        SqlDataAdapter da = null;
                        DataTable dtstock = new DataTable();
                        var cmd = cn.CreateCommand();
                        try
                        {
                            cmd.CommandText = sql;
                            da = new SqlDataAdapter(cmd.CommandText, cn);
                            da.Fill(dtstock);
                        }
                        catch (Exception ex)
                        {

                        }
                        if ((int)dtstock.Rows[0][1] + (int)dtstock.Rows[0][0] > nud_quantprod.Value) 
                        {
                            p_row = produtos.NewRow();
                            p_row["Produto ID"] = dt.Rows[0][0].ToString();
                            p_row["Nome"] = dt.Rows[0][1].ToString();
                            p_row["Marca"] = dt.Rows[0][2].ToString();
                            p_row["Especificidade"] = dt.Rows[0][3].ToString();
                            p_row["Preço"] = dt.Rows[0][4].ToString();
                            p_row["Quantidade"] = nud_quantprod.Value.ToString();
                            produtos.Rows.Add(p_row);
                            dgv_addvenda.DataSource = produtos;
                            dgv_addvenda.Columns[0].Width = 83;
                            dgv_addvenda.Columns[1].Width = 106;
                            dgv_addvenda.Columns[2].Width = 86;
                            dgv_addvenda.Columns[3].Width = 80;
                            dgv_addvenda.Columns[4].Width = 69;
                            dgv_addvenda.Columns[5].Width = 70;
                        }
                        else
                        {
                            MessageBox.Show("Quantidade demasiado grande");
                        }
                        
                    }
                    else
                    {
                        MessageBox.Show("Produto ID inválido");
                    }
                }
            }
        }

        private void btn_regvenda_Click(object sender, EventArgs e)
        {
            if (produtos.Rows.Count == 0)
            {
                MessageBox.Show("Não existem produtos para comprar");
            }
            else if (tb_clienteid.Text.Equals(""))
            {
                MessageBox.Show("Insira um Cliente");
            }
            else
            {
                DataTable dt = obterCliente(cn, tb_clienteid.Text);
                if (dt.Rows.Count != 1)
                {
                    MessageBox.Show("Cliente inexistente");
                }
                else
                {
                    int tam = produtos.Rows.Count;
                    //criar uma nova venda
                    DateTime h = DateTime.Today;
                    string[] ho = h.ToString("d").Split('/');
                    string hoje = "";
                    if (ho[0].Length == 1 && ho[1].Length == 1)
                    {
                        ho[0] = "0" + ho[0];
                        ho[1] = "0" + ho[1];
                    }
                    else if (ho[0].Length == 1 && ho[1].Length == 2)
                    {
                        ho[0] = "0" + ho[0];
                    }
                    else if (ho[0].Length == 2 && ho[1].Length == 1)
                    {
                        ho[1] = "0" + ho[1];
                    }
                    hoje = ho[2] + ho[1] + ho[0];
                    string sql = "EXEC p_Create_Venda @data_venda = '" + hoje + "', @loja_code = " + loja_code + ", @work_ID = " + workid + ", @num_ID = " + tb_clienteid.Text;
                    SqlDataAdapter da = null;
                    dt = new DataTable();
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
                    
                    // pegar o id dessa venda com o @@identity
                    sql = "SELECT ID_venda FROM SPORT_SHOP.Venda WHERE ID_venda = @@IDENTITY";
                    da = null;
                    dt = new DataTable();
                    cmd = cn.CreateCommand();
                    try
                    {
                        cmd.CommandText = sql;
                        da = new SqlDataAdapter(cmd.CommandText, cn);
                        da.Fill(dt);
                    }
                    catch (Exception ex)
                    {

                    }
                    string a;
                    int b;
                    string venda = dt.Rows[0][0].ToString();
                    decimal precototal = 0;
                    int totalprod = 0;
                    for (int i = 0; i < tam; i++)
                    {
                        //adicionar os produtos ao inclui
                        sql = "INSERT INTO SPORT_SHOP.INCLUI(ID_venda, produto_ID, quantidadeProduto) VALUES ( " + venda + ", " + produtos.Rows[i][0] + ", " + produtos.Rows[i][5] + ")";
                        da = null;
                        dt = new DataTable();
                        cmd = cn.CreateCommand();
                        try
                        {
                            cmd.CommandText = sql;
                            da = new SqlDataAdapter(cmd.CommandText, cn);
                            da.Fill(dt);
                        }
                        catch (Exception ex)
                        {

                        }
                        sql = "EXEC p_retiraStock @produto_ID = "+ produtos.Rows[i][0] +", @loja_code ="+ loja_code +", @quantidade =" + produtos.Rows[i][5];
                        da = null;
                        dt = new DataTable();
                        cmd = cn.CreateCommand();
                        try
                        {
                            cmd.CommandText = sql;
                            da = new SqlDataAdapter(cmd.CommandText, cn);
                            da.Fill(dt);
                        }
                        catch (Exception ex)
                        {

                        }
                        a = produtos.Rows[i][5].ToString();
                        b = Int32.Parse(a);
                        totalprod += Int32.Parse(a);
                        a = produtos.Rows[i][4].ToString();
                        precototal += Decimal.Parse(a)* b;
                        
                    }
                    sql = "UPDATE SPORT_SHOP.Venda SET precoTotal = " + precototal.ToString(new CultureInfo("en-US")) +", quantidade = " + totalprod.ToString() + "WHERE ID_venda = " + venda;
                    da = null;
                    dt = new DataTable();
                    cmd = cn.CreateCommand();
                    try
                    {
                        cmd.CommandText = sql;
                        da = new SqlDataAdapter(cmd.CommandText, cn);
                        da.Fill(dt);
                    }
                    catch (Exception ex)
                    {

                    }
                    produtos.Clear();
                    dgv_addvenda.DataSource = produtos;
                    tb_clienteid.Text = "";
                    tb_produto.Text = "";
                    nud_quantprod.Value = 0;
                    dgv_addvenda.Columns[0].Width = 83;
                    dgv_addvenda.Columns[1].Width = 106;
                    dgv_addvenda.Columns[2].Width = 86;
                    dgv_addvenda.Columns[3].Width = 80;
                    dgv_addvenda.Columns[4].Width = 69;
                    dgv_addvenda.Columns[5].Width = 70;

                    dgv_vendas.DataSource = obterVendas(cn);
                    dgv_vendas.Columns[0].Width = 110;
                    dgv_vendas.Columns[1].Width = 122;
                    dgv_vendas.Columns[2].Width = 119;
                    dgv_vendas.Columns[3].Width = 120;
                    dgv_vendas.Columns[4].Width = 130;
                    dgv_vendas.Columns[5].Width = 130;

                    MessageBox.Show("Venda efetuada com sucesso!");
                    f_financas = new F_financas(this);
                }
            }
        }

        private void btn_cancelavenda_Click(object sender, EventArgs e)
        {
            produtos.Clear();
            tb_clienteid.Text = "";
            tb_produto.Text = "";
            nud_quantprod.Value = 0;
        }

        private void btn_search_Click(object sender, EventArgs e)
        {
            if ("Sem Filtro".Equals(gb_filtros.Controls.OfType<RadioButton>().SingleOrDefault(RadioButton => RadioButton.Checked).Text))
            {
                dgv_vendas.DataSource = obterVendas(cn);
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
                    if ("Venda ID".Equals(filtra) && int.TryParse(tb_search.Text, out _))
                    {
                        filtra = "SPORT_SHOP.Venda.ID_venda = " + tb_search.Text;
                        dgv_vendas.DataSource = obterVendaFiltrada(cn, filtra);
                    }
                    else if ("Cliente".Equals(filtra) && int.TryParse(tb_search.Text, out _)) 
                    {
                        filtra = "SPORT_SHOP.Venda.num_ID = " + tb_search.Text;
                        dgv_vendas.DataSource = obterVendaFiltrada(cn, filtra);
                    }
                    else if("Funcionario".Equals(filtra) && int.TryParse(tb_search.Text, out _))
                    {
                        filtra = "SPORT_SHOP.Venda.work_ID = " + tb_search.Text;
                        dgv_vendas.DataSource = obterVendaFiltrada(cn, filtra);
                    }
                    else if ("Sem Filtro".Equals(filtra))
                    {
                        dgv_vendas.DataSource = obterVendas(cn);
                    }
                    else
                    {
                        MessageBox.Show("Parametro de busca deve ser um numero");
                    }

                }
            }
        }
    }
}
