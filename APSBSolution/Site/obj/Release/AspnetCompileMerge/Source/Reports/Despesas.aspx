<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Despesas.aspx.cs" Inherits="Site.Reports.Despesas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col"></div>
        <div class="col">
            <h2>Relatório de Despesas</h2>
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
            <asp:GridView ID="gvDespesas" runat="server" DataSourceID="dsDespesas" CssClass="table table-hover table-striped table-sm" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="cvID" HeaderText="ID" />
                    <asp:BoundField DataField="ccDespesa" HeaderText="Despesa" />
                    <asp:BoundField DataField="cvValor" HeaderText="Valor" />
                    <asp:BoundField DataField="cdDataVencimento" HeaderText="Vencimento" />
                    <asp:BoundField DataField="cvStatus" HeaderText="Status" />

                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource ID="dsDespesas" runat="server" SelectMethod="Listar" TypeName="Site.Classes.RelDespesas"></asp:ObjectDataSource>
        </div>
    </div>
</asp:Content>
