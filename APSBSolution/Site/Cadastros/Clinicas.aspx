<%@ Page Title="Clínicas" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Clinicas.aspx.cs" Inherits="Site.Cadastros.Clinicas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        #chkDescontovariavel {
            padding-left: 5px;
        }
    </style>


    <div class="container-fluid">
        <div class="row">
            <div class="col-md-4"></div>

            <div class="col-md-4">
                <h2>Cadastro de Clínicas</h2>
            </div>
            <div class="col-md-4"></div>
        </div>
        <asp:LinkButton runat="server" data-toggle="modal" data-target="#clinicaModal" ToolTip="Editar">
            <asp:Button ID="btNovaClinica" Text="Nova Clínica" runat="server" CssClass="btn btn-secondary" OnClientClick="LimparForm()" />
        </asp:LinkButton>
        <br />
        <div class="row">
            <div class="col-md-12">
                <br />
                <asp:GridView runat="server" ID="gvClinicas" AutoGenerateColumns="False" CssClass="table table-hover table-striped table-sm" OnPreRender="gvClinicas_PreRender" OnRowCommand="gvClinicas_RowCommand">
                    <Columns>
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
                        <asp:BoundField DataField="IdClinica" HeaderText="ID" SortExpression="IdClinica" />
                        
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="btEditarGrid" data-toggle="modal" data-target="#clinicaModal" ToolTip="Editar" CssClass="btEditar">
                                <asp:imagebutton imageurl="~/Content/Icons/business-outline.svg" Height="1.5em" runat="server"/>
                                </asp:LinkButton>&nbsp&nbsp
                            <asp:LinkButton runat="server" ID="btAssociarGrid" data-toggle="modal" data-target="#profissionalModal" ToolTip="Associar">
                                <asp:imagebutton imageurl="~/Content/Icons/person-outline.svg" Height="1.5em" runat="server"/>
                            </asp:LinkButton>&nbsp&nbsp
                                <asp:ImageButton runat="server" id="btExcluirGrid" ImageUrl="~/Content/Icons/trash-outline.svg" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"  Height="1.5em" ToolTip="Excluir" />
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
                                <label for="tbClinicaEmail">Email</label>
                                <asp:TextBox runat="server" ID="tbClinicaEmail" CssClass="form-control" placeholder="..." />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-3">
                                <label for="tbClinicaISS">ISS</label>
                                <asp:TextBox runat="server" ID="tbClinicaISS" CssClass="form-control" Text="2.0" placeholder="..." TextMode="Number" />
                            </div>
                            <div class="col-md-4">
                                <label for="tbDescontos">Descontos</label>
                                <asp:TextBox runat="server" ID="tbDescontos" CssClass="form-control" Text="6.5" placeholder="..." TextMode="Number" />
                            </div>
                            <div class="col-md-5">
                                <label for="dpBancoClinica">Banco</label>
                                <asp:DropDownList runat="server" ID="dpBancoClinica" CssClass="form-control" DataSourceID="dsBancos" DataTextField="ccBanco" DataValueField="IdBanco">
                                </asp:DropDownList>
                                <asp:ObjectDataSource ID="dsBancos" runat="server" SelectMethod="Listar" TypeName="Site.Classes.Banco"></asp:ObjectDataSource>
                            </div>
                        </div>
                        <div class="row">
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
                    <asp:Button ID="btSalvar" Text="Salvar" runat="server" CssClass="btn btn-primary" OnClick="btSalvar_Click" />
                    <asp:HiddenField runat="server" id="tbIdClinica" />
                </div>
            </div>
        </div>
    </div>

    <!-- Modal - Profissional -->
    <div class="modal fade" id="profissionalModal" tabindex="-1" role="dialog" aria-labelledby="profissionalModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="profissionalModalLabel">Associar Profissional</h5>
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
                                        <input type="text" id="tbValorRepasse" class="form-control" placeholder="Filtrar..." name="search" value="10%">
                                    </div>
                                </div>
                            </div>

                            <div>
                                <select id="dpSelectProfissional" class="form-control">
                                    <option>Selecionar...</option>
                                    <option>Adriana Alves De Almeida</option>
                                    <option>Adriane De Fátima Silva De Assumção</option>
                                    <option>Adriano Ferreira Da Silva</option>
                                    <option>Carlos Henrique Pereira Macedo</option>
                                    <option>Carolina Coelho Rodrigues</option>
                                    <option>Clara Bandeira De Mello Parente Lobato</option>
                                    <option>Sara Da Rocha Viana</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <label for="tbObsProfissional">Observações</label>
                            <input type="text" id="tbObsProfissional" name="tbObsProfissional" value="" placeholder="Observações do profissional" style="height: 100px;" class="form-control" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-3">
                            <input type="button" name="tbAdicionar" value="Adicionar" class="btn btn-secondary" />
                        </div>
                    </div>
                    <hr />
                    <div class="row">
                        <asp:Table ID="tbProfissionalClinica" runat="server" CssClass="table table-hover table-striped table-sm">
                            <asp:TableHeaderRow>
                                <asp:TableHeaderCell>ID</asp:TableHeaderCell>
                                <asp:TableHeaderCell>Nome</asp:TableHeaderCell>
                                <asp:TableHeaderCell>Percentual</asp:TableHeaderCell>
                                <asp:TableHeaderCell>Ações</asp:TableHeaderCell>
                            </asp:TableHeaderRow>
                            <asp:TableRow>
                                <asp:TableCell>01</asp:TableCell>
                                <asp:TableCell>Adriana Alves De Almeida</asp:TableCell>
                                <asp:TableCell>10%</asp:TableCell>
                                <asp:TableCell>
                                    <asp:imagebutton imageurl="~/Content/Icons/trash-outline.svg" Height="1.5em" runat="server" ToolTip="Excluir" OnClientClick="confirm('Deseja excluir o registro?')" />
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>02</asp:TableCell>
                                <asp:TableCell>Carlos Henrique Pereira Macedo</asp:TableCell>
                                <asp:TableCell>10%</asp:TableCell>
                                <asp:TableCell>
                                    <asp:imagebutton imageurl="~/Content/Icons/trash-outline.svg" Height="1.5em" runat="server" ToolTip="Excluir" OnClientClick="confirm('Deseja excluir o registro?')" />
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>03</asp:TableCell>
                                <asp:TableCell>Sara Da Rocha Viana</asp:TableCell>
                                <asp:TableCell>8%</asp:TableCell>
                                <asp:TableCell>
                                    <asp:imagebutton imageurl="~/Content/Icons/trash-outline.svg" Height="1.5em" runat="server" ToolTip="Excluir" OnClientClick="confirm('Deseja excluir o registro?')" />
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                    <button type="button" class="btn btn-primary" onclick="alert('Registro salvo com sucesso!')">Salvar</button>
                </div>
            </div>
        </div>
    </div>
    
    <script type="text/javascript" src="../Scripts/DataTables/media/js/jquery.dataTables.js"></script>

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
        });

        function filterProfissional() {
            var keyword = document.getElementById("tbRepasseProfissional").value;
            var select = document.getElementById("dpSelectProfissional");
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
            $("#MainContent_tbClinicaISS").val("");

            $("#MainContent_tbDescontos").val("");
            $("#MainContent_tbObsClinica").val("");
            $("#MainContent_chDescontoVariavel").prop("checked", false);
        }

        function BuscarClinica(idClinica) {
            alert('Buscar Clinica de id' + idClinica);
        }
        $(".btEditar").click(function () {
            alert('botao pressionado!');
        });
    </script>
</asp:Content>
