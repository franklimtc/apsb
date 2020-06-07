<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Report2.aspx.cs" Inherits="Site.Reports.Report2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="row">
        <div class="col"></div>
        <div class="col">
            <h2>Relatório 2</h2>
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
            <asp:GridView ID="gvClinicas" runat="server" DataSourceID="dsClinica" CssClass="table table-hover table-striped table-sm" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="cvIdClinica" HeaderText="ID" />
                    <asp:BoundField DataField="ccApelido" HeaderText="Apelido" />
                    <asp:BoundField DataField="ccEmail" HeaderText="Email" />
                    <asp:BoundField DataField="ccObs" HeaderText="Observações" />
                </Columns>
            </asp:GridView>
             <asp:ObjectDataSource ID="dsClinica" runat="server" SelectMethod="Listar" TypeName="Site.Classes.Clinica"></asp:ObjectDataSource>
        </div>
    </div>
</asp:Content>
