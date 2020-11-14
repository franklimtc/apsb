using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO;
using System.Net.Mail;
using System.Net.Mime;
using System.Configuration;
using System.Net;

namespace MalaDireta
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void btAbrir_Click(object sender, EventArgs e)
        {
            folderDialog.ShowDialog();
            tbFolder.Text = folderDialog.SelectedPath;
        }

        private void btEnviar_Click(object sender, EventArgs e)
        {
            List<string> fileUpdate = new List<string>();
            int qtdErros = 0;
            int qtdOk = 0;
            
            if (tbFolder.Text != "")
            {
                if (Dao.Conectar())
                {
                    FileInfo[] files = new DirectoryInfo(tbFolder.Text).GetFiles();
                   
                    if (files.Length > 0)
                    {
                        pb1.Maximum = files.Length - 1;
                        pb1.Value = 0;

                        foreach (FileInfo f in files)
                        {
                            string name = f.Name.Split('.')[0];
                            Profissional p = new Profissional(name);
                            if (p.ccEmail != null)
                            {


                                if (EnviarEmail(f.FullName, p.ccEmail, tbTitulo.Text, tbCorpo.Text))
                                {
                                    qtdOk++;
                                    fileUpdate.Add(f.FullName);
                                }
                                else
                                {
                                    qtdErros++;
                                }
                            }
                            pb1.PerformStep();
                        }
                    }
                }
            }

            foreach (string s in fileUpdate)
            {
                string[] name = s.Split(char.Parse(@"\"));
                int max = name.Length;
                string nameResumido = name[max - 1].Split('.')[0];

                File.Copy(s, s.Replace(nameResumido, $"{nameResumido}-ENVIADO"));
            }

            if (qtdErros > 0)
            {
                MessageBox.Show("Falha no envio de arquivos!");
            }
            else
            { 
                MessageBox.Show("Arquivos enviados com sucesso!");
            }
        }

        public static bool EnviarEmail(string file, string email, string assunto, string mensagem)
        {
            // Specify the file to be attached and sent.
            // This example assumes that a file named Data.xls exists in the
            // current working directory.
            // Create a message and set up the recipients.
            bool result = false;
            string server = ConfigurationManager.AppSettings["SMTP_Server"];
            string port = ConfigurationManager.AppSettings["SMTP_Port"];
            string userName = ConfigurationManager.AppSettings["SMTP_User"];
            string password = ConfigurationManager.AppSettings["SMTP_Pass"];

            MailMessage message = new MailMessage();
            message.From = new MailAddress(userName);
            message.To.Add(email);
            message.Subject = assunto;
            message.Body = mensagem;

            // Create  the file attachment for this email message.
            Attachment data = new Attachment(file, MediaTypeNames.Application.Octet);
            // Add time stamp information for the file.
            ContentDisposition disposition = data.ContentDisposition;
            disposition.CreationDate = System.IO.File.GetCreationTime(file);
            disposition.ModificationDate = System.IO.File.GetLastWriteTime(file);
            disposition.ReadDate = System.IO.File.GetLastAccessTime(file);
            // Add the file attachment to this email message.
            message.Attachments.Add(data);

            //Send the message.
            SmtpClient client = new SmtpClient(server, int.Parse(port));
            client.EnableSsl = true;
            // Add credentials if the SMTP server requires them.
            client.Credentials = new NetworkCredential(userName, password);

            try
            {
                client.Send(message);
                result = true;
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Exception caught in CreateMessageWithAttachment(): {ex.ToString()}");
            }
            return result;           
        }
    }
}
