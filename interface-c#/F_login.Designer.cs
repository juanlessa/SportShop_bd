namespace Interface_SportShop
{
    partial class F_login
    {
        /// <summary>
        /// Variável de designer necessária.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Limpar os recursos que estão sendo usados.
        /// </summary>
        /// <param name="disposing">true se for necessário descartar os recursos gerenciados; caso contrário, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Código gerado pelo Windows Form Designer

        /// <summary>
        /// Método necessário para suporte ao Designer - não modifique 
        /// o conteúdo deste método com o editor de código.
        /// </summary>
        private void InitializeComponent()
        {
            this.btn_login = new System.Windows.Forms.Button();
            this.lb_workid = new System.Windows.Forms.Label();
            this.lb_password = new System.Windows.Forms.Label();
            this.tb_workid = new System.Windows.Forms.TextBox();
            this.tb_password = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // btn_login
            // 
            this.btn_login.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.btn_login.Location = new System.Drawing.Point(219, 310);
            this.btn_login.Name = "btn_login";
            this.btn_login.Size = new System.Drawing.Size(93, 30);
            this.btn_login.TabIndex = 0;
            this.btn_login.Text = "LOGIN";
            this.btn_login.UseVisualStyleBackColor = true;
            this.btn_login.Click += new System.EventHandler(this.btn_login_Click);
            // 
            // lb_workid
            // 
            this.lb_workid.AutoSize = true;
            this.lb_workid.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.lb_workid.Location = new System.Drawing.Point(11, 185);
            this.lb_workid.Name = "lb_workid";
            this.lb_workid.Size = new System.Drawing.Size(75, 20);
            this.lb_workid.TabIndex = 1;
            this.lb_workid.Text = "Work ID:";
            // 
            // lb_password
            // 
            this.lb_password.AutoSize = true;
            this.lb_password.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.lb_password.Location = new System.Drawing.Point(11, 243);
            this.lb_password.Name = "lb_password";
            this.lb_password.Size = new System.Drawing.Size(88, 20);
            this.lb_password.TabIndex = 2;
            this.lb_password.Text = "Password:";
            // 
            // tb_workid
            // 
            this.tb_workid.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.tb_workid.Location = new System.Drawing.Point(9, 208);
            this.tb_workid.Name = "tb_workid";
            this.tb_workid.Size = new System.Drawing.Size(312, 26);
            this.tb_workid.TabIndex = 3;
            // 
            // tb_password
            // 
            this.tb_password.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.tb_password.Location = new System.Drawing.Point(9, 266);
            this.tb_password.Name = "tb_password";
            this.tb_password.PasswordChar = '*';
            this.tb_password.Size = new System.Drawing.Size(312, 26);
            this.tb_password.TabIndex = 4;
            // 
            // F_login
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(331, 355);
            this.Controls.Add(this.tb_password);
            this.Controls.Add(this.tb_workid);
            this.Controls.Add(this.lb_password);
            this.Controls.Add(this.lb_workid);
            this.Controls.Add(this.btn_login);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.Fixed3D;
            this.Name = "F_login";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "SportShop";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.F_login_FormClosing);
            this.Load += new System.EventHandler(this.F_login_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btn_login;
        private System.Windows.Forms.Label lb_workid;
        private System.Windows.Forms.Label lb_password;
        private System.Windows.Forms.TextBox tb_workid;
        private System.Windows.Forms.TextBox tb_password;
    }
}

