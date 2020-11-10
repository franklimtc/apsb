<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ReportRedirect.aspx.cs" Inherits="Site.Reports.ReportRedirect" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     
    <%--DataSources--%>
    <asp:SqlDataSource runat="server" ID="dsRelatorioGeral" ConnectionString="<%$ ConnectionStrings:Dados %>" SelectCommand="PROC_RelatorioGeral" SelectCommandType="StoredProcedure">
        <SelectParameters>
             <asp:ControlParameter ControlID="dtInicial" Name="dtInicial" PropertyName="Text" Type="DateTime" />
             <asp:ControlParameter ControlID="dtFinal" Name="dtFinal" PropertyName="Text" Type="DateTime" />
        </SelectParameters>
    </asp:SqlDataSource>
    <%--DataSources--%>

    <div class="row col center">
        <h4>Emissão de Relatórios</h4>
    </div>
    <br />
    <hr />
    <br />
    <div class="row">
        <div class="col-md-2">
            <label for="dtInicial">Data Inicial</label>
            <%--<input type="date" id="dtInicial" runat="server" name="dtInicial" value="" class="form-control" />--%>
            <asp:TextBox runat="server" ID="dtInicial" type="date" CssClass="form-control" requered />
        </div>
        <div class="col-md-2">
            <label for="dtInicial">Data Final</label>
            <%--<input type="date" id="dtFinal" runat="server" name="dtFinal" value="" class="form-control" />--%>
            <asp:TextBox runat="server" ID="dtFinal" type="date" CssClass="form-control"  requered />
        </div>
    </div>
    <div class="row">
        <div class="col-md-2">
            <br />
            <asp:Button Text="Exportar" runat="server" CssClass="btn btn-secondary" />
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col">
            <asp:GridView runat="server" ID="gvRelatorioGeral" DataSourceID="dsRelatorioGeral" CssClass="table table-hover table-striped" AutoGenerateColumns="False" DataKeyNames="IdProfissional" OnPreRender="gvRelatorioGeral_PreRender">
                <Columns>
                    <asp:BoundField DataField="IdProfissional" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="IdProfissional" />
                    <asp:BoundField DataField="ccNome" HeaderText="Profissional" SortExpression="ccNome"  />
                    <asp:BoundField DataField="CPFNum" HeaderText="CPF" SortExpression="CPFNum" />
                    <asp:BoundField DataField="RGNum" HeaderText="RG" SortExpression="RGNum" />
                    <asp:BoundField DataField="telefone" HeaderText="Fone" SortExpression="telefone" />
                    <asp:BoundField DataField="cvPIS" HeaderText="PIS" SortExpression="cvPIS" />
                    <asp:BoundField DataField="cvCNH" HeaderText="CNH" SortExpression="cvCNH" />
                    <asp:BoundField DataField="cvNumInscricao" HeaderText="Registro" SortExpression="cvNumInscricao" />
                    <asp:BoundField DataField="cvTitulo" HeaderText="Titulo Eleitor" SortExpression="cvTitulo" />
                    <asp:BoundField DataField="cdFiliacao" HeaderText="Data Filiação" SortExpression="cdFiliacao" DataFormatString="{0:d}" />
                    <asp:BoundField DataField="ccEspecialidade" HeaderText="Especialidade" SortExpression="ccEspecialidade" />
                    <asp:BoundField DataField="ccBanco" HeaderText="Banco" SortExpression="ccBanco" />
                    <asp:BoundField DataField="ccAgencia" HeaderText="Agência" SortExpression="ccAgencia" />
                    <asp:BoundField DataField="ccConta" HeaderText="Conta" SortExpression="ccConta" />
                    <asp:BoundField DataField="cvTaxaProfissional" HeaderText="Taxa" SortExpression="cvTaxaProfissional" />
                    <asp:BoundField DataField="ano" HeaderText="Ano" ReadOnly="True" SortExpression="ano" Visible="false" />
                    <asp:BoundField DataField="mesNome" HeaderText="Mês" ReadOnly="True" SortExpression="mesNome" Visible="false" />
                    <asp:BoundField DataField="cvValorRepasse" HeaderText="Valor Repasse" ReadOnly="True" SortExpression="cvValorRepasse"  ControlStyle-CssClass="money" />
                    <asp:BoundField DataField="ccApelido" HeaderText="Clínica" SortExpression="ccApelido" />
                    <asp:BoundField DataField="cvDescontos" HeaderText="Descontos (%)" SortExpression="cvDescontos" />
                    <asp:BoundField DataField="cvValorClinica" HeaderText="Valor Pago" ReadOnly="True" SortExpression="cvValorClinica" ControlStyle-CssClass="money" />
                    <asp:BoundField DataField="qtdNotas" HeaderText="Qtd Notas" ReadOnly="True" SortExpression="qtdNotas" />
                    <asp:BoundField DataField="anoClinica" HeaderText="Ano" ReadOnly="True" SortExpression="anoClinica" />
                    <asp:BoundField DataField="mesNomeClinica" HeaderText="Mês" ReadOnly="True" SortExpression="mesNomeClinica" />
                    <asp:BoundField DataField="ccCriadoPor" HeaderText="Usuário" ReadOnly="True" SortExpression="ccCriadoPor" />
                    <asp:BoundField DataField="observacao" HeaderText="OBS" ReadOnly="True" SortExpression="observacao" />
                </Columns>

            </asp:GridView>
            
        </div>
    </div>
    <script type="text/javascript" src="../Scripts/DataTables/media/js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="../Scripts/jquery.mask.js"></script>
    <script src="../Scripts/moment.js"></script>
    <script src="../Scripts/datetime-moment.js"></script>
    <script>
        $(document).ready(function () {
            $('#MainContent_gvRelatorioGeral').DataTable({
                "order": [[1, "asc"]],
                "deferRender": true, 
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