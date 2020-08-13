<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Clinicas.aspx.cs" Inherits="Site.Reports.Report2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="row">
        <div class="col"></div>
        <div class="col">
            <h2>Lista de Clínicas</h2>
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
            <asp:GridView ID="gvClinicas" runat="server" DataSourceID="dsClinica" CssClass="table table-hover table-striped table-sm" AutoGenerateColumns="false" OnPreRender="gvClinicas_PreRender">
                <Columns>
                    <asp:BoundField DataField="idClinica" HeaderText="ID" />
                    <asp:BoundField DataField="ccUF" HeaderText="UF" Visible="false" />
                    <asp:BoundField DataField="ccCidade" HeaderText="Cidade" Visible="false" />
                    <asp:BoundField DataField="ccRazaoSocial" HeaderText="Razão Social" />
                    <asp:BoundField DataField="ccNomeFantasia" HeaderText="Nome Fantasia" />
                    <asp:BoundField DataField="ccApelido" HeaderText="Apelido" />
                    <asp:BoundField DataField="cvCNPJ" HeaderText="CNPJ" />
                    <asp:BoundField DataField="ccContato" HeaderText="Contato" Visible="false" />
                    <asp:BoundField DataField="cvTelefone" HeaderText="Telefone" Visible="false" />
                    <asp:BoundField DataField="ccEmail" HeaderText="Email" />
                    <asp:BoundField DataField="cvDescontos" HeaderText="Impostos retidos (%)" />
                    <asp:BoundField DataField="ccDescontoVariavel" HeaderText="Taxa variável" />
                </Columns>
            </asp:GridView>
             <asp:ObjectDataSource ID="dsClinica" runat="server" SelectMethod="Listar" TypeName="Site.Classes.Clinica"></asp:ObjectDataSource>
        </div>
    </div>

     <script type="text/javascript" src="../Scripts/DataTables/media/js/jquery.dataTables.js"></script>

    <script>
        //DataTables

        $(document).ready(function () {
            $('#MainContent_gvClinicas').DataTable({
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
