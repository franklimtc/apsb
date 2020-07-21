<%@ Page Title="Clínicas" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Clinicas.aspx.cs" Inherits="Site.Cadastros.Clinicas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        #chkDescontovariavel {
            padding-left: 5px;
        }



    </style>
    <%--Hidden Filds--%>
    <asp:HiddenField runat="server" ID="idHiddenClinica" />
    <asp:HiddenField runat="server" ID="HiddenClinicaDesconto" />
    <asp:HiddenField runat="server" ID="HiddenClinicaName" />
    <asp:HiddenField runat="server" ID="idHiddenChange" />

    <%--Hidden Filds--%>


    <div class="container-fluid">
        <div class="row">
            <div class="col-md-4"></div>

            <div class="col-md-4">
                <h2>Cadastro de Clínicas</h2>
            </div>
            <div class="col-md-4"></div>
        </div>
        <asp:LinkButton runat="server" data-toggle="modal" data-target="#clinicaModal" ToolTip="Editar" OnClientClick="AddRequerid()">
            <asp:Button ID="btNovaClinica" Text="Nova Clínica" runat="server" CssClass="btn btn-secondary" OnClientClick="LimparForm()" />
        </asp:LinkButton>
        <br />
        <div class="row collapse" id="divFiltros">
            <br />
            <div class="col">
                <h2>Filtros adicionais</h2>
                <div class="row">
                    <div class="col">
                        <asp:RadioButtonList runat="server" CssClass="input-group-text" ID="chkStatus">
                            <asp:ListItem Text="Ativo" Selected="True" Value="true" />
                            <asp:ListItem Text="Inativo" Value="false" />
                        </asp:RadioButtonList>
                    </div>
                    <div class="col">
                        <asp:LinkButton ID="btAplicarFiltro" Text="Aplicar" runat="server" CssClass="btn btn-secondary" OnClick="btAplicarFiltro_Click" />
                    </div>
                    <div class="col"></div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <br />
                <asp:GridView runat="server" ID="gvClinicas" AutoGenerateColumns="False" CssClass="table table-hover table-striped table-sm" OnPreRender="gvClinicas_PreRender" OnRowCommand="gvClinicas_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="IdClinica" HeaderText="ID" SortExpression="IdClinica" ItemStyle-CssClass="imgLink"/>
                        <asp:BoundField DataField="ccApelido" HeaderText="Apelido" SortExpression="ccApelido" />
                        <asp:BoundField DataField="ccRazaoSocial" HeaderText="ccRazaoSocial" SortExpression="ccRazaoSocial" Visible="false" />
                        <asp:BoundField DataField="ccNomeFantasia" HeaderText="ccNomeFantasia" SortExpression="ccNomeFantasia" Visible="false" />
                        <asp:BoundField DataField="cvCNPJ" HeaderText="cvCNPJ" SortExpression="cvCNPJ" Visible="false" />
                        <asp:BoundField DataField="ccContato" HeaderText="ccContato" SortExpression="ccContato" Visible="false" />
                        <asp:BoundField DataField="cvTelefone" HeaderText="cvTelefone" SortExpression="cvTelefone" Visible="false" />
                        <asp:BoundField DataField="ccEmail" HeaderText="Email" SortExpression="ccEmail" />
                        <asp:BoundField DataField="ccUF" HeaderText="ccUF" SortExpression="ccUF" Visible="false" />
                        <asp:BoundField DataField="ccCidade" HeaderText="ccCidade" SortExpression="ccCidade" Visible="false" />
                        <asp:BoundField DataField="cvISS" HeaderText="ISS" SortExpression="cvISS" />
                        <asp:BoundField DataField="cvDescontos" HeaderText="Desconto" SortExpression="cvDescontos" />
                        <asp:BoundField DataField="ccTaxaVariavel" HeaderText="ccTaxaVariavel" SortExpression="ccTaxaVariavel" Visible="false" />
                        <asp:BoundField DataField="ccObservacao" HeaderText="Observações" SortExpression="ccObservacao" />
                        <asp:TemplateField ItemStyle-CssClass="imgLink">
                            <ItemTemplate>
                                <asp:ImageButton runat="server" CssClass="imgButton" ID="btEditarGrid" ImageUrl="~/Content/Icons/business-outline.svg" CommandName="Editar" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" Height="1.5em" ToolTip="Editar" />&nbsp&nbsp
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField  ItemStyle-CssClass="imgLink">
                            <ItemTemplate>
                                <asp:ImageButton runat="server" CssClass="imgButton" ID="btAssociarGrid" ImageUrl="~/Content/Icons/person-outline.svg" CommandName="Associar" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" Height="1.5em" ToolTip="Associar" />&nbsp&nbsp
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ItemStyle-CssClass="imgLink">
                            <ItemTemplate>
                                <asp:ImageButton runat="server" CssClass="imgButton" ID="btExcluirGrid" ImageUrl="~/Content/Icons/trash-outline.svg" CommandName="Excluir" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" Height="1.5em" ToolTip="Excluir" OnClientClick="return confirm('Deseja excluir o registro?');" />
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>
                <br />
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
                                <label for="tbApelido">Apelido</label>
                                <asp:TextBox runat="server" ID="tbApelido" CssClass="form-control" placeholder="..." />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <label for="tbRazaoSocial">Razão Social</label>
                                <asp:TextBox runat="server" ID="tbRazaoSocial" CssClass="form-control" placeholder="..." />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <label for="tbClinicaNomeFantasia">Nome Fantasia</label>
                                <asp:TextBox runat="server" ID="tbClinicaNomeFantasia" CssClass="form-control" placeholder="..." />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <label for="tbCNPJ">CNPJ</label>
                                <asp:TextBox runat="server" ID="tbCNPJ" CssClass="form-control cnpj" placeholder="..." />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <label for="tbClinicaEmail">Email</label>
                                <asp:TextBox runat="server" ID="tbClinicaEmail" CssClass="form-control" placeholder="..." TextMode="Email" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-3">
                                <label for="tbClinicaISS">ISS</label>
                                <asp:TextBox runat="server" ID="tbClinicaISS" CssClass="form-control" Text="2,0" />
                            </div>
                            <div class="col-md-4">
                                <label for="tbDescontos">Descontos</label>
                                <asp:TextBox runat="server" ID="tbDescontos" CssClass="form-control" Text="6,5" />
                            </div>
                            <div class="col-md-5">
                                <label for="dpBancoClinica">Banco</label>
                                <asp:DropDownList runat="server" ID="dpBancoClinica" CssClass="form-control" DataSourceID="dsBancos" DataTextField="ccBancoCod" DataValueField="IdBanco">
                                </asp:DropDownList>
                                <asp:ObjectDataSource ID="dsBancos" runat="server" SelectMethod="Listar" TypeName="Site.Classes.Banco"></asp:ObjectDataSource>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <label for="tbPgtoDias">Pagamento em dias</label>
                                <asp:TextBox runat="server" ID="tbPgtoDias" CssClass="form-control" Text="5" placeholder="dias" TextMode="number" />
                            </div>
                            <div class="col">
                                <br />
                                <asp:CheckBox runat="server" ID="chDescontoVariavel" />
                                <label for="chDescontoVariavel">Desconto Variável</label>
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
                    <button type="reset" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                    <asp:Button ID="btSalvar" Text="Salvar" runat="server" CssClass="btn btn-primary" OnClick="btSalvar_Click" OnClientClick="RemoverMascaras()" />
                </div>
            </div>
        </div>
    </div>

    <!-- Modal - Profissional -->
    <div class="modal fade" id="profissionalModal" tabindex="-1" role="dialog" aria-labelledby="profissionalModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="profissionalModalLabel">Associar Profissional <asp:Label  ID="tbTextClinica" runat="server" /></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col">
                            <div class="row">
                                <div class="col-sm-8">
                                    <label for="dpRepasseProfissional">Profissional</label>
                                    <div>
                                        <input type="text" id="tbRepasseProfissional" class="form-control" placeholder="Filtrar..." name="search" onkeyup="filterProfissional()">
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <label for="tbValorRepasse">Percentual</label>
                                    <div>
                                        <asp:TextBox runat="server" ID="tbValorRepasse" CssClass="form-control" Text="10"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div>
                                <asp:DropDownList ID="dpSelectProfissional" runat="server" CssClass="form-control"></asp:DropDownList>

                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <label for="tbObsProfissional">Observações</label>
                            <asp:TextBox runat="server" ID="tbObsProfissional" CssClass="form-control" placeholder="Observações do profissional" TextMode="MultiLine"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-3">
                            <%--<asp:Button ID="btAdicionar" Text="Adicionar" runat="server" CssClass="btn btn-secondary"  />--%>
                            <%--<asp:LinkButton ID="btAdicionarRelacao" Text="Adicinar" runat="server" OnClick="btAdicionarRelacao_Click"  CssClass="btn btn-secondary" />--%>
                            <input type="button" id="btAdicionarRelacao" value="Adicionar" class="btn btn-secondary" onclick="SalvarRelacao()" />
                        </div>
                    </div>
                    <hr />
                    <div class="row">
                        <div class="col">
                            <asp:GridView runat="server" ID="gvProfissionalClinica" CssClass="table table-hover table-striped table-sm" AutoGenerateColumns="false" OnRowCommand="gvProfissionalClinica_RowCommand">
                                <Columns>
                                    <asp:BoundField DataField="IdClinicaProfissional" HeaderText="ID" />
                                    <asp:BoundField DataField="ccNomeProfissional" HeaderText="Nome" />
                                    <asp:BoundField DataField="cvTaxaProfissional" HeaderText="Taxa" />
                                    <asp:BoundField DataField="cvStatus" HeaderText="Status" />
                                    <asp:BoundField DataField="ccObservacao" HeaderText="Observações" />
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btExcluirRelacao" ImageUrl="~/Content/Icons/trash-outline.svg" CommandName="Excluir" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" Height="1.5em" runat="server" ToolTip="Excluir" OnClientClick="return confirm('Deseja excluir o registro?')" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                    <%--<button type="button" class="btn btn-primary" onclick="SalvarRelacao()">Salvar</button>--%>
                    <%--<asp:Button Text="Salvar" runat="server" ID="btSalvarRelacao" CssClass="btn btn-primary" OnClick="btSalvarRelacao_Click" />--%>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript" src="../Scripts/DataTables/media/js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="../Scripts/Operacoes/Clinica.js"></script>
    <script type="text/javascript" src="../Scripts/jquery.mask.js"></script>
    <script type="text/javascript" src="../Scripts/Site.js"></script>

    <script type="text/javascript">
        //Datatables (gvClinicas)
        //DataTables

        $(document).ready(function () {
            $('#MainContent_gvClinicas').DataTable({
                "language": {
                    "lengthMenu": "Exibir _MENU_ registros.",
                    "infoFiltered": "(filtrado de _MAX_ registros)",
                    "zeroRecords": "Nenhum registro encontrado.",
                    "info": "Exibindo página _PAGE_ de _PAGES_",
                    "infoEmpty": "No records available", "search": "Procurar", "previous": "Anterior", "paginate": {
                        "previous": "Anterior", "next": "Próximo"
                    }
                }
            });

            $('#MainContent_gvClinicas_filter').append("<input type='image' name='btFilter' id='btFilter' title='Filtrar' class='imgButton' src='../Content/Icons/filter_alt-24px.svg' style='height:1.2em;'  data-toggle='collapse' data-target='#divFiltros' onclick='return false;' >");

        });

        function filterProfissional() {
            var keyword = document.getElementById("tbRepasseProfissional").value;
            var select = document.getElementById("MainContent_dpSelectProfissional");
            for (var i = 0; i < select.length; i++) {
                var txt = select.options[i].text;
                if (txt.substring(0, keyword.length).toLowerCase() !== keyword.toLowerCase() && keyword.trim() !== "") {
                    $(select.options[i]).attr('disabled', 'disabled').hide();
                } else {
                    $(select.options[i]).removeAttr('disabled').show();
                }
            }
        }

        function LimparForm() {
            $("#MainContent_tbApelido").val("");
            $("#MainContent_tbRazaoSocial").val("");
            $("#MainContent_tbClinicaNomeFantasia").val("");
            $("#MainContent_tbClinicaEmail").val("");
            $("#MainContent_tbClinicaISS").val("2,0");
            $("#MainContent_tbPgtoDias").val("5");
            $("#MainContent_tbCNPJ").val("");

            $("#MainContent_tbDescontos").val("6,5");
            $("#MainContent_tbObsClinica").val("");
            $("#MainContent_idHiddenClinica").val("");
            $("#MainContent_chDescontoVariavel").prop("checked", false);
        }

        $(document).ready(function () {
            $(".imgButton").click(function () {
                $(".form-control").removeAttr("required");
            });
        });

        function AddRequerid() {
            $('#MainContent_tbApelido').attr('required', true);
            $('#MainContent_tbRazaoSocial').attr('required', true);
            $('#MainContent_tbNomeFantasia').attr('required', true);
            $('#MainContent_tbCNPJ').attr('required', true);
        }

    </script>
</asp:Content>
