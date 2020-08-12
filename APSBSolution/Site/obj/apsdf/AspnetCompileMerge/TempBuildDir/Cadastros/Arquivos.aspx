<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Arquivos.aspx.cs" Inherits="Site.Cadastros.Arquivos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link rel="stylesheet" href="../Content/bootstrap.css" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server" EnablePageMethods="true">
        </asp:ScriptManager>

        <asp:HiddenField runat="server" ID="hiddenID" />
        <!-- Modal Arquivos -->

        <div class="container-fluid">
            <div class="row">
                <div class="col">
                    <h4>Inserir Arquivos</h4>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-9">
                    <asp:FileUpload runat="server" ID="btUpload" CssClass="btn btn-secondary" />
                    <%--<input type="file" id="myfile" name="myfile" class="btn">--%><br>
                    <br>
                </div>
                <div class="col-sm-3">
                    <%--<input id="btUploadFile" type="button" class="btn btn-primary" value="Enviar">--%>
                    <asp:Button Text="Enviar" runat="server" ID="btUploadFile" CssClass="btn btn-primary" OnClick="btUploadFile_Click" />
                </div>
            </div>
            <div class="row">
                <div class="col">
                </div>
            </div>
            <hr />
            <div class="row">
                <div class="col">
                    <asp:GridView runat="server" ID="gvProfissionalArquivo" CssClass="table table-hover table-striped table-sm" AutoGenerateColumns="false" OnRowCommand="gvProfissionalArquivo_RowCommand">
                        <Columns>
                            <asp:BoundField DataField="idArquivo" HeaderText="ID" />
                            <asp:BoundField DataField="ccNomeArquivo" HeaderText="Arquivo" />
                            <asp:BoundField DataField="cdDataCriacao" HeaderText="Data" DataFormatString="{0:d}" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" ID="btBaixarArquivo" ImageUrl="~/Content/Icons/cloud-download-outline.svg" CommandName="Baixar" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" Height="1.5em" ToolTip="Editar" />&nbsp&nbsp
                                            <asp:ImageButton runat="server" ID="btExcluirArquivo" ImageUrl="~/Content/Icons/trash-outline.svg" CommandName="Excluir" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" Height="1.5em" ToolTip="Editar" OnClientClick="return confirm('Deseja excluir o registro?');" />&nbsp&nbsp
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>

    </form>
    <script type="text/html" src="../Scripts/jquery-3.5.1.js"></script>
</body>
</html>
