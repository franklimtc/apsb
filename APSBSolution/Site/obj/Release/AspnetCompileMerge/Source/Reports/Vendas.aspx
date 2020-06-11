<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Vendas.aspx.cs" Inherits="Site.Reports.Vendas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="row">
        <div class="col"></div>
        <div class="col">
            <h2>Relatório de Vendas</h2>
        </div>
        <div class="col"></div>
    </div>
     <div class="row">
        <div class="col">
            <asp:Button ID="btExportar" Text="Exportar" runat="server" CssClass="btn btn-secondary"  />
        </div>
    </div>
</asp:Content>
