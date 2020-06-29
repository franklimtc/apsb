<%@ Page Title="Operações" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Operacoes.aspx.cs" Inherits="Site.Operacoes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-4"></div>

            <div class="col-md-4">
                <h2>Cadastro de Operações</h2>
                <br />
            </div>
            <div class="col-md-4"></div>

        </div>
        <asp:LinkButton runat="server" data-toggle="modal" data-target="#operacaoModal" ToolTip="Editar">
                    <asp:button text="Nova Operação" runat="server" CssClass="btn btn-secondary" />
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
                        <asp:LinkButton ID="btAplicarFiltro" Text="Aplicar" runat="server" CssClass="btn btn-secondary" />
                    </div>
                    <div class="col"></div>
                </div>
            </div>
        </div>
        <div class="row">
            <%--Hidden Fields--%>
            <asp:HiddenField runat="server" ID="HiddenAbaAtiva" Value="Receita" />
            <asp:HiddenField runat="server" ID="idHiddenOperacao" />
            <%--Hidden Fields--%>
            <div class="col-md-12">
                <br />
                <asp:GridView runat="server" ID="gvOperacoes" DataSourceID="dsOperacoes" CssClass="table table-hover table-striped table-sm" AutoGenerateColumns="False" OnRowCommand="gvOperacoes_RowCommand" OnPreRender="gvOperacoes_PreRender">
                    <Columns>
                        <asp:BoundField HeaderText="ID" DataField="ID" />
                        <asp:BoundField HeaderText="Descrição" DataField="ccDescricao" />
                        <asp:BoundField HeaderText="Valor" DataField="cvValor" DataFormatString="{0:C}" />
                        <asp:BoundField HeaderText="Nota" DataField="cvNF" />
                        <asp:BoundField HeaderText="Emissão" DataField="cdEmissao" DataFormatString="{0:d}" />
                        <asp:BoundField HeaderText="Pagamento" DataField="cdPagamento" DataFormatString="{0:d}" />
                        <asp:BoundField HeaderText="Repasse" DataField="cdRepasse" DataFormatString="{0:d}" />
                        <asp:BoundField HeaderText="Tipo" DataField="Tipo" />
                        <asp:TemplateField HeaderText="Status">
                            <ItemTemplate>
                                <asp:Image ImageUrl='<%# DataBinder.Eval(Container.DataItem, "Status", "~/Content/Icons/chart-{0}.svg") %>' runat="server" Height="1.5em" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                    <asp:imagebutton imageurl="~/Content/Icons/create-outline.svg" runat="server"  Height="1.5em" CommandName="Editar" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                    <asp:imagebutton imageurl="~/Content/Icons/person-outline.svg" runat="server" Height="1.5em"  CommandName="Repassar" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:ImageButton ImageUrl="~/Content/Icons/archive-outline.svg" Height="1.5em" runat="server" ToolTip="Arquivar"  CommandName="Arquivar" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" OnClientClick="return confirm('Deseja arquivar o registro?')" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:ImageButton ImageUrl="~/Content/Icons/trash-outline.svg" Height="1.5em" runat="server" ToolTip="Excluir" CommandName="Excluir" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" OnClientClick="return confirm('Deseja excluir o registro?')" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:ObjectDataSource runat="server" ID="dsOperacoes" SelectMethod="Listar" TypeName="Site.Classes.Operacao" />
            </div>
        </div>
    </div>

    <!-- Modal Example-->
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
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                    <button type="button" class="btn btn-primary">Salvar</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal Repasse Médico-->
    <div class="modal fade" id="repasseMedicoModal" tabindex="-1" role="dialog" aria-labelledby="repasseMedicoModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="repasseMedicoModalLabel">Repasse a Profissionais</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col">
                            <label for="dpRepasseProfissional">Profissional</label>
                            <div>
                                <input type="text" id="tbRepasseProfissional" class="form-control" placeholder="Filtrar..." name="search" onkeyup="filterProfissional()">
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
                            <label for="tbObsprofissional">Observações</label>
                            <input type="text" id="tbObsprofissional" name="tbObsprofissional" value="Adicionar observações do médico" class="form-control" style="height: 100px;" readonly="readonly" />
                        </div>
                    </div>
                    <hr />
                    <div class="row">
                        <div class="col">
                            <input type="button" id="tbAdicionarProfissional" name="name" value="Adicionar" class="btn btn-secondary" onclick="alert('Registro adicionado com sucesso!')" />
                        </div>
                        <div class="col">
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">R$</span>
                                </div>
                                <input id="tbValorDisponivel" type="text" class="form-control text-success" value="0,00" placeholder="Valor disponivel...">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <br />
                            <asp:Table ID="gvRepasseMedico" runat="server" CssClass="table table-hover table-striped table-sm">
                                <asp:TableHeaderRow>
                                    <asp:TableCell>ID</asp:TableCell>
                                    <asp:TableCell>Profissional</asp:TableCell>
                                    <asp:TableCell>Valor</asp:TableCell>
                                    <asp:TableCell>Ações</asp:TableCell>
                                </asp:TableHeaderRow>
                                <asp:TableRow>
                                    <asp:TableCell>12343</asp:TableCell>
                                    <asp:TableCell>Carlos Henrique</asp:TableCell>
                                    <asp:TableCell>R$ 1.000,00</asp:TableCell>
                                    <asp:TableCell>
                                        <asp:imagebutton imageurl="~/Content/Icons/cash-outline.svg" Height="1.5em" runat="server" ToolTip="Pagar" OnClientClick="confirm('Deseja arquivar o registro?')" />&nbsp&nbsp
                                        <asp:imagebutton imageurl="~/Content/Icons/trash-outline.svg" Height="1.5em" runat="server" ToolTip="Excluir" OnClientClick="confirm('Deseja excluir o registro?')" />
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>12343</asp:TableCell>
                                    <asp:TableCell>Carolina Coelho</asp:TableCell>
                                    <asp:TableCell>R$ 1.000,00</asp:TableCell>
                                    <asp:TableCell>
                                        <asp:imagebutton imageurl="~/Content/Icons/cash-outline.svg" Height="1.5em" runat="server" ToolTip="Pagar" OnClientClick="confirm('Deseja arquivar o registro?')" />&nbsp&nbsp
                                        <asp:imagebutton imageurl="~/Content/Icons/trash-outline.svg" Height="1.5em" runat="server" ToolTip="Excluir" OnClientClick="confirm('Deseja excluir o registro?')" />
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>12343</asp:TableCell>
                                    <asp:TableCell>Clara Bandeira</asp:TableCell>
                                    <asp:TableCell>R$ 1.000,00</asp:TableCell>
                                    <asp:TableCell>
                                        <asp:imagebutton imageurl="~/Content/Icons/cash-outline.svg" Height="1.5em" runat="server" ToolTip="Pagar" OnClientClick="confirm('Deseja arquivar o registro?')" />&nbsp&nbsp
                                        <asp:imagebutton imageurl="~/Content/Icons/trash-outline.svg" Height="1.5em" runat="server" ToolTip="Excluir" OnClientClick="confirm('Deseja excluir o registro?')" />
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                    <button type="button" class="btn btn-primary" onclick="alert('Registro salvo com sucesso!')">Salvar</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal Operações -->
    <div class="modal fade" id="operacaoModal" tabindex="-1" role="dialog" aria-labelledby="operacaoModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="operacaoModalLabel">Cadastro de Receita</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <div class="row">
                            <div class="col">
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <div class="col-sm-6">
                                            <%--<button id="btDespesa" class="btn btn-light" type="button" onclick="$('btDespesa').removeClass('btn-light')">Despesa</button>&nbsp&nbsp--%>
                                            <%--<button id="btReceita" class="btn btn-success" type="button">Receita</button>--%>
                                            <asp:LinkButton ID="btDespesa" Text="Despesa" runat="server" CssClass="btn btn-light"/>
                                            <asp:LinkButton ID="btReceita" Text="Receita" runat="server" CssClass="btn btn-success" />

                                        </div>
                                        <div class="col-sm-6">
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text" id="basic-addon1">R$</span>
                                                </div>
                                                <%--<input id="tbValorOperacao" type="text" class="form-control text-success" placeholder="Valor..." aria-label="tbValor" aria-describedby="basic-addon1">--%>
                                                <%--money--%>
                                                <asp:TextBox runat="server" ID="tbValorOperacao" CssClass="form-control text-success money" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <%--<label class="text-danger">Mapear regras para lançamento de receitas/despesas.</label>--%>
                                <br />

                                <label for="search">Clínica | Hospital | Despesa</label>
                                <div>
                                    <%--<input type="text" id="search" class="form-control" placeholder="Filtrar..." name="search" onkeyup="filter()">--%>
                                    <asp:TextBox runat="server" ID="tbSearch" CssClass="form-control" onkeyup="filter()" placeholder="Filtrar..."/>
                                </div>
                                <div>
                                    <asp:DropDownList runat="server" ID="dpTipoDespesa" DataTextField="ccTipo" DataValueField="idtipo" CssClass="form-control d-none">
                                    </asp:DropDownList>
                                     <asp:DropDownList runat="server" ID="dpTipoReceita" DataTextField="ccTipo" DataValueField="idtipo" CssClass="form-control">
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <hr />
                        <div id="divDespesas" class="d-none">
                            <div class="row">
                                <div class="col-sm-6">
                                    <label for="tbDespesaDataNF">Data</label>
                                    <%--<input type="text" id="tbDespesaDataNF" name="tbDespesaDataNF" class="form-control" />--%>
                                    <asp:TextBox runat="server" ID="tbDespesaDataNF" CssClass="form-control date" />
                                </div>
                                <div id="divNF" class="col-sm-6">
                                    <label for="tbDespesaNF">NF</label>
                                    <%--<input type="text" id="tbNumNF" name="tbNumNF" class="form-control" />--%>
                                    <asp:TextBox runat="server" ID="tbNumNF" CssClass="form-control" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <label for="tbDespesaObs">Observações</label>
                                    <%--<input type="text" id="tbDespesaObs" name="tbDespesaObs" class="form-control" style="height: 100px" />--%>
                                    <asp:TextBox runat="server" ID="tbDespesaObs" CssClass="form-control" TextMode="MultiLine" />
                                </div>
                            </div>
                        </div>
                        <div id="divReceitas">
                            <div class="row">
                                <div class="col-sm-6">
                                    <label for="tbReceitaDataNF">Data de Emissão</label>
                                    <input type="text" id="tbReceitaDataNF" name="tbReceitaDataNF" class="form-control" />
                                </div>
                                <div class="col-sm-6">
                                    <label for="tbReceitaNF">NF</label>
                                    <input type="text" id="tbReceitaNF" name="tbReceitaNF" class="form-control" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <label for="tbReceitaDataPgtoNF">Data de Pagamento</label>
                                    <input type="text" id="tbReceitaDataPgtoNF" name="tbReceitaDataPgtoNF" class="form-control" readonly="readonly" />
                                </div>
                                <div class="col-sm-6">
                                    <label for="tbReceitaNFValorPG">Valor Pago</label>
                                    <input type="text" id="tbReceitaNFValorPG" name="tbReceitaNFValorPG" class="form-control" readonly="readonly" />
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <label for="tbReceitaDesconto">Desconto</label>
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <input type="text" id="tbReceitaDesconto" name="tbReceitaDesconto" class="form-control" readonly="readonly" value="6,5%" />
                                        </div>
                                        <div class="col-sm-2">
                                            <input type="button" id="btEditarReceitaDesconto" name="Editar" class="btn btn-info" value="Editar" onclick="EnableDiscount()" />
                                        </div>
                                        <div class="col-sm-6"></div>
                                    </div>
                                </div>

                            </div>
                            <div class="row">
                                <div class="col">
                                    <label for="tbReceitaObs">Observações</label>
                                    <input type="text" id="tbReceitaObs" name="tbReceitaObs" class="form-control" placeholder="..." style="height: 100px" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                    <%--<button type="button" class="btn btn-primary" onclick="alert('Registro salvo com sucesso!')">Salvar</button>--%>
                    <asp:Button Text="Salvar" runat="server" ID="btSalvar" CssClass="btn btn-primary" OnClick="btSalvar_Click" OnClientClick="RemoverMascaras()" />
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="../Scripts/DataTables/media/js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="../Scripts/jquery.mask.js"></script>
    <script type="text/javascript" src="../Scripts/Site.js"></script>
    <script type="text/javascript">
        //DataTables

        $(document).ready(function () {
            $('#MainContent_gvOperacoes').DataTable({
                "language": {
                    "lengthMenu": "Exibir _MENU_ registros.",
                    "zeroRecords": "Nenhum registro encontrado.",
                    "info": "Exibindo página _PAGE_ de _PAGES_",
                    "infoEmpty": "No records available", "search": "Procurar", "previous": "Anterior", "paginate": {
                        "previous": "Anterior", "next": "Próximo"
                    }
                }
            });

            $('#MainContent_gvOperacoes_filter').append("<input type='image' name='btFilter' id='btFilter' title='Filtrar' class='imgButton' src='../Content/Icons/filter_alt-24px.svg' style='height:1.2em;'  data-toggle='collapse' data-target='#divFiltros' onclick='return false;' >");
        });


        //Click Despesa
        $("#MainContent_btDespesa").click(function () {
            $("#MainContent_btDespesa").removeClass("btn-light").addClass("btn-danger");
            $("#MainContent_btReceita").removeClass("btn-success").addClass("btn-light");

            $("#divDespesas").removeClass("d-none");
            $("#divReceitas").addClass("d-none");

            $("#operacaoModalLabel").text("Cadastro de Despesa")

            //tbValorOperacao
            $("#MainContent_tbValorOperacao").removeClass("text-success").addClass("text-danger");

            //divNF
            $("#divNF").addClass("d-none");


            //Dropdown Receita/Despesa
            $("#MainContent_dpTipoReceita").addClass("d-none");
            $("#MainContent_dpTipoDespesa").removeClass("d-none");

            return false;

        });

        //Click Receita
        $("#MainContent_btReceita").click(function () {
            $("#MainContent_btReceita").removeClass("btn-light").addClass("btn-success");
            $("MainContent_#btDespesa").removeClass("btn-danger").addClass("btn-light");

            $("#divDespesas").addClass("d-none");
            $("#divReceitas").removeClass("d-none");

            //tbValorOperacao
            $("#MainContent_tbValorOperacao").removeClass("text-danger").addClass("text-success");

            $("#operacaoModalLabel").text("Cadastro de Receita")

            //divNF
            $("#divNF").removeClass("d-none");

            //Dropdown Receita/Despesa
            $("#MainContent_dpTipoReceita").removeClass("d-none");
            $("#MainContent_dpTipoDespesa").addClass("d-none");

            return false;
        });

        //Filter Clínica

        function filter() {
            var keyword = document.getElementById("MainContent_tbSearch").value;
            var select = document.getElementById("MainContent_dpTipoDespesa");
            for (var i = 0; i < select.length; i++) {
                var txt = select.options[i].text;
                if (txt.substring(0, keyword.length).toLowerCase() !== keyword.toLowerCase() && keyword.trim() !== "") {
                    $(select.options[i]).attr('disabled', 'disabled').hide();
                } else {
                    $(select.options[i]).removeAttr('disabled').show();
                }
            }
        }

        //Filter Médico

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

        //Ativar disconto
        function EnableDiscount() {
            if ($("#tbReceitaDesconto").attr("readonly") == undefined) {
                $("#tbReceitaDesconto").attr("readonly", "readonly");
                console.log($("#tbReceitaDesconto").attr("readonly"));
            } else {
                $("#tbReceitaDesconto").removeAttr('readonly')
                console.log($("#tbReceitaDesconto").attr("readonly"));
            }
        }
    </script>
</asp:Content>
