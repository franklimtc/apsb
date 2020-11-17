<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Rentabilidade.aspx.cs" Inherits="Site.Reports.Rentabilidade" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row col center">
        <h4>Relatório de Rentabilidade</h4>
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
            <asp:TextBox runat="server" ID="dtFinal" type="date" CssClass="form-control" requered />
        </div>
    </div>

    <div class="row">
        <div class="col-md-2">
            <asp:Button ID="btnExibir" Text="Exibir" runat="server" CssClass="btn btn-secondary" />
            <asp:Button ID="btnExportar" Text="Exportar" runat="server" CssClass="btn btn-primary" OnClick="btnExportar_Click" />

        </div>
        <div class="col-md-2">
        </div>
    </div>

    <div class="row">
        <div class="col">
            <br />
            <asp:GridView runat="server" ID="gvRentabilidade" DataSourceID="dsRelatorioRentabilidade" CssClass="table table-hover table-striped" AutoGenerateColumns="false" OnPreRender="gvRentabilidade_PreRender">
                <Columns>
                    <asp:BoundField DataField="Clinica" HeaderText="Clínica"/>
                    <asp:BoundField DataField="DescontoClinica" HeaderText="Desconto(%)"/>
                    <asp:BoundField DataField="DescontoReal" HeaderText="Desc. Real(%)"/>
                    <asp:BoundField DataField="Medico" HeaderText="Profissional"/>
                    <asp:BoundField DataField="TaxaProfissional" HeaderText="Taxa(%)"/>
                    <asp:BoundField DataField="ValorNotasFiscais" HeaderText="Valor NFs"/>
                    <asp:BoundField DataField="ValorPagoClinica" HeaderText="Valor Pago"/>
                    <asp:BoundField DataField="ValorRepassadoProfissional" HeaderText="Valor Repassado"/>
                    <asp:BoundField DataField="Impostos" HeaderText="Impostos"/>
                    <asp:BoundField DataField="Valor Final" HeaderText="Valor Final"/>
                </Columns>
            </asp:GridView>
        </div>
    </div>

    <%--DataSources--%>
    <asp:SqlDataSource runat="server" ID="dsRelatorioRentabilidade" ConnectionString="<%$ ConnectionStrings:Dados %>" SelectCommand="REL_Rentabilidade" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="dtInicial" Name="dtInicial" PropertyName="Text" Type="DateTime" />
            <asp:ControlParameter ControlID="dtFinal" Name="dtFinal" PropertyName="Text" Type="DateTime" />
        </SelectParameters>
    </asp:SqlDataSource>
    <%--DataSources--%>

    <script type="text/javascript" src="../Scripts/DataTables/media/js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="../Scripts/jquery.mask.js"></script>
    <script src="../Scripts/moment.js"></script>
    <script src="../Scripts/datetime-moment.js"></script>
    <script>
        $(document).ready(function () {
            $('#MainContent_gvRentabilidade').DataTable({
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
