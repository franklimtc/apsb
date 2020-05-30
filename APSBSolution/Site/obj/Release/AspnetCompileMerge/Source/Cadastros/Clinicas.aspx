<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Clinicas.aspx.cs" Inherits="Site.Cadastros.Clinicas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-4"></div>

            <div class="col-md-4">
                <h2>Cadastro de Clínicas</h2>
            </div>
            <div class="col-md-4"></div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <%--<asp:GridView runat="server" ID="gvClinicas"></asp:GridView>--%>
                <br />
                <asp:Table runat="server" ID="gvClinicas" CssClass="table table-hover table-striped table-sm">
                    <asp:TableHeaderRow>
                        <asp:TableHeaderCell>ID</asp:TableHeaderCell>
                        <asp:TableHeaderCell>Descrição</asp:TableHeaderCell>
                        <asp:TableHeaderCell>Email</asp:TableHeaderCell>
                        <asp:TableHeaderCell>Ações</asp:TableHeaderCell>
                    </asp:TableHeaderRow>
                    <asp:TableRow>
                        <asp:TableCell>01</asp:TableCell>
                        <asp:TableCell>Clinica A</asp:TableCell>
                        <asp:TableCell>clinica@dominio.com</asp:TableCell>
                        <asp:TableCell>
                            <asp:imagebutton imageurl="~/Content/Icons/create-outline.svg" Height="1.5em" runat="server" ToolTip="Editar" />&nbsp&nbsp
                            <asp:imagebutton imageurl="~/Content/Icons/trash-outline.svg" Height="1.5em" runat="server" ToolTip="Excluir"  OnClientClick="confirm('Deseja excluir o registro?')" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>02</asp:TableCell>
                        <asp:TableCell>Clinica B</asp:TableCell>
                        <asp:TableCell>clinica@dominio.com</asp:TableCell>
                        <asp:TableCell>
                            <asp:imagebutton imageurl="~/Content/Icons/create-outline.svg" Height="1.5em" runat="server" ToolTip="Editar" />&nbsp&nbsp
                            <asp:imagebutton imageurl="~/Content/Icons/trash-outline.svg" Height="1.5em" runat="server" ToolTip="Excluir" OnClientClick="confirm('Deseja excluir o registro?')"  />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>03</asp:TableCell>
                        <asp:TableCell>Clinica C</asp:TableCell>
                        <asp:TableCell>clinica@dominio.com</asp:TableCell>
                        <asp:TableCell>
                            <asp:imagebutton imageurl="~/Content/Icons/create-outline.svg" Height="1.5em" runat="server" ToolTip="Editar" />&nbsp&nbsp
                            <asp:imagebutton imageurl="~/Content/Icons/trash-outline.svg" Height="1.5em" runat="server" ToolTip="Excluir" OnClientClick="confirm('Deseja excluir o registro?')"  />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>04</asp:TableCell>
                        <asp:TableCell>Clinica D</asp:TableCell>
                        <asp:TableCell>clinica@dominio.com</asp:TableCell>
                        <asp:TableCell>
                            <asp:imagebutton imageurl="~/Content/Icons/create-outline.svg" Height="1.5em" runat="server" ToolTip="Editar" />&nbsp&nbsp
                            <asp:imagebutton imageurl="~/Content/Icons/trash-outline.svg" Height="1.5em" runat="server" ToolTip="Excluir"  OnClientClick="confirm('Deseja excluir o registro?')" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </div>
        </div>
    </div>
</asp:Content>
