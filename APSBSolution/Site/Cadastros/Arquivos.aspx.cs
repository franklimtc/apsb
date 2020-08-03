using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Site.Classes;

namespace Site.Cadastros
{
    public partial class Arquivos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                int id = 0;
                int.TryParse(Request.QueryString["id"], out id);
                hiddenID.Value = id.ToString();
                if (!IsPostBack)
                {
                    CarregarModalArquivos();
                }
            }
            catch
            {

            }
          
        }

        private void CarregarModalArquivos()
        {
            List<ProfissionalArquivo> Lista = ProfissionalArquivo.Listar(hiddenID.Value);
            if (Lista.Count == 0)
            {
                Lista.Add(new ProfissionalArquivo());
            }
            gvProfissionalArquivo.DataSource = Lista;
            gvProfissionalArquivo.DataBind();
        }

        protected void btUploadFile_Click(object sender, EventArgs e)
        {
            //string user = User.Identity.Name;
            string user = "Franklim";

            if (btUpload.HasFile)
            {
                if (btUpload.PostedFile.ContentLength < 52428800)
                {
                    string fullPath = $"{Server.MapPath("").Replace("Cadastros", "Arquivos")}\\{btUpload.PostedFile.FileName}";
                    btUpload.PostedFile.SaveAs(fullPath);

                    ProfissionalArquivo pa = new ProfissionalArquivo();
                    pa.ccNomeArquivo = btUpload.PostedFile.FileName;

                    pa.fileBytes = File.ReadAllBytes(fullPath);
                    pa.idProfissional = int.Parse(hiddenID.Value);
                    bool result = pa.Salvar(user);

                    if (result)
                    {
                        //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('Registro salvo com sucesso!');", true);
                        File.Delete(fullPath);
                        CarregarModalArquivos();
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('Falha ao salvar o registro!');", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('Selecione um arquivo com tamanho inferior a 50MB!');", true);
                }

            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "", "alert('Selecione um arquivo!');", true);
            }
        }

        protected void gvProfissionalArquivo_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            var obj = e.CommandArgument;
            int idProfissionalArquivo = int.Parse(gvProfissionalArquivo.Rows[int.Parse(e.CommandArgument.ToString())].Cells[0].Text);
            //string nomeArquivo = Server.HtmlDecode(gvProfissionalArquivo.Rows[int.Parse(e.CommandArgument.ToString())].Cells[1].Text);
            string nomeArquivo = ProfissionalArquivo.GetName(idProfissionalArquivo);
            //string user = User.Identity.Name;
            string user = "Franklim";
            bool result = false;
            switch (e.CommandName)
            {
                case "Excluir":
                    ProfissionalArquivo file = new ProfissionalArquivo();
                    file.idArquivo = idProfissionalArquivo;
                    result = file.Excluir(user);
                    if (result)
                    {
                        gvProfissionalArquivo.DataBind();
                        CarregarModalArquivos();
                    }
                    break;
                case "Baixar":
                    string fullPath = $"{Server.MapPath("").Replace("Cadastros", "Arquivos")}\\{nomeArquivo}";
                    ProfissionalArquivo.BaixarArquivo(fullPath, idProfissionalArquivo);

                    Response.ContentType = "application/pdf";
                    Response.AppendHeader("Content-Disposition", $"attachment; filename={nomeArquivo}");
                    Response.ContentEncoding = Encoding.Default;
                    Response.TransmitFile(fullPath);
                    Response.End();

                    File.Delete(fullPath);
                    CarregarModalArquivos();
                    break;
                default:
                    break;
            }
        }
    }
}