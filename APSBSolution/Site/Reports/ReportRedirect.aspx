<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ReportRedirect.aspx.cs" Inherits="Site.Reports.ReportRedirect" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     
    <%--DataSources--%>
    <asp:SqlDataSource runat="server" ID="dsRelatorioGeral" ConnectionString="<%$ ConnectionStrings:Dados %>" SelectCommand="PROC_RelatorioGeral" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>
    <%--DataSources--%>


    <div class="row">
        <div class="col">
            <asp:GridView runat="server" ID="gvRelatorioGeral" DataSourceID="dsRelatorioGeral" CssClass="table table-hover table-striped" AutoGenerateColumns="False" DataKeyNames="IdProfissional" OnPreRender="gvRelatorioGeral_PreRender">
                <Columns>
                    <asp:BoundField DataField="IdProfissional" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="IdProfissional" />
                    <asp:BoundField DataField="ccNome" HeaderText="Profissional" SortExpression="ccNome" />
                    <asp:BoundField DataField="CPFNum" HeaderText="CPF" SortExpression="CPFNum" />
                    <asp:BoundField DataField="RGNum" HeaderText="RG" SortExpression="RGNum" />
                    <asp:BoundField DataField="cvPIS" HeaderText="PIS" SortExpression="cvPIS" />
                    <asp:BoundField DataField="cvCNH" HeaderText="CNH" SortExpression="cvCNH" />
                    <asp:BoundField DataField="cvNumInscricao" HeaderText="CREA" SortExpression="cvNumInscricao" />
                    <asp:BoundField DataField="cvTitulo" HeaderText="Titulo Eleitor" SortExpression="cvTitulo" />
                    <asp:BoundField DataField="cdFiliacao" HeaderText="Data Filiação" SortExpression="cdFiliacao" />
                    <asp:BoundField DataField="ccEspecialidade" HeaderText="Especialidade" SortExpression="ccEspecialidade" />
                    <asp:BoundField DataField="ccBanco" HeaderText="Banco" SortExpression="ccBanco" />
                    <asp:BoundField DataField="ccAgencia" HeaderText="Agência" SortExpression="ccAgencia" />
                    <asp:BoundField DataField="ccConta" HeaderText="Conta" SortExpression="ccConta" />
                    <asp:BoundField DataField="cvTaxaProfissional" HeaderText="Taxa" SortExpression="cvTaxaProfissional" />
                    <asp:BoundField DataField="ano" HeaderText="Ano" ReadOnly="True" SortExpression="ano" />
                    <asp:BoundField DataField="mesNome" HeaderText="Mês" ReadOnly="True" SortExpression="mesNome" />
                    <asp:BoundField DataField="cvValorRepasse" HeaderText="Valor Repasse" ReadOnly="True" SortExpression="cvValorRepasse" />
                    <asp:BoundField DataField="ccApelido" HeaderText="Clínica" SortExpression="ccApelido" />
                    <asp:BoundField DataField="cvDescontos" HeaderText="Taxa" SortExpression="cvDescontos" />
                    <asp:BoundField DataField="cvValorClinica" HeaderText="Valor Descontado" ReadOnly="True" SortExpression="cvValorClinica" />
                    <asp:BoundField DataField="anoClinica" HeaderText="Ano" ReadOnly="True" SortExpression="anoClinica" />
                    <asp:BoundField DataField="mesNomeClinica" HeaderText="Mês" ReadOnly="True" SortExpression="mesNomeClinica" />
                </Columns>

            </asp:GridView>
            
        </div>
    </div>
    <script type="text/javascript" src="../Scripts/DataTables/media/js/jquery.dataTables.js"></script>
    <script>
        $(document).ready(function () {
            $('#MainContent_gvRelatorioGeral').DataTable({
                "order": [[0, "desc"]],
                "language": {
                    "lengthMenu": "Exibir _MENU_ registros.",
                    "zeroRecords": "Nenhum registro encontrado.",
                    "info": "Exibindo página _PAGE_ de _PAGES_",
                    "infoEmpty": "No records available", "search": "Procurar", "previous": "Anterior", "paginate": {
                        "previous": "Anterior", "next": "Próximo"
                    }
                }
            });
        })
    </script>
</asp:Content>