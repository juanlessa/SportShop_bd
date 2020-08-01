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


namespace Interface_SportShop
{
    public partial class F_financas : Form
    {
        F_main f_main;
        public F_financas(F_main f)
        {
            InitializeComponent();
            f_main = f;
        }


        private void btn_produtos_Click(object sender, EventArgs e)
        {
            f_main.menuControl(2);
        }

        private void btn_vendas_Click(object sender, EventArgs e)
        {
            f_main.menuControl(1);
        }

        private void F_financas_FormClosing(object sender, FormClosingEventArgs e)
        {
            f_main.Close();
        }

        private void bnt_Funcionarios_Click(object sender, EventArgs e)
        {
            f_main.menuControl(5);
        }

        private void btn_Clientes_Click(object sender, EventArgs e)
        {
            f_main.menuControl(4);

        }

        private void F_financas_Load(object sender, EventArgs e)
        {
            decimal total = 0;
            decimal totalfunc = 0;
            DataTable dt = f_main.obterVendas(f_main.cn);
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                total += Decimal.Parse(dt.Rows[i][1].ToString());
                if (f_main.workid.Equals(dt.Rows[i][5].ToString()))
                {
                    totalfunc += Decimal.Parse(dt.Rows[i][1].ToString());
                }
            }
            lb_loja.Text = total.ToString() + " €";
            lb_func.Text = totalfunc.ToString() + " €";
        }
    }
}
