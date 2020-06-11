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
            <asp:Button ID="btExportar" Text="Exportar" runat="server" CssClass="btn btn-secondary" OnClick="btExportar_Click" />
        </div>
    </div>
    <div class="row">
        <div class="col">
            <br />
            <asp:GridView ID="gvVendas" runat="server" DataSourceID="dsVendas" CssClass="table table-hover table-striped table-sm" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="cvIDVenda" HeaderText="ID" />
                    <asp:BoundField DataField="ccClinica" HeaderText="Clínica" />
                    <asp:BoundField DataField="ccCNPJ" HeaderText="CNPJ" />
                    <asp:BoundField DataField="ccEmail" HeaderText="Email" />
                    <asp:BoundField DataField="ccCidade" HeaderText="Cidade" />
                    <asp:BoundField DataField="ccUF" HeaderText="UF" />
                    <asp:BoundField DataField="cvNF" HeaderText="NF" />
                    <asp:BoundField DataField="cdDataEmissao" HeaderText="Data Emissao" DataFormatString="{0:d}" />
                    <asp:BoundField DataField="cvValorBruto" HeaderText="Valor Bruto" />
                    <asp:BoundField DataField="cdDataPrevista" HeaderText="Data Prevista" DataFormatString="{0:d}"/>
                    <asp:BoundField DataField="cdDataPagamento" HeaderText="Data Pagamento" DataFormatString="{0:d}" />
                    <asp:BoundField DataField="cvValorPago" HeaderText="Valor Pago" />
                    <asp:BoundField DataField="cvImpostoRetidoPercentual" HeaderText="Imposto Retido (%)" />
                    <asp:BoundField DataField="cvImpostoRetidoValor" HeaderText="Imposto Retido (R$)]" />
                    <asp:BoundField DataField="cvISSPercentual" HeaderText="ISS (%)" />
                    <asp:BoundField DataField="cvISSValor" HeaderText="ISS (R$)" />
                    <asp:BoundField DataField="cdDataRepasse" HeaderText="Data Repasse" DataFormatString="{0:d}" />
                    <asp:BoundField DataField="cvValorRepasse" HeaderText="Valor Repasse" />
                    <asp:BoundField DataField="cvStatus" HeaderText="Status" />
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource ID="dsVendas" runat="server" SelectMethod="Listar" TypeName="Site.Classes.RelVendas"></asp:ObjectDataSource>
        </div>
    </div>
</asp:Content>
