<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Clinicas.aspx.cs" Inherits="Site.Cadastros.Clinicas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-4"></div>

            <div class="col-md-4">
                <h2>Cadastro de Clínicas</h2>
                <spam class="alert-danger">Definir quais as colunas devem fazer parte dessa lista!</spam>
            </div>
            <div class="col-md-4"></div>
        </div>
        <asp:LinkButton runat="server" data-toggle="modal" data-target="#clinicaModal" ToolTip="Editar">
                    <asp:button text="Nova Clínica" runat="server" CssClass="btn btn-secondary" />
        </asp:LinkButton>
        <br />
        <div class="row">
            <div class="col-md-12">
                <%--<asp:GridView runat="server" ID="gvClinicas"></asp:GridView>--%>
                <br />

                <asp:Table runat="server" ID="gvClinicas" CssClass="table table-hover table-striped table-sm">
                    <asp:TableHeaderRow>
                        <asp:TableHeaderCell>ID</asp:TableHeaderCell>
                        <asp:TableHeaderCell>Descrição</asp:TableHeaderCell>
                        <asp:TableHeaderCell>Email</asp:TableHeaderCell>
                        <asp:TableHeaderCell>Ações</asp:TableHeaderCell>
                    </asp:TableHeaderRow>
                    <asp:TableRow>
                        <asp:TableCell>01</asp:TableCell>
                        <asp:TableCell>Clinica A</asp:TableCell>
                        <asp:TableCell>clinica@dominio.com</asp:TableCell>
                        <asp:TableCell>
                            <asp:LinkButton runat="server" data-toggle="modal" data-target="#clinicaModal" ToolTip="Editar">
                                <asp:imagebutton imageurl="~/Content/Icons/business-outline.svg" Height="1.5em" runat="server"/>
                            </asp:LinkButton>&nbsp&nbsp
                                <asp:imagebutton imageurl="~/Content/Icons/trash-outline.svg" Height="1.5em" runat="server" ToolTip="Excluir" OnClientClick="confirm('Deseja excluir o registro?')"/>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>02</asp:TableCell>
                        <asp:TableCell>Clinica B</asp:TableCell>
                        <asp:TableCell>clinica@dominio.com</asp:TableCell>
                        <asp:TableCell>
                            <asp:LinkButton runat="server" data-toggle="modal" data-target="#clinicaModal" ToolTip="Editar">
                                <asp:imagebutton imageurl="~/Content/Icons/business-outline.svg" Height="1.5em" runat="server"/>
                            </asp:LinkButton>&nbsp&nbsp
                                <asp:imagebutton imageurl="~/Content/Icons/trash-outline.svg" Height="1.5em" runat="server" ToolTip="Excluir" OnClientClick="confirm('Deseja excluir o registro?')"/>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>03</asp:TableCell>
                        <asp:TableCell>Clinica C</asp:TableCell>
                        <asp:TableCell>clinica@dominio.com</asp:TableCell>
                        <asp:TableCell>
                            <asp:LinkButton runat="server" data-toggle="modal" data-target="#clinicaModal" ToolTip="Editar">
                                <asp:imagebutton imageurl="~/Content/Icons/business-outline.svg" Height="1.5em" runat="server"/>
                            </asp:LinkButton>&nbsp&nbsp
                                <asp:imagebutton imageurl="~/Content/Icons/trash-outline.svg" Height="1.5em" runat="server" ToolTip="Excluir" OnClientClick="confirm('Deseja excluir o registro?')"/>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>04</asp:TableCell>
                        <asp:TableCell>Clinica D</asp:TableCell>
                        <asp:TableCell>clinica@dominio.com</asp:TableCell>
                        <asp:TableCell>
                            <asp:LinkButton runat="server" data-toggle="modal" data-target="#clinicaModal" ToolTip="Editar">
                                <asp:imagebutton imageurl="~/Content/Icons/business-outline.svg" Height="1.5em" runat="server"/>
                            </asp:LinkButton>&nbsp&nbsp
                                <asp:imagebutton imageurl="~/Content/Icons/trash-outline.svg" Height="1.5em" runat="server" ToolTip="Excluir" OnClientClick="confirm('Deseja excluir o registro?')"/>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="clinicaModal" tabindex="-1" role="dialog" aria-labelledby="clinicaModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="clinicaModalLabel">Clínica</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <div class="row">
                            <div class="col">
                                <label for="tbClinicaNome">Clinica</label>
                                <asp:TextBox runat="server" ID="tbClinicaNome" CssClass="form-control" placeholder="..." />
                            </div>
                        </div>

                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-3">
                                <label for="chkISS">ISS</label>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">
                                            <input id="chkISS" type="checkbox" title="ISS" aria-label="Checkbox for following text input">
                                        </div>
                                    </div>
                                    <label class="form-control">Sim</label>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label for="tbDescontos">Descontos</label>
                                <asp:TextBox runat="server" ID="tbDescontos" CssClass="form-control" placeholder="..." />
                            </div>
                            <div class="col-md-5">
                                <label for="dpBancoClinica">Banco</label>
                                <select id="dpBancoClinica" class="form-control">
                                    <option selected="selected">Selecione..</option>
                                    <option>Banco do Brasil</option>
                                    <option>Bradesco</option>
                                    <option>Caixa</option>
                                    <option>Itau</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <label for="tbObsClinica">Observações</label>
                                <asp:TextBox runat="server" ID="tbObsClinica" CssClass="form-control" TextMode="MultiLine" placeholder="..." />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                    <asp:Button Text="Salvar" runat="server" CssClass="btn btn-primary" OnClientClick="alert('Registro salvo com sucesso!')" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
