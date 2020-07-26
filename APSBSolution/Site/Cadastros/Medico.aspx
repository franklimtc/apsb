<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Medico.aspx.cs" Inherits="Site.Cadastros.Medico" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        #fileLoader {
            display: none;
        }

        .imgButton {
            height: 1.5em;
        }
    </style>
    <%--Hidden Filds--%>
    <input type="hidden" id="idHiddenMedico" name="idHiddenMedico" />
    <input type="hidden" id="idHiddenProfissionalEndereco" name="idHiddenProfissionalEndereco" />
    <input type="hidden" id="idHiddenProfissionalBanco" name="idHiddenProfissionalBanco" />
    <input type="hidden" id="idHiddenProfissionalDado" name="idHiddenProfissionalDado" />
    <input type="hidden" id="nameProfissional" name="nameProfissional" />
    <%--Hidden Filds--%>

    <div class="row">
        <div class="col-md-4"></div>

        <div class="col-md-4">
            <h2>Cadastro de Médicos</h2>
        </div>
        <div class="col-md-4"></div>
    </div>
    <asp:LinkButton runat="server" data-toggle="modal" data-target="#medicoModal" ToolTip="Editar" CssClass="btn btn-secondary"  OnClientClick="ResetForm()">
        Novo Médico
    </asp:LinkButton>
    <div class="row">
        <div class="col">
            <br />

            <asp:GridView runat="server" ID="gvMedicos" DataSourceID="dsMedicos" AutoGenerateColumns="False" CssClass="table table-hover table-striped table-sm" UseAccessibleHeader="true" OnPreRender="gvMedicos_PreRender">
                <Columns>
                    <asp:BoundField DataField="IdProfissional" HeaderText="ID" ItemStyle-CssClass="imgLink" />
                    <asp:BoundField DataField="ccNome" HeaderText="Nome" />
                    <asp:BoundField DataField="ccEmail" HeaderText="Email" />
                    <asp:BoundField DataField="Observacoes" HeaderText="Observações" />
                    <asp:TemplateField ItemStyle-CssClass="imgLink">
                        <ItemTemplate>
                            <input type="image" class="imgButton" src="../Content/Icons/person-outline.svg" onclick="<%# DataBinder.Eval(Container.DataItem, "IdProfissional", "CarregarModal({0});") %>"/>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-CssClass="imgLink">
                        <ItemTemplate>
                            <asp:ImageButton runat="server" CssClass="imgButton" ID="btEdProfissionais" ImageUrl="~/Content/Icons/medkit-outline.svg" CommandName="EdProfissionais" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" ToolTip="Dados Profissionais" OnClientClick="LimparForm();" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-CssClass="imgLink">
                        <ItemTemplate>
                            <asp:ImageButton runat="server" CssClass="imgButton" ID="btEdEndereco" ImageUrl="~/Content/Icons/home-outline.svg" CommandName="EdEndereco" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" ToolTip="Endereço" OnClientClick="LimparForm()" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-CssClass="imgLink">
                        <ItemTemplate>
                            <asp:ImageButton runat="server" CssClass="imgButton" ID="btEdBanco" ImageUrl="~/Content/Icons/cash-outline.svg" CommandName="EdBanco" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" ToolTip="Dados Bancários" OnClientClick="LimparForm()" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-CssClass="imgLink">
                        <ItemTemplate>
                            <asp:ImageButton runat="server" CssClass="imgButton" ID="btAddArquivos" ImageUrl="~/Content/Icons/archive-outline.svg" CommandName="AddArquivos" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" ToolTip="Adicionar arquivos" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-CssClass="imgLink">
                        <ItemTemplate>
                            <asp:ImageButton runat="server" CssClass="imgButton" ID="btExcluir" ImageUrl="~/Content/Icons/trash-outline.svg" CommandName="Excluir" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" ToolTip="Excluir" OnClientClick="return confirm('Deseja excluir o registro?');" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource runat="server" ID="dsMedicos" SelectMethod="Listar" TypeName="Site.Classes.Profissional" />
        </div>
    </div>
    <%--Modais--%>
    <div class="modal" tabindex="-1" role="dialog" id="medicoModal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Dados Pessoais</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="tbNome">Nome:</label>
                        <input type="text" name="tbNome" id="tbNome" value="" class="form-control" required />
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-sm-3">
                                <label for="dpSexo">Sexo:</label>
                                <select id="dpSexo" class="form-control">
                                    <option value="M">M</option>
                                    <option value="F">F</option>
                                </select>
                            </div>
                            <div class="col-sm-5">
                                <label for="dpUFNatural">Natural(UF):</label>
                                <select id="dpUFNatural" class="form-control">
                                    <option value="AC">Acre</option>
                                    <option value="AL">Alagoas</option>
                                    <option value="AP">Amapá</option>
                                    <option value="AM">Amazonas</option>
                                    <option value="BA">Bahia</option>
                                    <option value="CE">Ceará</option>
                                    <option value="DF" selected="selected">Distrito Federal</option>
                                    <option value="GO">Goiás</option>
                                    <option value="MA">Maranhão</option>
                                    <option value="MT">Mato Grosso</option>
                                    <option value="MS">Mato Grosso do Sul</option>
                                    <option value="MG">Minas Gerais</option>
                                    <option value="PA">Pará</option>
                                    <option value="PB">Paraíba</option>
                                    <option value="PR">Paraná</option>
                                    <option value="PE">Pernambuco</option>
                                    <option value="PI">Piauí</option>
                                    <option value="RJ">Rio de Janeiro</option>
                                    <option value="RN">Rio Grande do Norte</option>
                                    <option value="RS">Rio Grande do Sul</option>
                                    <option value="RO">Rondônia</option>
                                    <option value="RR">Roraima</option>
                                    <option value="SC">Santa Catarina</option>
                                    <option value="SP">São Paulo</option>
                                    <option value="SE">Sergipe</option>
                                    <option value="TO">Tocantins</option>
                                </select>
                            </div>
                            <div class="col-sm-4">
                                <label for="tbCidade">Cidade:</label>
                                <input type="text" name="tbCidade" id="tbCidade" value="" class="form-control" required />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <label for="tbEstCivil">Estado Civil:</label>
                                <select id="tbEstCivil" class="form-control">
                                    <option value="C">Casado</option>
                                    <option value="S">Solteiro</option>
                                </select>
                            </div>
                            <div class="col">
                                <label for="tbdtNascimento">Data de Nascimento:</label>
                                <input type="text" name="tbNome" id="tbdtNascimento" value="" class="form-control date" required />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="tbPai">Nome do pai:</label>
                            <input type="text" name="tbPai" id="tbPai" value="" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="tbMae">Nome da mãe:</label>
                            <input type="text" name="tbMae" id="tbMae" value="" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="tbConjuge">Nome do cônjuge:</label>
                            <input type="text" name="tbConjuge" id="tbConjuge" value="" class="form-control" />
                        </div>
                        <div class="row">
                            <div class="col">
                                <label for="tbRGNum">RG:</label>
                                <input type="text" name="tbRGNum" id="tbRGNum" value="" class="form-control number" required />
                            </div>
                            <div class="col">
                                <label for="tbRGEmissor">Órgão Emissor:</label>
                                <input type="text" name="tbRGEmissor" id="tbRGEmissor" value="" class="form-control" required />
                            </div>
                            <div class="col">
                                <label for="tbRGdata">Data Emissão:</label>
                                <input type="text" name="tbRGdata" id="tbRGdata" value="" class="form-control date" required />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <label for="tbCPF">CPF:</label>
                                <input type="text" name="tbCPF" id="tbCPF" value="" class="form-control cpf" required />
                            </div>
                            <div class="col">
                                <label for="tbCNH">CNH:</label>
                                <input type="text" name="tbCNH" id="tbCNH" value="" class="form-control number" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="tbEmail">Email:</label>
                            <input type="email" name="tbEmail" id="tbEmail" value="" class="form-control" />
                        </div>
                        <div class="row">
                            <div class="col">
                                <label for="tbFone">Fone:</label>
                                <input type="text" name="tbFone" id="tbFone" value="" class="form-control phone_with_ddd" />
                            </div>
                            <div class="col">
                                <label for="tbCelular">Celular:</label>
                                <input type="text" name="tbCelular" id="tbCelular" value="" class="form-control phone_with_ddd" />
                            </div>
                        </div>
                        <hr />
                        <div class="row">
                            <div class="col">
                                <label for="tbDtFiliacao">Filiação:</label>
                                <input type="text" name="tbDtFiliacao" id="tbDtFiliacao" value="" class="form-control date" />
                            </div>
                            <div class="col">
                                <label for="tbDtPagamento">Pagamento:</label>
                                <input type="text" name="tbDtPagamento" id="tbDtPagamento" value="" class="form-control date" />
                            </div>
                            <div class="col">
                                <label for="tbDtRegCartorio">Registro:</label>
                                <input type="text" name="tbDtRegCartorio" id="tbDtRegCartorio" value="" class="form-control date" />
                            </div>
                        </div>
                        <hr />
                        <div class="form-group">
                            <label for="tbObs">Observações:</label>
                            <textarea class="form-control" id="tbObs"></textarea>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Save changes</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <%--Modais--%>

    <script type="text/javascript" src="../Scripts/DataTables/media/js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="../Scripts/jquery.mask.js"></script>
    <script type="text/javascript" src="../Scripts/Site.js"></script>
    <script type="text/javascript" src="../Scripts/Operacoes/Medico.js"></script>
    <script>
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
            $('#MainContent_gvMedicos_filter').append("<input type='image' name='btFilter' id='btFilter' title='Filtrar' class='imgButton' src='../Content/Icons/filter_alt-24px.svg' style='height:1.2em;'  data-toggle='collapse' data-target='#divFiltros' onclick='return false;' >");

        });
    </script>
</asp:Content>
