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
                    <asp:button text="Nova Clínica" runat="server" CssClass="btn btn-secondary" />
        </asp:LinkButton>
        <br />
        <div class="row">
            <div class="col-md-12">
                <br />
                <asp:GridView runat="server" ID="gvClinicas" AutoGenerateColumns="False" CssClass="table table-hover table-striped table-sm" OnPreRender="gvClinicas_PreRender">
                        <Columns>
                        <asp:BoundField DataField="ccApelido" HeaderText="Apelido" SortExpression="ccApelido" />
                        <asp:BoundField DataField="ccRazaoSocial" HeaderText="ccRazaoSocial" SortExpression="ccRazaoSocial" Visible="false" />
                        <asp:BoundField DataField="ccNomeFantasia" HeaderText="ccNomeFantasia" SortExpression="ccNomeFantasia" Visible="false" />
                        <asp:BoundField DataField="cvCNPJ" HeaderText="cvCNPJ" SortExpression="cvCNPJ" Visible="false"/>
                        <asp:BoundField DataField="ccContato" HeaderText="ccContato" SortExpression="ccContato" Visible="false"/>
                        <asp:BoundField DataField="cvTelefone" HeaderText="cvTelefone" SortExpression="cvTelefone" Visible="false"/>
                        <asp:BoundField DataField="ccEmail" HeaderText="Email" SortExpression="ccEmail" />
                        <asp:BoundField DataField="ccUF" HeaderText="ccUF" SortExpression="ccUF" Visible="false"/>
                        <asp:BoundField DataField="ccCidade" HeaderText="ccCidade" SortExpression="ccCidade" Visible="false"/>
                        <asp:BoundField DataField="cvISS" HeaderText="ISS" SortExpression="cvISS" />
                        <asp:BoundField DataField="cvImpostos" HeaderText="Desconto" SortExpression="cvImpostos" />
                        <asp:BoundField DataField="cbTaxaVariavel" HeaderText="cbTaxaVariavel" SortExpression="cbTaxaVariavel" Visible="false" />
                        <asp:BoundField DataField="ccObs" HeaderText="Observações" SortExpression="ccObs" />
                        <asp:BoundField DataField="cvIdClinica" HeaderText="cvIdClinica" SortExpression="cvIdClinica" Visible="false" />

                    </Columns>
                </asp:GridView>
                <br />
                <%--<asp:ObjectDataSource runat="server" ID="dsClinicas" SelectMethod="Listar" TypeName="Site.Classes.Clinica"></asp:ObjectDataSource>--%>
               <%-- <table id="gvClinicas" class="table table-hover table-striped table-sm">
                    <thead>
                        <tr>
                            <th hidden="hidden">ID</th>
                            <th>Apelido</th>
                            <th>Email</th>
                            <th>ISS</th>
                            <th>Desconto</th>
                            <th>Banco</th>
                            <th>Observações</th>
                            <th>Ações</th>
                        </tr>
                    </thead>
                    <tbody>

                        <tr>
                            <td hidden="hidden">01</td>
                            <td>Clinica B</td>
                            <td>clinica@dominio.com</td>
                            <td>2,0%</td>
                            <td>6,5%</td>
                            <td>CAIXA</td>
                            <td>..</td>
                            <td>
                                <asp:LinkButton runat="server" data-toggle="modal" data-target="#clinicaModal" ToolTip="Editar">
                                <asp:imagebutton imageurl="~/Content/Icons/business-outline.svg" Height="1.5em" runat="server"/>
                                </asp:LinkButton>&nbsp&nbsp
                            <asp:LinkButton runat="server" data-toggle="modal" data-target="#profissionalModal" ToolTip="Associar">
                                <asp:imagebutton imageurl="~/Content/Icons/person-outline.svg" Height="1.5em" runat="server"/>
                            </asp:LinkButton>&nbsp&nbsp
                                <asp:ImageButton ImageUrl="~/Content/Icons/trash-outline.svg" Height="1.5em" runat="server" ToolTip="Excluir" OnClientClick="confirm('Deseja excluir o registro?')" />
                            </td>
                        </tr>
                        <tr>
                            <td hidden="hidden">01</td>
                            <td>Clinica C</td>
                            <td>clinica@dominio.com</td>
                            <td>2,0%</td>
                            <td>6,5%</td>
                            <td>CAIXA</td>
                            <td>..</td>
                            <td>
                                <asp:LinkButton runat="server" data-toggle="modal" data-target="#clinicaModal" ToolTip="Editar">
                                <asp:imagebutton imageurl="~/Content/Icons/business-outline.svg" Height="1.5em" runat="server"/>
                                </asp:LinkButton>&nbsp&nbsp
                            <asp:LinkButton runat="server" data-toggle="modal" data-target="#profissionalModal" ToolTip="Associar">
                                <asp:imagebutton imageurl="~/Content/Icons/person-outline.svg" Height="1.5em" runat="server"/>
                            </asp:LinkButton>&nbsp&nbsp
                                <asp:ImageButton ImageUrl="~/Content/Icons/trash-outline.svg" Height="1.5em" runat="server" ToolTip="Excluir" OnClientClick="confirm('Deseja excluir o registro?')" />
                            </td>
                        </tr>
                        <tr>
                            <td hidden="hidden">01</td>
                            <td>Clinica E</td>
                            <td>clinica@dominio.com</td>
                            <td>2,0%</td>
                            <td>6,5%</td>
                            <td>CAIXA</td>
                            <td>..</td>
                            <td>
                                <asp:LinkButton runat="server" data-toggle="modal" data-target="#clinicaModal" ToolTip="Editar">
                                <asp:imagebutton imageurl="~/Content/Icons/business-outline.svg" Height="1.5em" runat="server"/>
                                </asp:LinkButton>&nbsp&nbsp
                            <asp:LinkButton runat="server" data-toggle="modal" data-target="#profissionalModal" ToolTip="Associar">
                                <asp:imagebutton imageurl="~/Content/Icons/person-outline.svg" Height="1.5em" runat="server"/>
                            </asp:LinkButton>&nbsp&nbsp
                                <asp:ImageButton ImageUrl="~/Content/Icons/trash-outline.svg" Height="1.5em" runat="server" ToolTip="Excluir" OnClientClick="confirm('Deseja excluir o registro?')" />
                            </td>
                        </tr>
                        <tr>
                            <td hidden="hidden">01</td>
                            <td>Clinica D</td>
                            <td>clinica@dominio.com</td>
                            <td>2,0%</td>
                            <td>6,5%</td>
                            <td>CAIXA</td>
                            <td>..</td>
                            <td>
                                <asp:LinkButton runat="server" data-toggle="modal" data-target="#clinicaModal" ToolTip="Editar">
                                <asp:imagebutton imageurl="~/Content/Icons/business-outline.svg" Height="1.5em" runat="server"/>
                                </asp:LinkButton>&nbsp&nbsp
                            <asp:LinkButton runat="server" data-toggle="modal" data-target="#profissionalModal" ToolTip="Associar">
                                <asp:imagebutton imageurl="~/Content/Icons/person-outline.svg" Height="1.5em" runat="server"/>
                            </asp:LinkButton>&nbsp&nbsp
                                <asp:ImageButton ImageUrl="~/Content/Icons/trash-outline.svg" Height="1.5em" runat="server" ToolTip="Excluir" OnClientClick="confirm('Deseja excluir o registro?')" />
                            </td>
                        </tr>


                    </tbody>
                </table>--%>

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
                                <br />
                                <input type="checkbox" name="chDescontoVariavel" />
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
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                    <asp:Button Text="Salvar" runat="server" CssClass="btn btn-primary" OnClientClick="alert('Registro salvo com sucesso!')" />
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
    </script>
</asp:Content>
