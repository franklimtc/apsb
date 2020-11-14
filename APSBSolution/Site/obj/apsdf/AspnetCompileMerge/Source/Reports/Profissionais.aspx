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
            <asp:GridView ID="gvMedicos" runat="server" DataSourceID="dsMedico" CssClass="table table-hover table-striped table-sm" AutoGenerateColumns="False" OnPreRender="gvMedicos_PreRender">
                <Columns>
                    <asp:BoundField DataField="IdProfissional" HeaderText="ID" SortExpression="IdProfissional" />
                    <asp:BoundField DataField="ccNome" HeaderText="ccNome" SortExpression="ccNome" />
                    <asp:BoundField DataField="ccEmail" HeaderText="Email" SortExpression="ccEmail" />
                    <asp:BoundField DataField="cdDataCriacao" HeaderText="Data" SortExpression="cdDataCriacao" DataFormatString="{0:d}" />
                    <asp:BoundField DataField="Observacoes" HeaderText="Observações" SortExpression="Observacoes" />
                    <asp:BoundField DataField="cvTelefone" HeaderText="Telefone" SortExpression="cvTelefone" />
                    <asp:BoundField DataField="cvCelular" HeaderText="Celular" SortExpression="cvCelular" />
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource ID="dsMedico" runat="server" SelectMethod="Listar" TypeName="Site.Classes.Profissional"></asp:ObjectDataSource>
        </div>
    </div>

    <script type="text/javascript" src="../Scripts/DataTables/media/js/jquery.dataTables.js"></script>
     <script>
        //DataTables

        $(document).ready(function () {
            $('#MainContent_gvMedicos').DataTable({
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
