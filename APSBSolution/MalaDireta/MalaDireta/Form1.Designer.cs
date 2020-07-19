namespace MalaDireta
{
    partial class Form1
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
            this.tbFolder = new System.Windows.Forms.TextBox();
            this.btAbrir = new System.Windows.Forms.Button();
            this.btEnviar = new System.Windows.Forms.Button();
            this.folderDialog = new System.Windows.Forms.FolderBrowserDialog();
            this.tbTitulo = new System.Windows.Forms.TextBox();
            this.tbCorpo = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.pb1 = new System.Windows.Forms.ProgressBar();
            this.SuspendLayout();
            // 
            // tbFolder
            // 
            this.tbFolder.Location = new System.Drawing.Point(12, 52);
            this.tbFolder.Name = "tbFolder";
            this.tbFolder.Size = new System.Drawing.Size(418, 20);
            this.tbFolder.TabIndex = 0;
            // 
            // btAbrir
            // 
            this.btAbrir.Location = new System.Drawing.Point(436, 50);
            this.btAbrir.Name = "btAbrir";
            this.btAbrir.Size = new System.Drawing.Size(75, 23);
            this.btAbrir.TabIndex = 1;
            this.btAbrir.Text = "Abrir";
            this.btAbrir.UseVisualStyleBackColor = true;
            this.btAbrir.Click += new System.EventHandler(this.btAbrir_Click);
            // 
            // btEnviar
            // 
            this.btEnviar.Location = new System.Drawing.Point(434, 91);
            this.btEnviar.Name = "btEnviar";
            this.btEnviar.Size = new System.Drawing.Size(75, 90);
            this.btEnviar.TabIndex = 2;
            this.btEnviar.Text = "Enviar";
            this.btEnviar.UseVisualStyleBackColor = true;
            this.btEnviar.Click += new System.EventHandler(this.btEnviar_Click);
            // 
            // tbTitulo
            // 
            this.tbTitulo.Location = new System.Drawing.Point(12, 91);
            this.tbTitulo.Name = "tbTitulo";
            this.tbTitulo.Size = new System.Drawing.Size(418, 20);
            this.tbTitulo.TabIndex = 4;
            this.tbTitulo.Text = "Título da Mensagem";
            // 
            // tbCorpo
            // 
            this.tbCorpo.Location = new System.Drawing.Point(12, 117);
            this.tbCorpo.Multiline = true;
            this.tbCorpo.Name = "tbCorpo";
            this.tbCorpo.Size = new System.Drawing.Size(418, 64);
            this.tbCorpo.TabIndex = 5;
            this.tbCorpo.Text = "Corpo da mensagem";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 20F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(162, 9);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(207, 31);
            this.label1.TabIndex = 6;
            this.label1.Text = "Envio de Emails";
            // 
            // pb1
            // 
            this.pb1.Location = new System.Drawing.Point(12, 187);
            this.pb1.Name = "pb1";
            this.pb1.Size = new System.Drawing.Size(497, 23);
            this.pb1.TabIndex = 7;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(521, 215);
            this.Controls.Add(this.pb1);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.tbCorpo);
            this.Controls.Add(this.tbTitulo);
            this.Controls.Add(this.btEnviar);
            this.Controls.Add(this.btAbrir);
            this.Controls.Add(this.tbFolder);
            this.Name = "Form1";
            this.Text = "Mala Direta";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox tbFolder;
        private System.Windows.Forms.Button btAbrir;
        private System.Windows.Forms.Button btEnviar;
        private System.Windows.Forms.FolderBrowserDialog folderDialog;
        private System.Windows.Forms.TextBox tbTitulo;
        private System.Windows.Forms.TextBox tbCorpo;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ProgressBar pb1;
    }
}

