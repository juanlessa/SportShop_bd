namespace Interface_SportShop
{
    partial class F_main
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle7 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle8 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle9 = new System.Windows.Forms.DataGridViewCellStyle();
            this.gb_vendas = new System.Windows.Forms.GroupBox();
            this.tabControl1 = new System.Windows.Forms.TabControl();
            this.tabPage1 = new System.Windows.Forms.TabPage();
            this.dgv_vendas = new System.Windows.Forms.DataGridView();
            this.gb_filtros = new System.Windows.Forms.GroupBox();
            this.rbtn_vendaid = new System.Windows.Forms.RadioButton();
            this.rbtn_funcionario = new System.Windows.Forms.RadioButton();
            this.rbtn_cliente = new System.Windows.Forms.RadioButton();
            this.btn_search = new System.Windows.Forms.Button();
            this.tb_search = new System.Windows.Forms.TextBox();
            this.tabPage2 = new System.Windows.Forms.TabPage();
            this.dgv_inclui = new System.Windows.Forms.DataGridView();
            this.tp_adicionar = new System.Windows.Forms.TabPage();
            this.dgv_addvenda = new System.Windows.Forms.DataGridView();
            this.btn_cancelavenda = new System.Windows.Forms.Button();
            this.btn_regvenda = new System.Windows.Forms.Button();
            this.btn_adicionar = new System.Windows.Forms.Button();
            this.nud_quantprod = new System.Windows.Forms.NumericUpDown();
            this.lb_quantidade = new System.Windows.Forms.Label();
            this.tb_produto = new System.Windows.Forms.TextBox();
            this.lb_produtoid = new System.Windows.Forms.Label();
            this.tb_clienteid = new System.Windows.Forms.TextBox();
            this.lb_clienteid = new System.Windows.Forms.Label();
            this.bnt_Funcionarios = new System.Windows.Forms.Button();
            this.btn_Clientes = new System.Windows.Forms.Button();
            this.btn_financas = new System.Windows.Forms.Button();
            this.btn_produtos = new System.Windows.Forms.Button();
            this.btn_vendas = new System.Windows.Forms.Button();
            this.radioButton1 = new System.Windows.Forms.RadioButton();
            this.gb_vendas.SuspendLayout();
            this.tabControl1.SuspendLayout();
            this.tabPage1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgv_vendas)).BeginInit();
            this.gb_filtros.SuspendLayout();
            this.tabPage2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgv_inclui)).BeginInit();
            this.tp_adicionar.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgv_addvenda)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.nud_quantprod)).BeginInit();
            this.SuspendLayout();
            // 
            // gb_vendas
            // 
            this.gb_vendas.Controls.Add(this.tabControl1);
            this.gb_vendas.Location = new System.Drawing.Point(12, 85);
            this.gb_vendas.Name = "gb_vendas";
            this.gb_vendas.Size = new System.Drawing.Size(1033, 642);
            this.gb_vendas.TabIndex = 5;
            this.gb_vendas.TabStop = false;
            this.gb_vendas.Text = "Vendas";
            // 
            // tabControl1
            // 
            this.tabControl1.Controls.Add(this.tabPage1);
            this.tabControl1.Controls.Add(this.tabPage2);
            this.tabControl1.Controls.Add(this.tp_adicionar);
            this.tabControl1.Location = new System.Drawing.Point(6, 35);
            this.tabControl1.Name = "tabControl1";
            this.tabControl1.SelectedIndex = 0;
            this.tabControl1.Size = new System.Drawing.Size(1021, 601);
            this.tabControl1.TabIndex = 0;
            // 
            // tabPage1
            // 
            this.tabPage1.BackColor = System.Drawing.Color.WhiteSmoke;
            this.tabPage1.Controls.Add(this.dgv_vendas);
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
            // dgv_vendas
            // 
            this.dgv_vendas.AllowUserToAddRows = false;
            this.dgv_vendas.AllowUserToDeleteRows = false;
            dataGridViewCellStyle7.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle7.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle7.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle7.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle7.SelectionBackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle7.SelectionForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle7.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dgv_vendas.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle7;
            this.dgv_vendas.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgv_vendas.EnableHeadersVisualStyles = false;
            this.dgv_vendas.Location = new System.Drawing.Point(6, 79);
            this.dgv_vendas.MultiSelect = false;
            this.dgv_vendas.Name = "dgv_vendas";
            this.dgv_vendas.ReadOnly = true;
            this.dgv_vendas.RowHeadersVisible = false;
            this.dgv_vendas.RowHeadersWidth = 51;
            this.dgv_vendas.RowTemplate.Height = 24;
            this.dgv_vendas.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgv_vendas.Size = new System.Drawing.Size(1001, 487);
            this.dgv_vendas.TabIndex = 4;
            this.dgv_vendas.SelectionChanged += new System.EventHandler(this.dgv_vendas_SelectionChanged);
            // 
            // gb_filtros
            // 
            this.gb_filtros.Controls.Add(this.radioButton1);
            this.gb_filtros.Controls.Add(this.rbtn_vendaid);
            this.gb_filtros.Controls.Add(this.rbtn_funcionario);
            this.gb_filtros.Controls.Add(this.rbtn_cliente);
            this.gb_filtros.Location = new System.Drawing.Point(617, 6);
            this.gb_filtros.Name = "gb_filtros";
            this.gb_filtros.Size = new System.Drawing.Size(390, 51);
            this.gb_filtros.TabIndex = 3;
            this.gb_filtros.TabStop = false;
            this.gb_filtros.Text = "Filtros";
            // 
            // rbtn_vendaid
            // 
            this.rbtn_vendaid.AutoSize = true;
            this.rbtn_vendaid.Location = new System.Drawing.Point(6, 21);
            this.rbtn_vendaid.Name = "rbtn_vendaid";
            this.rbtn_vendaid.Size = new System.Drawing.Size(87, 21);
            this.rbtn_vendaid.TabIndex = 3;
            this.rbtn_vendaid.TabStop = true;
            this.rbtn_vendaid.Text = "Venda ID";
            this.rbtn_vendaid.UseVisualStyleBackColor = true;
            // 
            // rbtn_funcionario
            // 
            this.rbtn_funcionario.AutoSize = true;
            this.rbtn_funcionario.Location = new System.Drawing.Point(177, 21);
            this.rbtn_funcionario.Name = "rbtn_funcionario";
            this.rbtn_funcionario.Size = new System.Drawing.Size(103, 21);
            this.rbtn_funcionario.TabIndex = 2;
            this.rbtn_funcionario.TabStop = true;
            this.rbtn_funcionario.Text = "Funcionario";
            this.rbtn_funcionario.UseVisualStyleBackColor = true;
            // 
            // rbtn_cliente
            // 
            this.rbtn_cliente.AutoSize = true;
            this.rbtn_cliente.Location = new System.Drawing.Point(99, 21);
            this.rbtn_cliente.Name = "rbtn_cliente";
            this.rbtn_cliente.Size = new System.Drawing.Size(72, 21);
            this.rbtn_cliente.TabIndex = 1;
            this.rbtn_cliente.TabStop = true;
            this.rbtn_cliente.Text = "Cliente";
            this.rbtn_cliente.UseVisualStyleBackColor = true;
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
            // tabPage2
            // 
            this.tabPage2.BackColor = System.Drawing.Color.WhiteSmoke;
            this.tabPage2.Controls.Add(this.dgv_inclui);
            this.tabPage2.Location = new System.Drawing.Point(4, 25);
            this.tabPage2.Name = "tabPage2";
            this.tabPage2.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage2.Size = new System.Drawing.Size(1013, 572);
            this.tabPage2.TabIndex = 1;
            this.tabPage2.Text = "Detalhes";
            // 
            // dgv_inclui
            // 
            this.dgv_inclui.AllowUserToAddRows = false;
            this.dgv_inclui.AllowUserToDeleteRows = false;
            dataGridViewCellStyle8.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle8.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle8.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle8.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle8.SelectionBackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle8.SelectionForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle8.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dgv_inclui.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle8;
            this.dgv_inclui.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgv_inclui.EnableHeadersVisualStyles = false;
            this.dgv_inclui.Location = new System.Drawing.Point(6, 43);
            this.dgv_inclui.MultiSelect = false;
            this.dgv_inclui.Name = "dgv_inclui";
            this.dgv_inclui.ReadOnly = true;
            this.dgv_inclui.RowHeadersVisible = false;
            this.dgv_inclui.RowHeadersWidth = 51;
            this.dgv_inclui.RowTemplate.Height = 24;
            this.dgv_inclui.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgv_inclui.Size = new System.Drawing.Size(1001, 487);
            this.dgv_inclui.TabIndex = 5;
            // 
            // tp_adicionar
            // 
            this.tp_adicionar.BackColor = System.Drawing.Color.WhiteSmoke;
            this.tp_adicionar.Controls.Add(this.dgv_addvenda);
            this.tp_adicionar.Controls.Add(this.btn_cancelavenda);
            this.tp_adicionar.Controls.Add(this.btn_regvenda);
            this.tp_adicionar.Controls.Add(this.btn_adicionar);
            this.tp_adicionar.Controls.Add(this.nud_quantprod);
            this.tp_adicionar.Controls.Add(this.lb_quantidade);
            this.tp_adicionar.Controls.Add(this.tb_produto);
            this.tp_adicionar.Controls.Add(this.lb_produtoid);
            this.tp_adicionar.Controls.Add(this.tb_clienteid);
            this.tp_adicionar.Controls.Add(this.lb_clienteid);
            this.tp_adicionar.Location = new System.Drawing.Point(4, 25);
            this.tp_adicionar.Name = "tp_adicionar";
            this.tp_adicionar.Padding = new System.Windows.Forms.Padding(3);
            this.tp_adicionar.Size = new System.Drawing.Size(1013, 572);
            this.tp_adicionar.TabIndex = 3;
            this.tp_adicionar.Text = "Adicionar";
            // 
            // dgv_addvenda
            // 
            this.dgv_addvenda.AllowUserToAddRows = false;
            this.dgv_addvenda.AllowUserToDeleteRows = false;
            dataGridViewCellStyle9.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle9.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle9.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle9.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle9.SelectionBackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle9.SelectionForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle9.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dgv_addvenda.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle9;
            this.dgv_addvenda.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgv_addvenda.EnableHeadersVisualStyles = false;
            this.dgv_addvenda.Location = new System.Drawing.Point(6, 51);
            this.dgv_addvenda.MultiSelect = false;
            this.dgv_addvenda.Name = "dgv_addvenda";
            this.dgv_addvenda.ReadOnly = true;
            this.dgv_addvenda.RowHeadersVisible = false;
            this.dgv_addvenda.RowHeadersWidth = 51;
            this.dgv_addvenda.RowTemplate.Height = 24;
            this.dgv_addvenda.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgv_addvenda.ShowEditingIcon = false;
            this.dgv_addvenda.Size = new System.Drawing.Size(663, 515);
            this.dgv_addvenda.TabIndex = 10;
            // 
            // btn_cancelavenda
            // 
            this.btn_cancelavenda.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F);
            this.btn_cancelavenda.Location = new System.Drawing.Point(716, 505);
            this.btn_cancelavenda.Name = "btn_cancelavenda";
            this.btn_cancelavenda.Size = new System.Drawing.Size(133, 44);
            this.btn_cancelavenda.TabIndex = 9;
            this.btn_cancelavenda.Text = "Cancelar Venda";
            this.btn_cancelavenda.UseVisualStyleBackColor = true;
            this.btn_cancelavenda.Click += new System.EventHandler(this.btn_cancelavenda_Click);
            // 
            // btn_regvenda
            // 
            this.btn_regvenda.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F);
            this.btn_regvenda.Location = new System.Drawing.Point(860, 505);
            this.btn_regvenda.Name = "btn_regvenda";
            this.btn_regvenda.Size = new System.Drawing.Size(133, 44);
            this.btn_regvenda.TabIndex = 8;
            this.btn_regvenda.Text = "Registrar Venda";
            this.btn_regvenda.UseVisualStyleBackColor = true;
            this.btn_regvenda.Click += new System.EventHandler(this.btn_regvenda_Click);
            // 
            // btn_adicionar
            // 
            this.btn_adicionar.Location = new System.Drawing.Point(887, 324);
            this.btn_adicionar.Name = "btn_adicionar";
            this.btn_adicionar.Size = new System.Drawing.Size(85, 28);
            this.btn_adicionar.TabIndex = 7;
            this.btn_adicionar.Text = "Adicionar";
            this.btn_adicionar.UseVisualStyleBackColor = true;
            this.btn_adicionar.Click += new System.EventHandler(this.btn_adicionar_Click);
            // 
            // nud_quantprod
            // 
            this.nud_quantprod.Location = new System.Drawing.Point(780, 327);
            this.nud_quantprod.Name = "nud_quantprod";
            this.nud_quantprod.Size = new System.Drawing.Size(66, 22);
            this.nud_quantprod.TabIndex = 6;
            this.nud_quantprod.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            // 
            // lb_quantidade
            // 
            this.lb_quantidade.AutoSize = true;
            this.lb_quantidade.Location = new System.Drawing.Point(688, 329);
            this.lb_quantidade.Name = "lb_quantidade";
            this.lb_quantidade.Size = new System.Drawing.Size(86, 17);
            this.lb_quantidade.TabIndex = 5;
            this.lb_quantidade.Text = "Quantidade:";
            // 
            // tb_produto
            // 
            this.tb_produto.Location = new System.Drawing.Point(780, 288);
            this.tb_produto.Name = "tb_produto";
            this.tb_produto.Size = new System.Drawing.Size(192, 22);
            this.tb_produto.TabIndex = 4;
            // 
            // lb_produtoid
            // 
            this.lb_produtoid.AutoSize = true;
            this.lb_produtoid.Location = new System.Drawing.Point(695, 291);
            this.lb_produtoid.Name = "lb_produtoid";
            this.lb_produtoid.Size = new System.Drawing.Size(79, 17);
            this.lb_produtoid.TabIndex = 3;
            this.lb_produtoid.Text = "Produto ID:";
            // 
            // tb_clienteid
            // 
            this.tb_clienteid.Location = new System.Drawing.Point(780, 101);
            this.tb_clienteid.Name = "tb_clienteid";
            this.tb_clienteid.Size = new System.Drawing.Size(192, 22);
            this.tb_clienteid.TabIndex = 2;
            // 
            // lb_clienteid
            // 
            this.lb_clienteid.AutoSize = true;
            this.lb_clienteid.Location = new System.Drawing.Point(702, 104);
            this.lb_clienteid.Name = "lb_clienteid";
            this.lb_clienteid.Size = new System.Drawing.Size(72, 17);
            this.lb_clienteid.TabIndex = 1;
            this.lb_clienteid.Text = "Cliente ID:";
            // 
            // bnt_Funcionarios
            // 
            this.bnt_Funcionarios.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.bnt_Funcionarios.Image = global::Interface_SportShop.Properties.Resources.img_employee;
            this.bnt_Funcionarios.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.bnt_Funcionarios.Location = new System.Drawing.Point(620, 12);
            this.bnt_Funcionarios.Name = "bnt_Funcionarios";
            this.bnt_Funcionarios.Size = new System.Drawing.Size(182, 67);
            this.bnt_Funcionarios.TabIndex = 4;
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
            this.btn_Clientes.TabIndex = 3;
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
            this.btn_financas.TabIndex = 2;
            this.btn_financas.TabStop = false;
            this.btn_financas.Text = "Finanças";
            this.btn_financas.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btn_financas.UseVisualStyleBackColor = true;
            this.btn_financas.Click += new System.EventHandler(this.btn_financas_Click);
            // 
            // btn_produtos
            // 
            this.btn_produtos.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.btn_produtos.Image = global::Interface_SportShop.Properties.Resources.img_products;
            this.btn_produtos.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btn_produtos.Location = new System.Drawing.Point(155, 12);
            this.btn_produtos.Name = "btn_produtos";
            this.btn_produtos.Size = new System.Drawing.Size(151, 67);
            this.btn_produtos.TabIndex = 1;
            this.btn_produtos.TabStop = false;
            this.btn_produtos.Text = "Produtos";
            this.btn_produtos.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btn_produtos.UseVisualStyleBackColor = true;
            this.btn_produtos.Click += new System.EventHandler(this.btn_produtos_Click);
            // 
            // btn_vendas
            // 
            this.btn_vendas.Enabled = false;
            this.btn_vendas.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.btn_vendas.Image = global::Interface_SportShop.Properties.Resources.img_sales;
            this.btn_vendas.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btn_vendas.Location = new System.Drawing.Point(12, 12);
            this.btn_vendas.Name = "btn_vendas";
            this.btn_vendas.Size = new System.Drawing.Size(137, 67);
            this.btn_vendas.TabIndex = 0;
            this.btn_vendas.TabStop = false;
            this.btn_vendas.Text = "Vendas";
            this.btn_vendas.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btn_vendas.UseVisualStyleBackColor = true;
            // 
            // radioButton1
            // 
            this.radioButton1.AutoSize = true;
            this.radioButton1.Checked = true;
            this.radioButton1.Location = new System.Drawing.Point(286, 21);
            this.radioButton1.Name = "radioButton1";
            this.radioButton1.Size = new System.Drawing.Size(92, 21);
            this.radioButton1.TabIndex = 4;
            this.radioButton1.TabStop = true;
            this.radioButton1.Text = "Sem Filtro";
            this.radioButton1.UseVisualStyleBackColor = true;
            // 
            // F_main
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1057, 739);
            this.Controls.Add(this.gb_vendas);
            this.Controls.Add(this.bnt_Funcionarios);
            this.Controls.Add(this.btn_Clientes);
            this.Controls.Add(this.btn_financas);
            this.Controls.Add(this.btn_produtos);
            this.Controls.Add(this.btn_vendas);
            this.Name = "F_main";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "SportShop";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.F_main_FormClosing);
            this.Load += new System.EventHandler(this.F_main_Load);
            this.gb_vendas.ResumeLayout(false);
            this.tabControl1.ResumeLayout(false);
            this.tabPage1.ResumeLayout(false);
            this.tabPage1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgv_vendas)).EndInit();
            this.gb_filtros.ResumeLayout(false);
            this.gb_filtros.PerformLayout();
            this.tabPage2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dgv_inclui)).EndInit();
            this.tp_adicionar.ResumeLayout(false);
            this.tp_adicionar.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgv_addvenda)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.nud_quantprod)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button btn_vendas;
        private System.Windows.Forms.Button btn_produtos;
        private System.Windows.Forms.Button btn_financas;
        private System.Windows.Forms.Button btn_Clientes;
        private System.Windows.Forms.Button bnt_Funcionarios;
        private System.Windows.Forms.GroupBox gb_vendas;
        private System.Windows.Forms.TabControl tabControl1;
        private System.Windows.Forms.TabPage tabPage1;
        private System.Windows.Forms.TabPage tabPage2;
        private System.Windows.Forms.Button btn_search;
        private System.Windows.Forms.TextBox tb_search;
        private System.Windows.Forms.GroupBox gb_filtros;
        private System.Windows.Forms.RadioButton rbtn_vendaid;
        private System.Windows.Forms.RadioButton rbtn_funcionario;
        private System.Windows.Forms.RadioButton rbtn_cliente;
        private System.Windows.Forms.TabPage tp_adicionar;
        private System.Windows.Forms.TextBox tb_clienteid;
        private System.Windows.Forms.Label lb_clienteid;
        private System.Windows.Forms.TextBox tb_produto;
        private System.Windows.Forms.Label lb_produtoid;
        private System.Windows.Forms.Button btn_cancelavenda;
        private System.Windows.Forms.Button btn_regvenda;
        private System.Windows.Forms.Button btn_adicionar;
        private System.Windows.Forms.NumericUpDown nud_quantprod;
        private System.Windows.Forms.Label lb_quantidade;
        private System.Windows.Forms.DataGridView dgv_vendas;
        private System.Windows.Forms.DataGridView dgv_addvenda;
        private System.Windows.Forms.DataGridView dgv_inclui;
        private System.Windows.Forms.RadioButton radioButton1;
    }
}