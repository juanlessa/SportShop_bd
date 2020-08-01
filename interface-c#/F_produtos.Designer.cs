namespace Interface_SportShop
{
    partial class F_produtos
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            this.btn_produtos = new System.Windows.Forms.Button();
            this.btn_vendas = new System.Windows.Forms.Button();
            this.bnt_Funcionarios = new System.Windows.Forms.Button();
            this.btn_Clientes = new System.Windows.Forms.Button();
            this.btn_financas = new System.Windows.Forms.Button();
            this.gb_produtos = new System.Windows.Forms.GroupBox();
            this.tabControl1 = new System.Windows.Forms.TabControl();
            this.tabPage1 = new System.Windows.Forms.TabPage();
            this.dgv_produtos = new System.Windows.Forms.DataGridView();
            this.gb_filtros = new System.Windows.Forms.GroupBox();
            this.rbtn_produtoid = new System.Windows.Forms.RadioButton();
            this.rbtn_nome = new System.Windows.Forms.RadioButton();
            this.rbtn_tipo = new System.Windows.Forms.RadioButton();
            this.btn_search = new System.Windows.Forms.Button();
            this.tb_search = new System.Windows.Forms.TextBox();
            this.tp_adicionar = new System.Windows.Forms.TabPage();
            this.label2 = new System.Windows.Forms.Label();
            this.btn_canceladdprod = new System.Windows.Forms.Button();
            this.btn_addprod = new System.Windows.Forms.Button();
            this.lb_preco = new System.Windows.Forms.Label();
            this.tb_preço = new System.Windows.Forms.TextBox();
            this.cb_especificidade = new System.Windows.Forms.ComboBox();
            this.label1 = new System.Windows.Forms.Label();
            this.cb_tipoprod = new System.Windows.Forms.ComboBox();
            this.lb_especificidade = new System.Windows.Forms.Label();
            this.lb_marca = new System.Windows.Forms.Label();
            this.tb_marca = new System.Windows.Forms.TextBox();
            this.lb_nomeprod = new System.Windows.Forms.Label();
            this.tb_nomeprod = new System.Windows.Forms.TextBox();
            this.tabPage3 = new System.Windows.Forms.TabPage();
            this.nud_addarm = new System.Windows.Forms.NumericUpDown();
            this.label3 = new System.Windows.Forms.Label();
            this.nud_addloja = new System.Windows.Forms.NumericUpDown();
            this.lb_quantidade = new System.Windows.Forms.Label();
            this.lb_addnome = new System.Windows.Forms.Label();
            this.lb_addmarca = new System.Windows.Forms.Label();
            this.lb_addesp = new System.Windows.Forms.Label();
            this.lb_addpreco = new System.Windows.Forms.Label();
            this.button3 = new System.Windows.Forms.Button();
            this.lb_prodid = new System.Windows.Forms.Label();
            this.tb_searchpid = new System.Windows.Forms.TextBox();
            this.button1 = new System.Windows.Forms.Button();
            this.button2 = new System.Windows.Forms.Button();
            this.label4 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.label8 = new System.Windows.Forms.Label();
            this.radioButton1 = new System.Windows.Forms.RadioButton();
            this.gb_produtos.SuspendLayout();
            this.tabControl1.SuspendLayout();
            this.tabPage1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgv_produtos)).BeginInit();
            this.gb_filtros.SuspendLayout();
            this.tp_adicionar.SuspendLayout();
            this.tabPage3.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.nud_addarm)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.nud_addloja)).BeginInit();
            this.SuspendLayout();
            // 
            // btn_produtos
            // 
            this.btn_produtos.Enabled = false;
            this.btn_produtos.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.btn_produtos.Image = global::Interface_SportShop.Properties.Resources.img_products;
            this.btn_produtos.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btn_produtos.Location = new System.Drawing.Point(155, 12);
            this.btn_produtos.Name = "btn_produtos";
            this.btn_produtos.Size = new System.Drawing.Size(151, 67);
            this.btn_produtos.TabIndex = 3;
            this.btn_produtos.TabStop = false;
            this.btn_produtos.Text = "Produtos";
            this.btn_produtos.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btn_produtos.UseVisualStyleBackColor = true;
            // 
            // btn_vendas
            // 
            this.btn_vendas.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.btn_vendas.Image = global::Interface_SportShop.Properties.Resources.img_sales;
            this.btn_vendas.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btn_vendas.Location = new System.Drawing.Point(12, 12);
            this.btn_vendas.Name = "btn_vendas";
            this.btn_vendas.Size = new System.Drawing.Size(137, 67);
            this.btn_vendas.TabIndex = 2;
            this.btn_vendas.TabStop = false;
            this.btn_vendas.Text = "Vendas";
            this.btn_vendas.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btn_vendas.UseVisualStyleBackColor = true;
            this.btn_vendas.Click += new System.EventHandler(this.btn_vendas_Click);
            // 
            // bnt_Funcionarios
            // 
            this.bnt_Funcionarios.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.bnt_Funcionarios.Image = global::Interface_SportShop.Properties.Resources.img_employee;
            this.bnt_Funcionarios.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.bnt_Funcionarios.Location = new System.Drawing.Point(620, 12);
            this.bnt_Funcionarios.Name = "bnt_Funcionarios";
            this.bnt_Funcionarios.Size = new System.Drawing.Size(182, 67);
            this.bnt_Funcionarios.TabIndex = 7;
            this.bnt_Funcionarios.TabStop = false;
            this.bnt_Funcionarios.Text = "Funcionarios";
            this.bnt_Funcionarios.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.bnt_Funcionarios.UseVisualStyleBackColor = true;
            this.bnt_Funcionarios.Click += new System.EventHandler(this.bnt_Funcionarios_Click);
            // 
            // btn_Clientes
            // 
            this.btn_Clientes.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.btn_Clientes.Image = global::Interface_SportShop.Properties.Resources.img_client;
            this.btn_Clientes.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btn_Clientes.Location = new System.Drawing.Point(470, 12);
            this.btn_Clientes.Name = "btn_Clientes";
            this.btn_Clientes.Size = new System.Drawing.Size(144, 67);
            this.btn_Clientes.TabIndex = 6;
            this.btn_Clientes.TabStop = false;
            this.btn_Clientes.Text = "Clientes";
            this.btn_Clientes.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btn_Clientes.UseVisualStyleBackColor = true;
            this.btn_Clientes.Click += new System.EventHandler(this.btn_Clientes_Click);
            // 
            // btn_financas
            // 
            this.btn_financas.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.btn_financas.Image = global::Interface_SportShop.Properties.Resources.img_finances;
            this.btn_financas.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btn_financas.Location = new System.Drawing.Point(312, 12);
            this.btn_financas.Name = "btn_financas";
            this.btn_financas.Size = new System.Drawing.Size(152, 67);
            this.btn_financas.TabIndex = 5;
            this.btn_financas.TabStop = false;
            this.btn_financas.Text = "Finanças";
            this.btn_financas.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btn_financas.UseVisualStyleBackColor = true;
            this.btn_financas.Click += new System.EventHandler(this.btn_financas_Click);
            // 
            // gb_produtos
            // 
            this.gb_produtos.Controls.Add(this.tabControl1);
            this.gb_produtos.Location = new System.Drawing.Point(12, 85);
            this.gb_produtos.Name = "gb_produtos";
            this.gb_produtos.Size = new System.Drawing.Size(1033, 642);
            this.gb_produtos.TabIndex = 11;
            this.gb_produtos.TabStop = false;
            this.gb_produtos.Text = "Produtos";
            // 
            // tabControl1
            // 
            this.tabControl1.Controls.Add(this.tabPage1);
            this.tabControl1.Controls.Add(this.tp_adicionar);
            this.tabControl1.Controls.Add(this.tabPage3);
            this.tabControl1.Location = new System.Drawing.Point(6, 21);
            this.tabControl1.Name = "tabControl1";
            this.tabControl1.SelectedIndex = 0;
            this.tabControl1.Size = new System.Drawing.Size(1021, 601);
            this.tabControl1.TabIndex = 1;
            // 
            // tabPage1
            // 
            this.tabPage1.BackColor = System.Drawing.Color.WhiteSmoke;
            this.tabPage1.Controls.Add(this.dgv_produtos);
            this.tabPage1.Controls.Add(this.gb_filtros);
            this.tabPage1.Controls.Add(this.btn_search);
            this.tabPage1.Controls.Add(this.tb_search);
            this.tabPage1.Location = new System.Drawing.Point(4, 25);
            this.tabPage1.Name = "tabPage1";
            this.tabPage1.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage1.Size = new System.Drawing.Size(1013, 572);
            this.tabPage1.TabIndex = 0;
            this.tabPage1.Text = "Lista";
            // 
            // dgv_produtos
            // 
            this.dgv_produtos.AllowUserToAddRows = false;
            this.dgv_produtos.AllowUserToDeleteRows = false;
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle1.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle1.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle1.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dgv_produtos.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle1;
            this.dgv_produtos.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgv_produtos.EnableHeadersVisualStyles = false;
            this.dgv_produtos.Location = new System.Drawing.Point(6, 79);
            this.dgv_produtos.MultiSelect = false;
            this.dgv_produtos.Name = "dgv_produtos";
            this.dgv_produtos.ReadOnly = true;
            this.dgv_produtos.RowHeadersVisible = false;
            this.dgv_produtos.RowHeadersWidth = 51;
            this.dgv_produtos.RowTemplate.Height = 24;
            this.dgv_produtos.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgv_produtos.Size = new System.Drawing.Size(1001, 487);
            this.dgv_produtos.TabIndex = 4;
            // 
            // gb_filtros
            // 
            this.gb_filtros.Controls.Add(this.radioButton1);
            this.gb_filtros.Controls.Add(this.rbtn_produtoid);
            this.gb_filtros.Controls.Add(this.rbtn_nome);
            this.gb_filtros.Controls.Add(this.rbtn_tipo);
            this.gb_filtros.Location = new System.Drawing.Point(634, 6);
            this.gb_filtros.Name = "gb_filtros";
            this.gb_filtros.Size = new System.Drawing.Size(354, 51);
            this.gb_filtros.TabIndex = 3;
            this.gb_filtros.TabStop = false;
            this.gb_filtros.Text = "Filtros";
            // 
            // rbtn_produtoid
            // 
            this.rbtn_produtoid.AutoSize = true;
            this.rbtn_produtoid.Location = new System.Drawing.Point(6, 21);
            this.rbtn_produtoid.Name = "rbtn_produtoid";
            this.rbtn_produtoid.Size = new System.Drawing.Size(96, 21);
            this.rbtn_produtoid.TabIndex = 3;
            this.rbtn_produtoid.TabStop = true;
            this.rbtn_produtoid.Text = "Produto ID";
            this.rbtn_produtoid.UseVisualStyleBackColor = true;
            // 
            // rbtn_nome
            // 
            this.rbtn_nome.AutoSize = true;
            this.rbtn_nome.Location = new System.Drawing.Point(179, 21);
            this.rbtn_nome.Name = "rbtn_nome";
            this.rbtn_nome.Size = new System.Drawing.Size(66, 21);
            this.rbtn_nome.TabIndex = 1;
            this.rbtn_nome.TabStop = true;
            this.rbtn_nome.Text = "Nome";
            this.rbtn_nome.UseVisualStyleBackColor = true;
            // 
            // rbtn_tipo
            // 
            this.rbtn_tipo.AutoSize = true;
            this.rbtn_tipo.Location = new System.Drawing.Point(105, 21);
            this.rbtn_tipo.Name = "rbtn_tipo";
            this.rbtn_tipo.Size = new System.Drawing.Size(68, 21);
            this.rbtn_tipo.TabIndex = 0;
            this.rbtn_tipo.TabStop = true;
            this.rbtn_tipo.Text = "Marca";
            this.rbtn_tipo.UseVisualStyleBackColor = true;
            // 
            // btn_search
            // 
            this.btn_search.Image = global::Interface_SportShop.Properties.Resources.img_search;
            this.btn_search.Location = new System.Drawing.Point(563, 25);
            this.btn_search.Name = "btn_search";
            this.btn_search.Size = new System.Drawing.Size(39, 27);
            this.btn_search.TabIndex = 1;
            this.btn_search.TabStop = false;
            this.btn_search.UseVisualStyleBackColor = true;
            this.btn_search.Click += new System.EventHandler(this.btn_search_Click);
            // 
            // tb_search
            // 
            this.tb_search.Location = new System.Drawing.Point(6, 26);
            this.tb_search.Name = "tb_search";
            this.tb_search.Size = new System.Drawing.Size(553, 22);
            this.tb_search.TabIndex = 0;
            // 
            // tp_adicionar
            // 
            this.tp_adicionar.BackColor = System.Drawing.Color.WhiteSmoke;
            this.tp_adicionar.Controls.Add(this.label2);
            this.tp_adicionar.Controls.Add(this.btn_canceladdprod);
            this.tp_adicionar.Controls.Add(this.btn_addprod);
            this.tp_adicionar.Controls.Add(this.lb_preco);
            this.tp_adicionar.Controls.Add(this.tb_preço);
            this.tp_adicionar.Controls.Add(this.cb_especificidade);
            this.tp_adicionar.Controls.Add(this.label1);
            this.tp_adicionar.Controls.Add(this.cb_tipoprod);
            this.tp_adicionar.Controls.Add(this.lb_especificidade);
            this.tp_adicionar.Controls.Add(this.lb_marca);
            this.tp_adicionar.Controls.Add(this.tb_marca);
            this.tp_adicionar.Controls.Add(this.lb_nomeprod);
            this.tp_adicionar.Controls.Add(this.tb_nomeprod);
            this.tp_adicionar.Location = new System.Drawing.Point(4, 25);
            this.tp_adicionar.Name = "tp_adicionar";
            this.tp_adicionar.Padding = new System.Windows.Forms.Padding(3);
            this.tp_adicionar.Size = new System.Drawing.Size(1013, 572);
            this.tp_adicionar.TabIndex = 3;
            this.tp_adicionar.Text = "Adicionar";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(635, 332);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(18, 20);
            this.label2.TabIndex = 14;
            this.label2.Text = "€";
            // 
            // btn_canceladdprod
            // 
            this.btn_canceladdprod.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn_canceladdprod.Location = new System.Drawing.Point(388, 407);
            this.btn_canceladdprod.Name = "btn_canceladdprod";
            this.btn_canceladdprod.Size = new System.Drawing.Size(104, 35);
            this.btn_canceladdprod.TabIndex = 13;
            this.btn_canceladdprod.Text = "Cancelar";
            this.btn_canceladdprod.UseVisualStyleBackColor = true;
            this.btn_canceladdprod.Click += new System.EventHandler(this.btn_canceladdprod_Click);
            // 
            // btn_addprod
            // 
            this.btn_addprod.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn_addprod.Location = new System.Drawing.Point(525, 407);
            this.btn_addprod.Name = "btn_addprod";
            this.btn_addprod.Size = new System.Drawing.Size(104, 35);
            this.btn_addprod.TabIndex = 12;
            this.btn_addprod.Text = "Adicionar";
            this.btn_addprod.UseVisualStyleBackColor = true;
            this.btn_addprod.Click += new System.EventHandler(this.btn_addprod_Click);
            // 
            // lb_preco
            // 
            this.lb_preco.AutoSize = true;
            this.lb_preco.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lb_preco.Location = new System.Drawing.Point(321, 332);
            this.lb_preco.Name = "lb_preco";
            this.lb_preco.Size = new System.Drawing.Size(58, 20);
            this.lb_preco.TabIndex = 11;
            this.lb_preco.Text = "Preço:";
            // 
            // tb_preço
            // 
            this.tb_preço.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tb_preço.Location = new System.Drawing.Point(388, 329);
            this.tb_preço.Name = "tb_preço";
            this.tb_preço.Size = new System.Drawing.Size(241, 27);
            this.tb_preço.TabIndex = 10;
            // 
            // cb_especificidade
            // 
            this.cb_especificidade.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cb_especificidade.FormattingEnabled = true;
            this.cb_especificidade.Location = new System.Drawing.Point(388, 284);
            this.cb_especificidade.Name = "cb_especificidade";
            this.cb_especificidade.Size = new System.Drawing.Size(241, 28);
            this.cb_especificidade.TabIndex = 9;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(236, 246);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(132, 20);
            this.label1.TabIndex = 8;
            this.label1.Text = "Tipo de Produto:";
            // 
            // cb_tipoprod
            // 
            this.cb_tipoprod.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cb_tipoprod.FormattingEnabled = true;
            this.cb_tipoprod.Items.AddRange(new object[] {
            "1 - Roupa",
            "2 - Sapatilha",
            "3 - Haltere",
            "4 - Acessorio de Desporto"});
            this.cb_tipoprod.Location = new System.Drawing.Point(388, 243);
            this.cb_tipoprod.Name = "cb_tipoprod";
            this.cb_tipoprod.Size = new System.Drawing.Size(241, 28);
            this.cb_tipoprod.TabIndex = 7;
            this.cb_tipoprod.SelectedValueChanged += new System.EventHandler(this.comboBox1_SelectedValueChanged);
            // 
            // lb_especificidade
            // 
            this.lb_especificidade.AutoSize = true;
            this.lb_especificidade.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lb_especificidade.Location = new System.Drawing.Point(249, 287);
            this.lb_especificidade.Name = "lb_especificidade";
            this.lb_especificidade.Size = new System.Drawing.Size(123, 20);
            this.lb_especificidade.TabIndex = 6;
            this.lb_especificidade.Text = "Especificidade:";
            // 
            // lb_marca
            // 
            this.lb_marca.AutoSize = true;
            this.lb_marca.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lb_marca.Location = new System.Drawing.Point(318, 203);
            this.lb_marca.Name = "lb_marca";
            this.lb_marca.Size = new System.Drawing.Size(61, 20);
            this.lb_marca.TabIndex = 4;
            this.lb_marca.Text = "Marca:";
            // 
            // tb_marca
            // 
            this.tb_marca.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tb_marca.Location = new System.Drawing.Point(388, 203);
            this.tb_marca.Name = "tb_marca";
            this.tb_marca.Size = new System.Drawing.Size(241, 27);
            this.tb_marca.TabIndex = 3;
            // 
            // lb_nomeprod
            // 
            this.lb_nomeprod.AutoSize = true;
            this.lb_nomeprod.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lb_nomeprod.Location = new System.Drawing.Point(247, 162);
            this.lb_nomeprod.Name = "lb_nomeprod";
            this.lb_nomeprod.Size = new System.Drawing.Size(121, 20);
            this.lb_nomeprod.TabIndex = 2;
            this.lb_nomeprod.Text = "Nome Produto:";
            // 
            // tb_nomeprod
            // 
            this.tb_nomeprod.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tb_nomeprod.Location = new System.Drawing.Point(388, 162);
            this.tb_nomeprod.Name = "tb_nomeprod";
            this.tb_nomeprod.Size = new System.Drawing.Size(241, 27);
            this.tb_nomeprod.TabIndex = 1;
            // 
            // tabPage3
            // 
            this.tabPage3.BackColor = System.Drawing.Color.WhiteSmoke;
            this.tabPage3.Controls.Add(this.nud_addarm);
            this.tabPage3.Controls.Add(this.label3);
            this.tabPage3.Controls.Add(this.nud_addloja);
            this.tabPage3.Controls.Add(this.lb_quantidade);
            this.tabPage3.Controls.Add(this.lb_addnome);
            this.tabPage3.Controls.Add(this.lb_addmarca);
            this.tabPage3.Controls.Add(this.lb_addesp);
            this.tabPage3.Controls.Add(this.lb_addpreco);
            this.tabPage3.Controls.Add(this.button3);
            this.tabPage3.Controls.Add(this.lb_prodid);
            this.tabPage3.Controls.Add(this.tb_searchpid);
            this.tabPage3.Controls.Add(this.button1);
            this.tabPage3.Controls.Add(this.button2);
            this.tabPage3.Controls.Add(this.label4);
            this.tabPage3.Controls.Add(this.label6);
            this.tabPage3.Controls.Add(this.label7);
            this.tabPage3.Controls.Add(this.label8);
            this.tabPage3.Location = new System.Drawing.Point(4, 25);
            this.tabPage3.Name = "tabPage3";
            this.tabPage3.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage3.Size = new System.Drawing.Size(1013, 572);
            this.tabPage3.TabIndex = 4;
            this.tabPage3.Text = "Receber Stock";
            // 
            // nud_addarm
            // 
            this.nud_addarm.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.nud_addarm.Location = new System.Drawing.Point(366, 345);
            this.nud_addarm.Name = "nud_addarm";
            this.nud_addarm.Size = new System.Drawing.Size(95, 27);
            this.nud_addarm.TabIndex = 37;
            this.nud_addarm.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(169, 345);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(176, 20);
            this.label3.TabIndex = 36;
            this.label3.Text = "Quantidade Armazem:";
            // 
            // nud_addloja
            // 
            this.nud_addloja.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.nud_addloja.Location = new System.Drawing.Point(365, 294);
            this.nud_addloja.Name = "nud_addloja";
            this.nud_addloja.Size = new System.Drawing.Size(95, 27);
            this.nud_addloja.TabIndex = 35;
            this.nud_addloja.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            // 
            // lb_quantidade
            // 
            this.lb_quantidade.AutoSize = true;
            this.lb_quantidade.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lb_quantidade.Location = new System.Drawing.Point(209, 296);
            this.lb_quantidade.Name = "lb_quantidade";
            this.lb_quantidade.Size = new System.Drawing.Size(136, 20);
            this.lb_quantidade.TabIndex = 34;
            this.lb_quantidade.Text = "Quantidade Loja:";
            // 
            // lb_addnome
            // 
            this.lb_addnome.AutoSize = true;
            this.lb_addnome.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lb_addnome.Location = new System.Drawing.Point(361, 119);
            this.lb_addnome.Name = "lb_addnome";
            this.lb_addnome.Size = new System.Drawing.Size(0, 20);
            this.lb_addnome.TabIndex = 33;
            // 
            // lb_addmarca
            // 
            this.lb_addmarca.AutoSize = true;
            this.lb_addmarca.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lb_addmarca.Location = new System.Drawing.Point(362, 160);
            this.lb_addmarca.Name = "lb_addmarca";
            this.lb_addmarca.Size = new System.Drawing.Size(0, 20);
            this.lb_addmarca.TabIndex = 32;
            // 
            // lb_addesp
            // 
            this.lb_addesp.AutoSize = true;
            this.lb_addesp.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lb_addesp.Location = new System.Drawing.Point(362, 207);
            this.lb_addesp.Name = "lb_addesp";
            this.lb_addesp.Size = new System.Drawing.Size(0, 20);
            this.lb_addesp.TabIndex = 31;
            // 
            // lb_addpreco
            // 
            this.lb_addpreco.AutoSize = true;
            this.lb_addpreco.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lb_addpreco.Location = new System.Drawing.Point(362, 252);
            this.lb_addpreco.Name = "lb_addpreco";
            this.lb_addpreco.Size = new System.Drawing.Size(0, 20);
            this.lb_addpreco.TabIndex = 30;
            // 
            // button3
            // 
            this.button3.Image = global::Interface_SportShop.Properties.Resources.img_search;
            this.button3.Location = new System.Drawing.Point(612, 78);
            this.button3.Name = "button3";
            this.button3.Size = new System.Drawing.Size(39, 27);
            this.button3.TabIndex = 29;
            this.button3.TabStop = false;
            this.button3.UseVisualStyleBackColor = true;
            this.button3.Click += new System.EventHandler(this.button3_Click);
            // 
            // lb_prodid
            // 
            this.lb_prodid.AutoSize = true;
            this.lb_prodid.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lb_prodid.Location = new System.Drawing.Point(251, 77);
            this.lb_prodid.Name = "lb_prodid";
            this.lb_prodid.Size = new System.Drawing.Size(94, 20);
            this.lb_prodid.TabIndex = 28;
            this.lb_prodid.Text = "Produto ID:";
            // 
            // tb_searchpid
            // 
            this.tb_searchpid.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tb_searchpid.Location = new System.Drawing.Point(365, 77);
            this.tb_searchpid.Name = "tb_searchpid";
            this.tb_searchpid.Size = new System.Drawing.Size(241, 27);
            this.tb_searchpid.TabIndex = 27;
            // 
            // button1
            // 
            this.button1.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button1.Location = new System.Drawing.Point(351, 419);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(104, 35);
            this.button1.TabIndex = 26;
            this.button1.Text = "Cancelar";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // button2
            // 
            this.button2.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button2.Location = new System.Drawing.Point(488, 419);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(104, 35);
            this.button2.TabIndex = 25;
            this.button2.Text = "Adicionar";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(298, 252);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(58, 20);
            this.label4.TabIndex = 24;
            this.label4.Text = "Preço:";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label6.Location = new System.Drawing.Point(226, 207);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(123, 20);
            this.label6.TabIndex = 19;
            this.label6.Text = "Especificidade:";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label7.Location = new System.Drawing.Point(295, 160);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(61, 20);
            this.label7.TabIndex = 18;
            this.label7.Text = "Marca:";
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label8.Location = new System.Drawing.Point(224, 119);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(121, 20);
            this.label8.TabIndex = 16;
            this.label8.Text = "Nome Produto:";
            // 
            // radioButton1
            // 
            this.radioButton1.AutoSize = true;
            this.radioButton1.Checked = true;
            this.radioButton1.Location = new System.Drawing.Point(251, 21);
            this.radioButton1.Name = "radioButton1";
            this.radioButton1.Size = new System.Drawing.Size(92, 21);
            this.radioButton1.TabIndex = 5;
            this.radioButton1.TabStop = true;
            this.radioButton1.Text = "Sem Filtro";
            this.radioButton1.UseVisualStyleBackColor = true;
            // 
            // F_produtos
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1057, 739);
            this.Controls.Add(this.gb_produtos);
            this.Controls.Add(this.bnt_Funcionarios);
            this.Controls.Add(this.btn_Clientes);
            this.Controls.Add(this.btn_financas);
            this.Controls.Add(this.btn_produtos);
            this.Controls.Add(this.btn_vendas);
            this.Name = "F_produtos";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "SportShop";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.F_produtos_FormClosing);
            this.Load += new System.EventHandler(this.F_produtos_Load);
            this.gb_produtos.ResumeLayout(false);
            this.tabControl1.ResumeLayout(false);
            this.tabPage1.ResumeLayout(false);
            this.tabPage1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgv_produtos)).EndInit();
            this.gb_filtros.ResumeLayout(false);
            this.gb_filtros.PerformLayout();
            this.tp_adicionar.ResumeLayout(false);
            this.tp_adicionar.PerformLayout();
            this.tabPage3.ResumeLayout(false);
            this.tabPage3.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.nud_addarm)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.nud_addloja)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button btn_produtos;
        private System.Windows.Forms.Button btn_vendas;
        private System.Windows.Forms.Button bnt_Funcionarios;
        private System.Windows.Forms.Button btn_Clientes;
        private System.Windows.Forms.Button btn_financas;
        private System.Windows.Forms.GroupBox gb_produtos;
        private System.Windows.Forms.TabControl tabControl1;
        private System.Windows.Forms.TabPage tabPage1;
        private System.Windows.Forms.DataGridView dgv_produtos;
        private System.Windows.Forms.GroupBox gb_filtros;
        private System.Windows.Forms.RadioButton rbtn_produtoid;
        private System.Windows.Forms.RadioButton rbtn_nome;
        private System.Windows.Forms.RadioButton rbtn_tipo;
        private System.Windows.Forms.Button btn_search;
        private System.Windows.Forms.TextBox tb_search;
        private System.Windows.Forms.TabPage tp_adicionar;
        private System.Windows.Forms.TabPage tabPage3;
        private System.Windows.Forms.Label lb_nomeprod;
        private System.Windows.Forms.TextBox tb_nomeprod;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ComboBox cb_tipoprod;
        private System.Windows.Forms.Label lb_especificidade;
        private System.Windows.Forms.Label lb_marca;
        private System.Windows.Forms.TextBox tb_marca;
        private System.Windows.Forms.ComboBox cb_especificidade;
        private System.Windows.Forms.Button btn_canceladdprod;
        private System.Windows.Forms.Button btn_addprod;
        private System.Windows.Forms.Label lb_preco;
        private System.Windows.Forms.TextBox tb_preço;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label lb_prodid;
        private System.Windows.Forms.TextBox tb_searchpid;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Label lb_addnome;
        private System.Windows.Forms.Label lb_addmarca;
        private System.Windows.Forms.Label lb_addesp;
        private System.Windows.Forms.Label lb_addpreco;
        private System.Windows.Forms.Button button3;
        private System.Windows.Forms.NumericUpDown nud_addarm;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.NumericUpDown nud_addloja;
        private System.Windows.Forms.Label lb_quantidade;
        private System.Windows.Forms.RadioButton radioButton1;
    }
}