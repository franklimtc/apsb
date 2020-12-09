<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Configuracoes.aspx.cs" Inherits="Site.Cadastros.Configurações" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%--Hidden fields--%>
    <asp:HiddenField runat="server" ClientIDMode="Static" ID="idCategoria" Value="" />
    <asp:HiddenField runat="server" ClientIDMode="Static" ID="idTipo" Value="" />
    <%--Hidden fields--%>

    <div class="row">
        <div class="col">
            <h2 style="text-align: center" id="configTitle">Configurações</h2>
        </div>
    </div>
    <div class="row">
        <div class="col-md-2">
            <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                <a class="nav-link active" id="v-pills-despesas-tab" data-toggle="pill" href="#v-pills-despesas" role="tab" aria-controls="v-pills-despesas" aria-selected="true">Despesas</a>
                <a class="nav-link" id="v-pills-receitas-tab" data-toggle="pill" href="#v-pills-receitas" role="tab" aria-controls="v-pills-receitas" aria-selected="false">Receitas</a>
                <a class="nav-link" id="v-pills-clinicas-tab" data-toggle="pill" href="#v-pills-clinicas" role="tab" aria-controls="v-pills-clinicas" aria-selected="false">Clínicas</a>
                <a class="nav-link" id="v-pills-medicos-tab" data-toggle="pill" href="#v-pills-medicos" role="tab" aria-controls="v-pills-medicos" aria-selected="false">Médicos</a>
            </div>
        </div>
        <div class="col-md-10">
            <div class="tab-content" id="v-pills-tabContent">
                <div class="tab-pane fade show active" id="v-pills-despesas" role="tabpanel" aria-labelledby="v-pills-despesas-tab">
                    <div class="container">
                        <div class="row">
                            <div class="col">
                                <h4>Categorias de Despesas</h4>
                                <hr />
                                <br />
                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#categoriaModal">
                                    Nova Categoria
                                </button>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <br />
                                <asp:GridView runat="server" ID="gvCategoriasDespesas" CssClass="table table-hover table-striped table-sm" AutoGenerateColumns="false" OnPreRender="gvCategoriasDespesas_PreRender" OnRowCommand="gvCategoriasDespesas_RowCommand">
                                    <Columns>
                                        <asp:BoundField HeaderText="ID" DataField="idCategoria" ItemStyle-CssClass="rowID" />
                                        <asp:BoundField HeaderText="Categoria" DataField="ccCategoria" />
                                        <asp:BoundField HeaderText="Criado em" DataField="cdCriacao" DataFormatString="{0:d}" />
                                        <asp:BoundField HeaderText="Criado por" DataField="ccUsuario" />
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <input type="image" class="imgButton btn-editar" src="../Content/Icons/edit-24px.svg" data-tipo="categoria" title="Editar" data-id="<%# ((GridViewRow) Container).RowIndex %>" data-pai='<%# DataBinder.Eval(Container.DataItem, "idCategoriaPai")%>' data-categoria='<%# DataBinder.Eval(Container.DataItem, "ccCategoria")%>'/>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="btnDelCategoria" ImageUrl="~/Content/Icons/trash-outline.svg" Height="1.5em" runat="server" ToolTip="Excluir" CommandName="Excluir" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" OnClientClick="return confirm('Deseja excluir este registro')" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <p></p>
                                <h4>Tipos de Despesas</h4>
                                <hr />
                                <br />
                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#tipoModal">
                                    Novo Tipo
                                </button>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <br />
                                <asp:GridView runat="server" ID="gvtiposDespesas" CssClass="table table-hover table-striped table-sm" AutoGenerateColumns="false" OnPreRender="gvtiposDespesas_PreRender" OnRowCommand="gvtiposDespesas_RowCommand">
                                    <Columns>
                                        <asp:BoundField HeaderText="ID" DataField="idTipo" ItemStyle-CssClass="rowID" />
                                        <asp:BoundField HeaderText="Categoria" DataField="ccCategoria" />
                                        <asp:BoundField HeaderText="Tipo" DataField="ccTipo" />
                                        <asp:BoundField HeaderText="Criado em" DataField="cdDataCriacao" DataFormatString="{0:d}" />
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <input type="image"  class="imgButton btn-editar"  src="../Content/Icons/edit-24px.svg" data-tipo="tipo" title="Editar" data-id="<%# ((GridViewRow) Container).RowIndex %>" data-pai='<%# DataBinder.Eval(Container.DataItem, "idCategoria")%>' data-categoria='<%# DataBinder.Eval(Container.DataItem, "ccTipo")%>'/>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="btnDelTipo" ImageUrl="~/Content/Icons/trash-outline.svg" Height="1.5em" runat="server" ToolTip="Excluir" CommandName="Excluir" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" OnClientClick="return confirm('Deseja excluir este registro')"/>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="tab-pane fade" id="v-pills-receitas" role="tabpanel" aria-labelledby="v-pills-receitas-tab">Receitas</div>
                <div class="tab-pane fade" id="v-pills-clinicas" role="tabpanel" aria-labelledby="v-pills-clinicas-tab">Clínicas</div>
                <div class="tab-pane fade" id="v-pills-medicos" role="tabpanel" aria-labelledby="v-pills-medicos-tab">Médicos</div>
            </div>
        </div>
    </div>


    <!-- Modal -->
    <div class="modal fade" id="categoriaModal" tabindex="-1" role="dialog" aria-labelledby="categoriaModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="categoriaModalLabel">Nova Categoria</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col">
                            <span>Categoria Pai</span>
                            <asp:DropDownList runat="server" ID="dpCategoriaPaiNova" DataSourceID="dsCategoriaPai" CssClass="form-control" DataValueField="idCategoria" DataTextField="ccCategoria">
                            </asp:DropDownList>
                            <asp:SqlDataSource runat="server" ID="dsCategoriaPai" ConnectionString="<%$ ConnectionStrings:Dados %>" SelectCommand="SEL_CategoriaPai" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                        </div>
                    </div>
                    <label>Nova Categoria </label>
                    <asp:TextBox runat="server" ID="tbNovaCategoria" CssClass="form-control" />
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                    <%--<button type="button" class="btn btn-primary">Salvar</button>--%>
                    <asp:Button Text="Salvar" ID="btnSalvarCategoria" runat="server" CssClass="btn btn-primary" OnClientClick="return ValidarCheckbox()" OnClick="btnSalvarCategoria_Click" />
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="tipoModal" tabindex="-1" role="dialog" aria-labelledby="tipoModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="tipoModalLabel">Novo Tipo</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <label>Categoria Pai:</label>
                    <asp:DropDownList runat="server" ID="dpCategoriaPai" DataSourceID="dsCategoriaPai" CssClass="form-control" DataValueField="idCategoria" DataTextField="ccCategoria">
                    </asp:DropDownList>

                    <br />

                    <label>Tipo:</label>
                    <asp:TextBox runat="server" ID="tbNovoTipo" CssClass="form-control" />
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                    <asp:Button Text="Salvar" ID="btnSalvarTipo" runat="server" CssClass="btn btn-primary" OnClick="btnSalvarTipo_Click" />
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="../Scripts/DataTables/media/js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="../Scripts/jquery.mask.js"></script>
    <script type="text/javascript" src="../Scripts/Site.js"></script>
    <script type="text/javascript" src="../Scripts/Operacoes/Configuracoes.js"></script>

    <script>
        $(document).ready(function () {

            $('#MainContent_gvtiposDespesas').DataTable({
                "language": {
                    "lengthMenu": "Exibir _MENU_ registros.",
                    "zeroRecords": "Nenhum registro encontrado.",
                    "info": "Exibindo página _PAGE_ de _PAGES_",
                    "infoEmpty": "No records available", "search": "Procurar", "previous": "Anterior", "paginate": {
                        "previous": "Anterior", "next": "Próximo"
                    }
                }
            });

            $('#MainContent_gvCategoriasDespesas').DataTable({
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
