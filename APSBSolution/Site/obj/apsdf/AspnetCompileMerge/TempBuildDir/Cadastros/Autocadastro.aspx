<%@ Page Title="Cadastro" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Autocadastro.aspx.cs" Inherits="Site.Cadastros.Autocadastro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%--HiddenFields--%>
            <asp:HiddenField runat="server" ID="Token" />
    <%--HiddenFields--%>

    <div class="row">
        <div class="col-md-4"></div>

        <div class="col-md-4">
            <h2>Auto-Cadastro</h2>
        </div>
        <div class="col-md-4"></div>
    </div>
    <asp:LinkButton runat="server" data-toggle="modal" data-target="#cadastroModal" ToolTip="Editar">
            <asp:button text="Gerar código" runat="server" CssClass="btn btn-secondary" />
    </asp:LinkButton>
    <br />

    <div class="row">
        <div class="col">
            <br />
            <asp:GridView runat="server" ID="gvAutocadastro" CssClass="table table-hover table-striped table-sm" AutoGenerateColumns="false" DataSourceID="dsCadastros2" OnRowCommand="gvAutocadastro_RowCommand" OnPreRender="gvAutocadastro_PreRender">
                <Columns>
                    <asp:BoundField HeaderText = "Nome"  DataField="ccNome" />
                    <asp:BoundField HeaderText = "Email" DataField="ccEmail"/>
                    <asp:BoundField HeaderText = "Token" DataField="Token"/>
                    <asp:BoundField HeaderText = "Data" DataField="cdDataCriacao" DataFormatString="{0:d}"/>
                    <asp:BoundField HeaderText = "Status" DataField="StatusCadastro"/>
                    <asp:BoundField HeaderText = "Taxa Paga" DataField="TaxaPaga"/>
                    <asp:TemplateField ItemStyle-CssClass="imgLink" >
                        <ItemTemplate>
                            <asp:imagebutton imageurl="~/Content/Icons/checkmark-done-circle-outline.svg" Height="1.5em" runat="server" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"  ToolTip="Ativar" CommandName="Ativar"/>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-CssClass="imgLink" >
                        <ItemTemplate>
                            <asp:imagebutton imageurl="~/Content/Icons/refresh-circle-outline.svg" Height="1.5em" runat="server" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"  ToolTip="Renovar Token" CommandName="Renovar"/>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-CssClass="imgLink" >
                        <ItemTemplate >
                            <asp:ImageButton ImageUrl="~/Content/Icons/trash-outline.svg" Height="1.5em" runat="server" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"  ToolTip="Excluir" CommandName="Excluir" OnClientClick="return confirm('Deseja excluir o registro?')" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <%--<asp:ObjectDataSource ID="dsCadastros" runat="server" SelectMethod="ListarAuto" TypeName="Site.Classes.Profissional"></asp:ObjectDataSource>--%>
            <asp:SqlDataSource runat="server" ID="dsCadastros2" ConnectionString="<%$ ConnectionStrings:Dados %>" SelectCommand="SEL_ProfissionalAuto" SelectCommandType="StoredProcedure" />
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="cadastroModal" tabindex="-1" role="dialog" aria-labelledby="cadastroModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="cadastroModalLabel">Cadastro</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col">
                            <label for="tbName">Nome</label>
                            <asp:TextBox runat="server" ID="tbName" CssClass="form-control" />
                            <%--<input type="text" name="tbName" id="tbName" class="form-control" value="" />--%>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <label for="tbEmail">Email</label>
                            <asp:TextBox runat="server" ID="tbEmail" CssClass="form-control" TextMode="Email" />

                            <%--<input type="text" name="tbEmail" id="tbEmail" class="form-control" value="" />--%>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                    <%--<button type="button" class="btn btn-primary">Salvar</button>--%>
                    <asp:Button Text="Salvar" runat="server" CssClass="btn btn-primary" ID="btSalvar" OnClick="btSalvar_Click" />
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript" src="../Scripts/DataTables/media/js/jquery.dataTables.js"></script>

    <script>
        //DataTables

        $(document).ready(function () {
            $('#MainContent_gvAutocadastro').DataTable({
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
