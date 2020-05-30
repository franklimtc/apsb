<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Medicos.aspx.cs" Inherits="Site.Cadastros.Medicos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-4"></div>

            <div class="col-md-4">
                <h2>Cadastro de Médicos</h2>
            </div>
            <div class="col-md-4"></div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <%--<asp:GridView runat="server" ID="gvClinicas"></asp:GridView>--%>
                <br />
                <asp:Table runat="server" ID="gvClinicas" CssClass="table table-hover table-striped table-sm">
                    <asp:TableHeaderRow>
                        <asp:TableHeaderCell>ID</asp:TableHeaderCell>
                        <asp:TableHeaderCell>Nome</asp:TableHeaderCell>
                        <asp:TableHeaderCell>Email</asp:TableHeaderCell>
                        <asp:TableHeaderCell>Ações</asp:TableHeaderCell>
                    </asp:TableHeaderRow>
                    <asp:TableRow>
                        <asp:TableCell>01</asp:TableCell>
                        <asp:TableCell>Médico A</asp:TableCell>
                        <asp:TableCell>clinica@dominio.com</asp:TableCell>
                        <asp:TableCell>
                            <asp:imagebutton imageurl="~/Content/Icons/create-outline.svg" Height="1.5em" runat="server" ToolTip="Editar" />&nbsp&nbsp
                            <asp:imagebutton imageurl="~/Content/Icons/trash-outline.svg" Height="1.5em" runat="server" ToolTip="Excluir" OnClientClick="confirm('Deseja excluir o registro?')" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>02</asp:TableCell>
                        <asp:TableCell>Médico B</asp:TableCell>
                        <asp:TableCell>clinica@dominio.com</asp:TableCell>
                        <asp:TableCell>
                            <asp:imagebutton imageurl="~/Content/Icons/create-outline.svg" Height="1.5em" runat="server" ToolTip="Editar" />&nbsp&nbsp
                            <asp:imagebutton imageurl="~/Content/Icons/trash-outline.svg" Height="1.5em" runat="server" ToolTip="Excluir" OnClientClick="confirm('Deseja excluir o registro?')"  />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>03</asp:TableCell>
                        <asp:TableCell>Médico C</asp:TableCell>
                        <asp:TableCell>clinica@dominio.com</asp:TableCell>
                        <asp:TableCell>
                            <asp:imagebutton imageurl="~/Content/Icons/create-outline.svg" Height="1.5em" runat="server" ToolTip="Editar" />&nbsp&nbsp
                            <asp:imagebutton imageurl="~/Content/Icons/trash-outline.svg" Height="1.5em" runat="server" ToolTip="Excluir" OnClientClick="confirm('Deseja excluir o registro?')"  />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>04</asp:TableCell>
                        <asp:TableCell>Médico D</asp:TableCell>
                        <asp:TableCell>clinica@dominio.com</asp:TableCell>
                        <asp:TableCell>
                            <asp:imagebutton imageurl="~/Content/Icons/create-outline.svg" Height="1.5em" runat="server" ToolTip="Editar" />&nbsp&nbsp
                            <asp:imagebutton imageurl="~/Content/Icons/trash-outline.svg" Height="1.5em" runat="server" ToolTip="Excluir"  OnClientClick="confirm('Deseja excluir o registro?')" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </div>
        </div>
    </div>
    <!-- Button trigger modal -->
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
        Launch demo modal
    </button>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    ...
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
