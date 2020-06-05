﻿<%@ Page Title="Cadastro de Profissional" Language="C#" AutoEventWireup="true" CodeBehind="Autocadastro.aspx.cs" Inherits="Site.Autocadastro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title><%: Page.Title %> - APSB</title>

    <asp:PlaceHolder runat="server">
        <%: Scripts.Render("~/bundles/modernizr") %>
    </asp:PlaceHolder>
    <webopt:BundleReference runat="server" Path="~/Content/css" />
    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />
</head>
<body>
   
    <form id="formCadastro" runat="server">
        <asp:ScriptManager runat="server">
            <Scripts>
                <%--To learn more about bundling scripts in ScriptManager see https://go.microsoft.com/fwlink/?LinkID=301884 --%>
                <%--Framework Scripts--%>
                <asp:ScriptReference Name="MsAjaxBundle" />
                <asp:ScriptReference Name="jquery" />
                <asp:ScriptReference Name="bootstrap" />
                <asp:ScriptReference Name="WebForms.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebForms.js" />
                <asp:ScriptReference Name="WebUIValidation.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebUIValidation.js" />
                <asp:ScriptReference Name="MenuStandards.js" Assembly="System.Web" Path="~/Scripts/WebForms/MenuStandards.js" />
                <asp:ScriptReference Name="GridView.js" Assembly="System.Web" Path="~/Scripts/WebForms/GridView.js" />
                <asp:ScriptReference Name="DetailsView.js" Assembly="System.Web" Path="~/Scripts/WebForms/DetailsView.js" />
                <asp:ScriptReference Name="TreeView.js" Assembly="System.Web" Path="~/Scripts/WebForms/TreeView.js" />
                <asp:ScriptReference Name="WebParts.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebParts.js" />
                <asp:ScriptReference Name="Focus.js" Assembly="System.Web" Path="~/Scripts/WebForms/Focus.js" />
                <asp:ScriptReference Name="WebFormsBundle" />
                <%--Site Scripts--%>
            </Scripts>
        </asp:ScriptManager>

        <nav class="navbar fixed-top navbar-dark bg-dark" style="height: 50px;">
            <!-- Navbar content -->
        </nav>
        <div class="container-fluid" style="padding-top: 50px;">
            <div class="row">
                <div class="col-sm-3"></div>
                <div class="col-sm-6">
                    <div class="card">
                        <h5 class="card-header">Cadastro Profissional</h5>
                        <div class="card-body" style="text-align: center">
                            <p class="card-text">Navegue pelas opções e preencha os dados.</p>
                            <div class="row">
                                <div class="col">
                                    <input type="button" class="btn btn-secondary" id="btPessoal" name="tbPessoal" value="Dados Pessoais" />
                                </div>
                                <div class="col">
                                    <input type="button" class="btn btn-secondary" id="btProfissional" name="btProfissional" value="Dados Profissionais" />
                                </div>
                                <div class="col">
                                    <input type="button" class="btn btn-secondary" id="btEndereco" name="tbPessoal" value="Endereço" />
                                </div>
                                <div class="col">
                                    <input type="button" class="btn btn-secondary" id="btBanco" name="tbPessoal" value="Dados Bancários" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3"></div>
            </div>
        </div>
    </form>
    <script>    
        $("#btPessoal").click(function () {
            $("#btPessoal").removeClass("btn-secondary").addClass("btn-info");
            $("#btProfissional").removeClass("btn-info").addClass("btn-secondary");
            $("#btEndereco").removeClass("btn-info").addClass("btn-secondary");
            $("#btBanco").removeClass("btn-info").addClass("btn-secondary");
        });
        $("#btProfissional").click(function () {
            $("#btProfissional").removeClass("btn-secondary").addClass("btn-info");
            $("#btPessoal").removeClass("btn-info").addClass("btn-secondary");
            $("#btEndereco").removeClass("btn-info").addClass("btn-secondary");
            $("#btBanco").removeClass("btn-info").addClass("btn-secondary");
        });
        $("#btEndereco").click(function () {
            $("#btEndereco").removeClass("btn-secondary").addClass("btn-info");
            $("#btProfissional").removeClass("btn-info").addClass("btn-secondary");
            $("#btPessoal").removeClass("btn-info").addClass("btn-secondary");
            $("#btBanco").removeClass("btn-info").addClass("btn-secondary");
        });
        $("#btBanco").click(function () {
            $("#btBanco").removeClass("btn-secondary").addClass("btn-info");
            $("#btProfissional").removeClass("btn-info").addClass("btn-secondary");
            $("#btEndereco").removeClass("btn-info").addClass("btn-secondary");
            $("#btPessoal").removeClass("btn-info").addClass("btn-secondary");
        });
    </script>
</body>
</html>
