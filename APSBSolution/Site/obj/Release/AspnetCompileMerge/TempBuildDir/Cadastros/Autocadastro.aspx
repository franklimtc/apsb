<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Autocadastro.aspx.cs" Inherits="Site.Cadastros.Autocadastro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
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
            <asp:Table runat="server" ID="gvAutocadastro" CssClass="table table-hover table-striped table-sm">
                <asp:TableHeaderRow>
                    <asp:TableHeaderCell>ID</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Nome</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Email</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Ações</asp:TableHeaderCell>
                </asp:TableHeaderRow>
                <asp:TableRow>
                    <asp:TableCell>APSB0001</asp:TableCell>
                    <asp:TableCell>Abraão Lima</asp:TableCell>
                    <asp:TableCell>abraao@email.com</asp:TableCell>
                    <asp:TableCell>
                        <asp:LinkButton runat="server" data-toggle="modal" data-target="#cadastroaModal" ToolTip="Editar">
                                <asp:imagebutton imageurl="~/Content/Icons/checkmark-done-circle-outline.svg" Height="1.5em" runat="server"/>
                            </asp:LinkButton>&nbsp&nbsp
                        <asp:imagebutton imageurl="~/Content/Icons/trash-outline.svg" Height="1.5em" runat="server" ToolTip="Excluir" OnClientClick="confirm('Deseja excluir o registro?')"/>
                    </asp:TableCell>
                </asp:TableRow>

                 <asp:TableRow>
                    <asp:TableCell>APSB0002</asp:TableCell>
                    <asp:TableCell>Abraão Lima</asp:TableCell>
                    <asp:TableCell>abraao@email.com</asp:TableCell>
                    <asp:TableCell>
                        <asp:imagebutton imageurl="~/Content/Icons/checkmark-done-circle-outline.svg" Height="1.5em" runat="server" ToolTip="Confirmar" OnClientClick="confirm('Deseja confirmar o registro?')"/>&nbsp&nbsp
                        <asp:imagebutton imageurl="~/Content/Icons/trash-outline.svg" Height="1.5em" runat="server" ToolTip="Excluir" OnClientClick="confirm('Deseja excluir o registro?')"/>
                    </asp:TableCell>
                </asp:TableRow>

                 <asp:TableRow>
                    <asp:TableCell>APSB0003</asp:TableCell>
                    <asp:TableCell>Abraão Lima</asp:TableCell>
                    <asp:TableCell>abraao@email.com</asp:TableCell>
                    <asp:TableCell>
                        <asp:imagebutton imageurl="~/Content/Icons/checkmark-done-circle-outline.svg" Height="1.5em" runat="server" ToolTip="Confirmar" OnClientClick="confirm('Deseja confirmar o registro?')"/>&nbsp&nbsp
                        <asp:imagebutton imageurl="~/Content/Icons/trash-outline.svg" Height="1.5em" runat="server" ToolTip="Excluir" OnClientClick="confirm('Deseja excluir o registro?')"/>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
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
                            <input type="text" name="tbName" id="tbName" class="form-control" value="" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <label for="tbEmail">Email</label>
                            <input type="text" name="tbEmail" id="tbEmail" class="form-control" value="" />
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                    <button type="button" class="btn btn-primary">Salvar</button>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
