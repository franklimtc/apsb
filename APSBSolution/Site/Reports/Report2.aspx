<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Report2.aspx.cs" Inherits="Site.Reports.Report2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="row">
        <div class="col">
            <asp:Button ID="btExportar" Text="Exportar" runat="server" CssClass="btn btn-Secondary" OnClick="btExportar_Click" />
        </div>
    </div>
    <div class="row">
        <div class="col">
            <asp:GridView ID="gvClinicas" runat="server" DataSourceID="dsClinica" CssClass="table table-hover table-striped table-sm"></asp:GridView>
             <asp:ObjectDataSource ID="dsClinica" runat="server" SelectMethod="Listar" TypeName="Site.Classes.Clinica"></asp:ObjectDataSource>
        </div>
    </div>
</asp:Content>
