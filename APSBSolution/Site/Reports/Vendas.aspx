<%@ Page Title="Vendas" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Vendas.aspx.cs" Inherits="Site.Reports.Vendas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        table{
            font-size:10px;
        }
    </style>
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
            <asp:GridView ID="gvVendas" runat="server" DataSourceID="dsVendas" CssClass="table table-hover table-striped table-sm" AutoGenerateColumns="False" OnPreRender="gvVendas_PreRender">
                <Columns>
                    
                    <asp:BoundField DataField="ccApelido" HeaderText="Clínica" SortExpression="ccApelido" />
                    <asp:BoundField DataField="cvCNPJ" HeaderText="CNPJ" SortExpression="cvCNPJ" />

                    <asp:BoundField DataField="cvValor" HeaderText="Valor" SortExpression="cvValor" DataFormatString="{0:C}"/>
                    <asp:BoundField DataField="cvValorPago" HeaderText="Valor Pago" SortExpression="cvValorPago" DataFormatString="{0:C}"/>
                    <asp:BoundField DataField="cvValorRepassado" HeaderText="Valor Repassado" SortExpression="cvValorRepassado" DataFormatString="{0:C}"/>

                    <asp:BoundField DataField="cdEmissao" HeaderText="DT Emissão" SortExpression="cdEmissao"  DataFormatString="{0:d}"/>
                    <asp:BoundField DataField="cdPagamento" HeaderText="DT Pagamento" SortExpression="cdPagamento" DataFormatString="{0:d}"/>
                    <asp:BoundField DataField="cdRepasse" HeaderText="DT Repasse" SortExpression="cdRepasse"  DataFormatString="{0:d}"/>
                    <asp:BoundField DataField="cdPrevistaPgto" HeaderText="DT Prev Pgto" SortExpression="cdPrevistaPgto" DataFormatString="{0:d}"/>
                    
                    <asp:BoundField DataField="cvNF" HeaderText="Nota Fiscal" SortExpression="cvNF" />
                    
                    <asp:BoundField DataField="cvDesconto" HeaderText="Desconto (%)" SortExpression="cvDesconto" DataFormatString="{0:P}"/>
                    <asp:BoundField DataField="cvDescontoValor" HeaderText="Valor Desconto" SortExpression="cvDescontoValor" DataFormatString="{0:C}"/>

                    <asp:BoundField DataField="ccIssRetido" HeaderText="ISS Retido" />
                    <asp:BoundField DataField="cvISS" HeaderText="ISS(%)" SortExpression="cvISS" DataFormatString="{0:P}"/>
                    <asp:BoundField DataField="cvISSValor" HeaderText="Valor ISS" SortExpression="cvISSValor" DataFormatString="{0:C}"/>

                    <asp:BoundField DataField="observacao" HeaderText="observacao" SortExpression="observacao" Visible="false" />
                    <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                    
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource ID="dsVendas" runat="server" SelectMethod="Listar" TypeName="Site.Classes.RelVendas"></asp:ObjectDataSource>
        </div>
    </div>
    <script type="text/javascript" src="../Scripts/DataTables/media/js/jquery.dataTables.js"></script>

    <script>
        //DataTables

        $(document).ready(function () {
            $('#MainContent_gvVendas').DataTable({
                "language": {
                    "lengthMenu": "Exibir _MENU_ registros.",
                    "zeroRecords": "Nenhum registro encontrado.",
                    "info": "Exibindo página _PAGE_ de _PAGES_",
                    "infoEmpty": "No records available", "search": "Procurar", "previous": "Anterior", "paginate": {
                        "previous": "Anterior", "next": "Próximo"
                    }
                }
            });
        });

    </script>
</asp:Content>
