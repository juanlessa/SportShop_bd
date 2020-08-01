namespace Interface_SportShop
{
    partial class F_clientes
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle8 = new System.Windows.Forms.DataGridViewCellStyle();
            this.gb_funcionarios = new System.Windows.Forms.GroupBox();
            this.tabControl1 = new System.Windows.Forms.TabControl();
            this.tabPage1 = new System.Windows.Forms.TabPage();
            this.dgv_clientes = new System.Windows.Forms.DataGridView();
            this.tabPage2 = new System.Windows.Forms.TabPage();
            this.lb_remonome = new System.Windows.Forms.Label();
            this.lb_remomail = new System.Windows.Forms.Label();
            this.button3 = new System.Windows.Forms.Button();
            this.lb_prodid = new System.Windows.Forms.Label();
            this.tb_searchnumid = new System.Windows.Forms.TextBox();
            this.button1 = new System.Windows.Forms.Button();
            this.button2 = new System.Windows.Forms.Button();
            this.label7 = new System.Windows.Forms.Label();
            this.label8 = new System.Windows.Forms.Label();
            this.bnt_Funcionarios = new System.Windows.Forms.Button();
            this.btn_Clientes = new System.Windows.Forms.Button();
            this.btn_financas = new System.Windows.Forms.Button();
            this.btn_produtos = new System.Windows.Forms.Button();
            this.btn_vendas = new System.Windows.Forms.Button();
            this.tb_addcc = new System.Windows.Forms.TextBox();
            this.lb_nomeprod = new System.Windows.Forms.Label();
            this.tb_addnome = new System.Windows.Forms.TextBox();
            this.lb_marca = new System.Windows.Forms.Label();
            this.tb_addmail = new System.Windows.Forms.TextBox();
            this.lb_preco = new System.Windows.Forms.Label();
            this.btn_addprod = new System.Windows.Forms.Button();
            this.btn_canceladdprod = new System.Windows.Forms.Button();
            this.tp_adicionar = new System.Windows.Forms.TabPage();
            this.gb_funcionarios.SuspendLayout();
            this.tabControl1.SuspendLayout();
            this.tabPage1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgv_clientes)).BeginInit();
            this.tabPage2.SuspendLayout();
            this.tp_adicionar.SuspendLayout();
            this.SuspendLayout();
            // 
            // gb_funcionarios
            // 
            this.gb_funcionarios.Controls.Add(this.tabControl1);
            this.gb_funcionarios.Location = new System.Drawing.Point(12, 85);
            this.gb_funcionarios.Name = "gb_funcionarios";
            this.gb_funcionarios.Size = new System.Drawing.Size(1033, 642);
            this.gb_funcionarios.TabIndex = 11;
            this.gb_funcionarios.TabStop = false;
            this.gb_funcionarios.Text = "Clientes";
            // 
            // tabControl1
            // 
            this.tabControl1.Controls.Add(this.tabPage1);
            this.tabControl1.Controls.Add(this.tp_adicionar);
            this.tabControl1.Controls.Add(this.tabPage2);
            this.tabControl1.Location = new System.Drawing.Point(6, 35);
            this.tabControl1.Name = "tabControl1";
            this.tabControl1.SelectedIndex = 0;
            this.tabControl1.Size = new System.Drawing.Size(1021, 601);
            this.tabControl1.TabIndex = 0;
            // 
            // tabPage1
            // 
            this.tabPage1.BackColor = System.Drawing.Color.WhiteSmoke;
            this.tabPage1.Controls.Add(this.dgv_clientes);
            this.tabPage1.Location = new System.Drawing.Point(4, 25);
            this.tabPage1.Name = "tabPage1";
            this.tabPage1.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage1.Size = new System.Drawing.Size(1013, 572);
            this.tabPage1.TabIndex = 0;
            this.tabPage1.Text = "Lista";
            // 
            // dgv_clientes
            // 
            this.dgv_clientes.AllowUserToAddRows = false;
            this.dgv_clientes.AllowUserToDeleteRows = false;
            dataGridViewCellStyle8.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle8.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle8.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle8.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle8.SelectionBackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle8.SelectionForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle8.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dgv_clientes.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle8;
            this.dgv_clientes.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgv_clientes.EnableHeadersVisualStyles = false;
            this.dgv_clientes.Location = new System.Drawing.Point(6, 6);
            this.dgv_clientes.MultiSelect = false;
            this.dgv_clientes.Name = "dgv_clientes";
            this.dgv_clientes.ReadOnly = true;
            this.dgv_clientes.RowHeadersVisible = false;
            this.dgv_clientes.RowHeadersWidth = 51;
            this.dgv_clientes.RowTemplate.Height = 24;
            this.dgv_clientes.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgv_clientes.Size = new System.Drawing.Size(1001, 560);
            this.dgv_clientes.TabIndex = 4;
            // 
            // tabPage2
            // 
            this.tabPage2.BackColor = System.Drawing.Color.WhiteSmoke;
            this.tabPage2.Controls.Add(this.lb_remonome);
            this.tabPage2.Controls.Add(this.lb_remomail);
            this.tabPage2.Controls.Add(this.button3);
            this.tabPage2.Controls.Add(this.lb_prodid);
            this.tabPage2.Controls.Add(this.tb_searchnumid);
            this.tabPage2.Controls.Add(this.button1);
            this.tabPage2.Controls.Add(this.button2);
            this.tabPage2.Controls.Add(this.label7);
            this.tabPage2.Controls.Add(this.label8);
            this.tabPage2.Location = new System.Drawing.Point(4, 25);
            this.tabPage2.Name = "tabPage2";
            this.tabPage2.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage2.Size = new System.Drawing.Size(1013, 572);
            this.tabPage2.TabIndex = 4;
            this.tabPage2.Text = "Remover";
            // 
            // lb_remonome
            // 
            this.lb_remonome.AutoSize = true;
            this.lb_remonome.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lb_remonome.Location = new System.Drawing.Point(370, 235);
            this.lb_remonome.Name = "lb_remonome";
            this.lb_remonome.Size = new System.Drawing.Size(0, 20);
            this.lb_remonome.TabIndex = 50;
            // 
            // lb_remomail
            // 
            this.lb_remomail.AutoSize = true;
            this.lb_remomail.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lb_remomail.Location = new System.Drawing.Point(371, 276);
            this.lb_remomail.Name = "lb_remomail";
            this.lb_remomail.Size = new System.Drawing.Size(0, 20);
            this.lb_remomail.TabIndex = 49;
            // 
            // button3
            // 
            this.button3.Image = global::Interface_SportShop.Properties.Resources.img_search;
            this.button3.Location = new System.Drawing.Point(619, 191);
            this.button3.Name = "button3";
            this.button3.Size = new System.Drawing.Size(39, 27);
            this.button3.TabIndex = 46;
            this.button3.TabStop = false;
            this.button3.UseVisualStyleBackColor = true;
            this.button3.Click += new System.EventHandler(this.button3_Click);
            // 
            // lb_prodid
            // 
            this.lb_prodid.AutoSize = true;
            this.lb_prodid.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lb_prodid.Location = new System.Drawing.Point(222, 193);
            this.lb_prodid.Name = "lb_prodid";
            this.lb_prodid.Size = new System.Drawing.Size(130, 20);
            this.lb_prodid.TabIndex = 45;
            this.lb_prodid.Text = "Cartão Cidadão:";
            // 
            // tb_searchnumid
            // 
            this.tb_searchnumid.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tb_searchnumid.Location = new System.Drawing.Point(372, 190);
            this.tb_searchnumid.Name = "tb_searchnumid";
            this.tb_searchnumid.Size = new System.Drawing.Size(241, 27);
            this.tb_searchnumid.TabIndex = 44;
            // 
            // button1
            // 
            this.button1.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button1.Location = new System.Drawing.Point(372, 362);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(107, 35);
            this.button1.TabIndex = 43;
            this.button1.Text = "Cancelar";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // button2
            // 
            this.button2.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button2.Location = new System.Drawing.Point(509, 362);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(104, 35);
            this.button2.TabIndex = 42;
            this.button2.Text = "Remover";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label7.Location = new System.Drawing.Point(309, 276);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(45, 20);
            this.label7.TabIndex = 39;
            this.label7.Text = "Mail:";
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label8.Location = new System.Drawing.Point(296, 235);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(58, 20);
            this.label8.TabIndex = 38;
            this.label8.Text = "Nome:";
            // 
            // bnt_Funcionarios
            // 
            this.bnt_Funcionarios.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.bnt_Funcionarios.Image = global::Interface_SportShop.Properties.Resources.img_employee;
            this.bnt_Funcionarios.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.bnt_Funcionarios.Location = new System.Drawing.Point(620, 12);
            this.bnt_Funcionarios.Name = "bnt_Funcionarios";
            this.bnt_Funcionarios.Size = new System.Drawing.Size(182, 67);
            this.bnt_Funcionarios.TabIndex = 16;
            this.bnt_Funcionarios.TabStop = false;
            this.bnt_Funcionarios.Text = "Funcionarios";
            this.bnt_Funcionarios.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.bnt_Funcionarios.UseVisualStyleBackColor = true;
            this.bnt_Funcionarios.Click += new System.EventHandler(this.bnt_Funcionarios_Click);
            // 
            // btn_Clientes
            // 
            this.btn_Clientes.Enabled = false;
            this.btn_Clientes.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.btn_Clientes.Image = global::Interface_SportShop.Properties.Resources.img_client;
            this.btn_Clientes.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btn_Clientes.Location = new System.Drawing.Point(470, 12);
            this.btn_Clientes.Name = "btn_Clientes";
            this.btn_Clientes.Size = new System.Drawing.Size(144, 67);
            this.btn_Clientes.TabIndex = 15;
            this.btn_Clientes.TabStop = false;
            this.btn_Clientes.Text = "Clientes";
            this.btn_Clientes.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btn_Clientes.UseVisualStyleBackColor = true;
            // 
            // btn_financas
            // 
            this.btn_financas.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.btn_financas.Image = global::Interface_SportShop.Properties.Resources.img_finances;
            this.btn_financas.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btn_financas.Location = new System.Drawing.Point(312, 12);
            this.btn_financas.Name = "btn_financas";
            this.btn_financas.Size = new System.Drawing.Size(152, 67);
            this.btn_financas.TabIndex = 14;
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
            this.btn_produtos.TabIndex = 13;
            this.btn_produtos.TabStop = false;
            this.btn_produtos.Text = "Produtos";
            this.btn_produtos.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btn_produtos.UseVisualStyleBackColor = true;
            this.btn_produtos.Click += new System.EventHandler(this.btn_produtos_Click);
            // 
            // btn_vendas
            // 
            this.btn_vendas.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.btn_vendas.Image = global::Interface_SportShop.Properties.Resources.img_sales;
            this.btn_vendas.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btn_vendas.Location = new System.Drawing.Point(12, 12);
            this.btn_vendas.Name = "btn_vendas";
            this.btn_vendas.Size = new System.Drawing.Size(137, 67);
            this.btn_vendas.TabIndex = 12;
            this.btn_vendas.TabStop = false;
            this.btn_vendas.Text = "Vendas";
            this.btn_vendas.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btn_vendas.UseVisualStyleBackColor = true;
            this.btn_vendas.Click += new System.EventHandler(this.btn_vendas_Click);
            // 
            // tb_addcc
            // 
            this.tb_addcc.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tb_addcc.Location = new System.Drawing.Point(387, 191);
            this.tb_addcc.Name = "tb_addcc";
            this.tb_addcc.Size = new System.Drawing.Size(241, 27);
            this.tb_addcc.TabIndex = 15;
            // 
            // lb_nomeprod
            // 
            this.lb_nomeprod.AutoSize = true;
            this.lb_nomeprod.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lb_nomeprod.Location = new System.Drawing.Point(235, 191);
            this.lb_nomeprod.Name = "lb_nomeprod";
            this.lb_nomeprod.Size = new System.Drawing.Size(130, 20);
            this.lb_nomeprod.TabIndex = 16;
            this.lb_nomeprod.Text = "Cartão Cidadão:";
            // 
            // tb_addnome
            // 
            this.tb_addnome.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tb_addnome.Location = new System.Drawing.Point(387, 232);
            this.tb_addnome.Name = "tb_addnome";
            this.tb_addnome.Size = new System.Drawing.Size(241, 27);
            this.tb_addnome.TabIndex = 17;
            // 
            // lb_marca
            // 
            this.lb_marca.AutoSize = true;
            this.lb_marca.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lb_marca.Location = new System.Drawing.Point(317, 232);
            this.lb_marca.Name = "lb_marca";
            this.lb_marca.Size = new System.Drawing.Size(58, 20);
            this.lb_marca.TabIndex = 18;
            this.lb_marca.Text = "Nome:";
            // 
            // tb_addmail
            // 
            this.tb_addmail.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tb_addmail.Location = new System.Drawing.Point(387, 276);
            this.tb_addmail.Name = "tb_addmail";
            this.tb_addmail.Size = new System.Drawing.Size(241, 27);
            this.tb_addmail.TabIndex = 23;
            // 
            // lb_preco
            // 
            this.lb_preco.AutoSize = true;
            this.lb_preco.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lb_preco.Location = new System.Drawing.Point(330, 279);
            this.lb_preco.Name = "lb_preco";
            this.lb_preco.Size = new System.Drawing.Size(45, 20);
            this.lb_preco.TabIndex = 24;
            this.lb_preco.Text = "Mail:";
            // 
            // btn_addprod
            // 
            this.btn_addprod.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn_addprod.Location = new System.Drawing.Point(522, 383);
            this.btn_addprod.Name = "btn_addprod";
            this.btn_addprod.Size = new System.Drawing.Size(104, 35);
            this.btn_addprod.TabIndex = 25;
            this.btn_addprod.Text = "Adicionar";
            this.btn_addprod.UseVisualStyleBackColor = true;
            this.btn_addprod.Click += new System.EventHandler(this.btn_addprod_Click);
            // 
            // btn_canceladdprod
            // 
            this.btn_canceladdprod.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn_canceladdprod.Location = new System.Drawing.Point(387, 383);
            this.btn_canceladdprod.Name = "btn_canceladdprod";
            this.btn_canceladdprod.Size = new System.Drawing.Size(104, 35);
            this.btn_canceladdprod.TabIndex = 26;
            this.btn_canceladdprod.Text = "Cancelar";
            this.btn_canceladdprod.UseVisualStyleBackColor = true;
            this.btn_canceladdprod.Click += new System.EventHandler(this.btn_canceladdprod_Click);
            // 
            // tp_adicionar
            // 
            this.tp_adicionar.BackColor = System.Drawing.Color.WhiteSmoke;
            this.tp_adicionar.Controls.Add(this.btn_canceladdprod);
            this.tp_adicionar.Controls.Add(this.btn_addprod);
            this.tp_adicionar.Controls.Add(this.lb_preco);
            this.tp_adicionar.Controls.Add(this.tb_addmail);
            this.tp_adicionar.Controls.Add(this.lb_marca);
            this.tp_adicionar.Controls.Add(this.tb_addnome);
            this.tp_adicionar.Controls.Add(this.lb_nomeprod);
            this.tp_adicionar.Controls.Add(this.tb_addcc);
            this.tp_adicionar.Location = new System.Drawing.Point(4, 25);
            this.tp_adicionar.Name = "tp_adicionar";
            this.tp_adicionar.Padding = new System.Windows.Forms.Padding(3);
            this.tp_adicionar.Size = new System.Drawing.Size(1013, 572);
            this.tp_adicionar.TabIndex = 3;
            this.tp_adicionar.Text = "Adicionar";
            // 
            // F_clientes
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1057, 739);
            this.Controls.Add(this.bnt_Funcionarios);
            this.Controls.Add(this.btn_Clientes);
            this.Controls.Add(this.btn_financas);
            this.Controls.Add(this.btn_produtos);
            this.Controls.Add(this.btn_vendas);
            this.Controls.Add(this.gb_funcionarios);
            this.Name = "F_clientes";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "F_clientes";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.F_clientes_FormClosing);
            this.Load += new System.EventHandler(this.F_clientes_Load);
            this.gb_funcionarios.ResumeLayout(false);
            this.tabControl1.ResumeLayout(false);
            this.tabPage1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dgv_clientes)).EndInit();
            this.tabPage2.ResumeLayout(false);
            this.tabPage2.PerformLayout();
            this.tp_adicionar.ResumeLayout(false);
            this.tp_adicionar.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox gb_funcionarios;
        private System.Windows.Forms.TabControl tabControl1;
        private System.Windows.Forms.TabPage tabPage1;
        private System.Windows.Forms.DataGridView dgv_clientes;
        private System.Windows.Forms.TabPage tabPage2;
        private System.Windows.Forms.Button bnt_Funcionarios;
        private System.Windows.Forms.Button btn_Clientes;
        private System.Windows.Forms.Button btn_financas;
        private System.Windows.Forms.Button btn_produtos;
        private System.Windows.Forms.Button btn_vendas;
        private System.Windows.Forms.Label lb_remonome;
        private System.Windows.Forms.Label lb_remomail;
        private System.Windows.Forms.Button button3;
        private System.Windows.Forms.Label lb_prodid;
        private System.Windows.Forms.TextBox tb_searchnumid;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.TabPage tp_adicionar;
        private System.Windows.Forms.Button btn_canceladdprod;
        private System.Windows.Forms.Button btn_addprod;
        private System.Windows.Forms.Label lb_preco;
        private System.Windows.Forms.TextBox tb_addmail;
        private System.Windows.Forms.Label lb_marca;
        private System.Windows.Forms.TextBox tb_addnome;
        private System.Windows.Forms.Label lb_nomeprod;
        private System.Windows.Forms.TextBox tb_addcc;
    }
}