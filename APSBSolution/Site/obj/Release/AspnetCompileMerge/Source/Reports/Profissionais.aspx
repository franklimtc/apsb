<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profissionais.aspx.cs" Inherits="Site.Reports.Report1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col"></div>
        <div class="col">
            <h2>Lista de Profissionais</h2>
        </div>
        <div class="col"></div>
    </div>
    <div class="row">
        <div class="col">
            <asp:Button ID="btExportar" Text="Exportar" runat="server" CssClass="btn btn-secondary" OnClick="btExportar_Click" />
        </div>
    </div>
    <div class="row">
        <div class="col">
            <br />
             <asp:GridView ID="gvMedicos" runat="server" DataSourceID="dsMedico" CssClass="table table-hover table-striped table-sm" AutoGenerateColumns="true">
                 <%--<Columns>
                     <asp:BoundField DataField="cvIdProfissional" HeaderText="ID" />
                     <asp:BoundField DataField="cvTelCelular" HeaderText="Fone" />
                     <asp:BoundField DataField="ccNome" HeaderText="Nome" />
                     <asp:BoundField DataField="ccEmail" HeaderText="Email" />
                 </Columns>--%>
             </asp:GridView>
             <asp:ObjectDataSource ID="dsMedico" runat="server" SelectMethod="Listar" TypeName="Site.Classes.Profissional"></asp:ObjectDataSource>
        </div>
    </div>
</asp:Content>
