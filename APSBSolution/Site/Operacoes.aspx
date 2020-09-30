<%@ Page Title="Operações" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Operacoes.aspx.cs" Inherits="Site.Operacoes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        table {
            font-size: 11px;
        }

        .num {
            text-align: right;
            width: 90px;
        }

        .transparente {
            opacity: 0.2;
        }
    </style>
    <%--hidden fields--%>
    <div>
        <div class="row">
            <div class="col-md-4"></div>

            <div class="col-md-4">
                <h2 id="hTitulo">Cadastro de Operações</h2>
                <%--Datasources--%>
                <asp:ObjectDataSource runat="server" ID="dsOperacoes" SelectMethod="Listar" TypeName="Site.Classes.Operacao" />
                <asp:SqlDataSource runat="server" ID="dsRepasses2" ConnectionString="<%$ ConnectionStrings:Dados %>" SelectCommand="SEL_Repasse" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                <%--Datasources--%>
                <br />
            </div>
            <div class="col-md-4"></div>

        </div>
        <%--<asp:Button ID="btNovaOperacao" Text="Nova Operação" runat="server" CssClass="btn btn-secondary" OnClientClick="return novaOperacao()" />--%>
        <input type="button" id="btNovaOperacao" name="btNovaOperacao" value="Nova Operação" class="btn btn-secondary" onclick="novaOperacao()" />
        <input type="button" id="btOpRep" name="btOpRep" class="btn btn-secondary" value="Detalhar" onclick="Detalhar()" />
        <br />
        <div class="row collapse" id="divFiltros">
            <br />
            <div class="col">
                <h2>Filtros adicionais</h2>
                <div class="row">
                    <div class="col-sm-2">
                        <asp:Label Text="Status" runat="server" AssociatedControlID="chkStatus" />
                        <asp:RadioButtonList runat="server" CssClass="input-group-text" ID="chkStatus">
                            <asp:ListItem Text="Ativo" Selected="True" Value="true" />
                            <asp:ListItem Text="Inativo" Value="false" />
                        </asp:RadioButtonList>
                    </div>
                    <div class="col-sm-2">
                        <asp:Label Text="Arquivado" runat="server" AssociatedControlID="chkArquivado" />
                        <asp:RadioButtonList runat="server" CssClass="input-group-text" ID="chkArquivado">
                            <asp:ListItem Text="Sim" Value="true" />
                            <asp:ListItem Text="Não" Value="false" Selected="True" />
                        </asp:RadioButtonList>
                    </div>
                    <div class="col-sm-2">
                        <asp:Label Text="Data Inicial" runat="server" AssociatedControlID="dtInicio" /><asp:TextBox runat="server" ID="dtInicio" type="date" /><br />
                    </div>
                    <div class="col-sm-2">
                        <asp:Label Text="Data Final" runat="server" AssociatedControlID="dtFim" /><asp:TextBox runat="server" ID="dtFim" type="date" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-2">
                        <br />
                        <asp:LinkButton ID="btAplicarFiltro" Text="Aplicar" runat="server" CssClass="btn btn-secondary" OnClick="btAplicarFiltro_Click" />
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <%--Hidden Fields--%>
            <asp:HiddenField runat="server" ID="HiddenAbaAtiva" Value="Receita" />
            <asp:HiddenField runat="server" ID="HddValorNegativo" />
            <asp:HiddenField runat="server" ID="HddValorDisponivel" />
            <asp:HiddenField runat="server" ID="idHiddenOperacao" />
            <asp:HiddenField runat="server" ID="HiddenDetalhes" Value="0" />
            <asp:HiddenField runat="server" ID="HiddenUser" Value="" />
            <input type="hidden" id="idHiddenOperacao2" name="idHiddenOperacao2" value="" />
            <input type="hidden" id="hiddenRepasseID" name="hiddenRepasseID" value="" />
            <input type="hidden" id="hiddenRepasseAlterado" name="hiddenRepasseAlterado" value="0" />

            <asp:TextBox runat="server" Text="Receita" CssClass="d-none" ID="tbAbaAtiva" />
            <%--Hidden Fields--%>

            <%--Datasources--%>
            <asp:ObjectDataSource ID="dsRepasseMedico" runat="server" SelectMethod="Listar" TypeName="Site.Classes.ReceitaRepasse">
                <SelectParameters>
                    <asp:ControlParameter ControlID="idHiddenOperacao" Name="idReceita" PropertyName="Value" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <%--Datasources--%>

            <div class="col-md-12" id="divOperacoes">
                <br />
                <asp:GridView runat="server" ID="gvOperacoes" DataSourceID="dsOperacoes" CssClass="table table-hover table-striped table-sm" AutoGenerateColumns="False" OnRowCommand="gvOperacoes_RowCommand" OnPreRender="gvOperacoes_PreRender">
                    <Columns>
                        <asp:BoundField HeaderText="ID" DataField="ID" ItemStyle-CssClass="rowID" />
                        <asp:BoundField HeaderText="Descrição" DataField="ccDescricao" />
                        <asp:BoundField HeaderText="Operador" DataField="ccOperador" />
                        <asp:BoundField HeaderText="R$ Nota" DataField="cvValor" DataFormatString="{0:C}" ItemStyle-CssClass="num" />
                        <asp:BoundField HeaderText="R$ Recebido" DataField="cvValorRecebido" DataFormatString="{0:C}" ItemStyle-CssClass="num" />
                        <asp:BoundField HeaderText="R$ Repassado" DataField="cvValorRepassado" DataFormatString="{0:C}" ItemStyle-CssClass="num" />
                        <asp:BoundField HeaderText="Nota" DataField="cvNF" />
                        <asp:BoundField HeaderText="Emissão" DataField="cdEmissao" ItemStyle-CssClass="date" />
                        <asp:BoundField HeaderText="Pagamento" DataField="cdPagamento" ItemStyle-CssClass="date" />
                        <asp:BoundField HeaderText="Repasse" DataField="cdRepasse" ItemStyle-CssClass="date" />
                        <asp:BoundField HeaderText="Tipo" DataField="Tipo" />
                        <asp:TemplateField HeaderText="Status">
                            <ItemTemplate>
                                <asp:Image ImageUrl='<%# DataBinder.Eval(Container.DataItem, "Status", "~/Content/Icons/chart-{0}.svg") %>' runat="server" Height="1.5em" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <%--<asp:ImageButton ImageUrl="~/Content/Icons/create-outline.svg" runat="server" Height="1.5em" CommandName="Editar" ToolTip="Editar" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />--%>
                                <%--onclick="return AbrirDesRec('Despesa')"--%>
                                <input type="image" src="../Content/Icons/create-outline.svg" title="Editar" class="imgButton" onclick="<%# $"return AbrirDesRec('{DataBinder.Eval(Container.DataItem, "Tipo")}', '{DataBinder.Eval(Container.DataItem, "ID")}');"%>" />
                                <%--<input type="image" src="../Content/Icons/create-outline.svg" class="imgButton" onclick="<%# DataBinder.Eval(Container.DataItem, "Tipo", "return AbrirDesRec('{0}');") %>" />--%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <%--<asp:ImageButton ImageUrl="~/Content/Icons/person-outline.svg" runat="server" Height="1.5em" CommandName="Repassar" ToolTip="Repassar" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />--%>
                                <input type="image" src="../Content/Icons/person-outline.svg" title="Repassar" class="imgButton" onclick="<%# $"return AbrirRepasseModal('{DataBinder.Eval(Container.DataItem, "Tipo")}', '{DataBinder.Eval(Container.DataItem, "ID")}');"%>" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:ImageButton ImageUrl="~/Content/Icons/archive-outline.svg" Height="1.5em" runat="server" ToolTip="Arquivar" CommandName="Arquivar" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" OnClientClick="return confirm('Deseja arquivar este registro')" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:ImageButton ImageUrl="~/Content/Icons/trash-outline.svg" Height="1.5em" runat="server" ToolTip="Excluir" CommandName="Excluir" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" OnClientClick="return confirm('Deseja excluir este registro')" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

            </div>
        </div>

        <div class="row d-none" id="divRepasses">
            <div class="col">
                <br />
                <asp:GridView runat="server" ID="gvRepasses" DataSourceID="dsRepasses2" CssClass="table table-hover table-striped table-sm" AutoGenerateColumns="false" OnPreRender="gvRepasses_PreRender">
                    <Columns>
                        <%--ccApelido	ccNome	cvNF	cdEmissao	ValorNF	ValorPago	cdRepasse	ValorRepasse--%>
                        <asp:BoundField DataField="idReceita" HeaderText="ID" />
                        <asp:BoundField DataField="ccApelido" HeaderText="Clínica" />
                        <asp:BoundField DataField="ccNome" HeaderText="Médico" />
                        <asp:BoundField DataField="cvNF" HeaderText="Nota" />
                        <asp:BoundField DataField="cdEmissao" HeaderText="Emissão" ItemStyle-CssClass="date" />
                        <asp:BoundField DataField="ValorNF" HeaderText="Valor NF" DataFormatString="{0:C}" />
                        <asp:BoundField DataField="ValorPago" HeaderText="Valor Pago" DataFormatString="{0:C}" />
                        <asp:BoundField DataField="cdRepasse" HeaderText="Repasse" DataFormatString="{0:d}" />
                        <asp:BoundField DataField="ValorRepasse" HeaderText="Valor Repasse" DataFormatString="{0:C}" />
                        <asp:BoundField DataField="ccStatus" HeaderText="Status" />
                    </Columns>
                </asp:GridView>
                <%--<asp:ObjectDataSource runat="server" ID="dsRepasses" SelectMethod="Listar" TypeName="Site.Classes.ReceitaRepasse" />--%>
                
            </div>
        </div>
    </div>

    <!-- Modal Example-->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" data-backdrop="static"  aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                    <%--<button type="button" class="btn btn-primary">Salvar</button>--%>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal Repasse Médico-->
    <div class="modal fade bd-example-modal-lg" id="repasseMedicoModal" data-keyboard="false" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="repasseMedicoModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
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
                        </div>
                        <div class="col">
                            <asp:TextBox runat="server" ID="tbDtRepasse" type="date" CssClass="form-control" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <%-- <div>
                                <input type="text" id="tbRepasseProfissional" class="form-control" placeholder="Filtrar..." name="search" onkeyup="filterProfissional()">
                            </div>--%>
                            <div>
                                <%-- <select id="dpSelectProfissional" class="form-control">
                                </select>--%>
                                <input list="dsRepasseProfissional" name="dpSelectProfissional2" id="dpSelectProfissional2" value="" class="form-control" />
                                <datalist id="dsRepasseProfissional">
                                    <option>Teste 1</option>
                                    <option>Teste 2</option>
                                    <option>Teste 3</option>
                                </datalist>
                            </div>
                        </div>
                    </div>

                    <hr />
                    <div class="row">
                        <div class="col">
                            <asp:Label Text="Total NF" AssociatedControlID="tbValorRepassado" runat="server" />
                        </div>
                        <div class="col">
                            <asp:Label Text="Total Pago" AssociatedControlID="tbValorRepassado" runat="server" />
                        </div>
                        <div class="col">
                            <asp:Label Text="Total Repassado" AssociatedControlID="tbValorRepassado" runat="server" />
                        </div>
                    </div>
                    <div class="row">

                        <div class="col">
                            <div class="input-group">

                                <div class="input-group-prepend">
                                    <span class="input-group-text">R$</span>
                                </div>
                                <asp:TextBox runat="server" ID="tbValorNF" CssClass="form-control money" ReadOnly="true" />
                            </div>
                        </div>
                        <div class="col">
                            <div class="input-group cvAlert">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">R$</span>
                                </div>
                                <asp:TextBox runat="server" ID="tbValorPago" CssClass="form-control money" ReadOnly="true" />
                            </div>
                        </div>
                        <div class="col">
                            <div class="input-group cvAlert">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">R$</span>
                                </div>
                                <asp:TextBox runat="server" ID="tbValorRepassado" CssClass="form-control money" ReadOnly="true" />
                            </div>
                        </div>
                    </div>
                    <hr />
                    <div class="row">

                        <div class="col">
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">R$</span>
                                </div>
                                <asp:TextBox runat="server" ID="tbValorDisponivel" CssClass="form-control money" />
                            </div>
                        </div>
                        <div class="col">
                            <input type="button" name="btAdicionar" value="Adicionar" onclick="AdicionarRepasse()" class="btn btn-secondary" />
                        </div>
                       
                        <div class="col">
                            <img id="imgDanger" src="Content/Icons/danger.jpg" alt="Alternate Text" width="50px" class="collapse" />
                        </div>
                    </div>
                    <div class="row">
                         <div class="col">
                             <br />
                            <input type="button" id="btCorrigirReceita" name="btCorrigirReceita" value="Atualizar valor" onclick="UPD_ReceitaByRepasses()" style="width:100%" class="btn btn-primary collapse" />
                        </div>
                    </div>
                    <div class="row d-none" id="divObs">
                        <div class="col">
                            <asp:Label Text="Observações" runat="server" AssociatedControlID="tbObsRepasseProfissional" />
                            <asp:TextBox runat="server" ID="tbObsRepasseProfissional" TextMode="MultiLine" CssClass="form-control" ReadOnly="true" />
                        </div>
                    </div>

                    <div class="row">
                        <div class="col" id="tbRepasse">
                            <br />
                            <table class="table table-hover table-striped table-sm">
                                <thead>
                                    <tr>
                                        <th scope="col">ID</th>
                                        <th scope="col">Nome</th>
                                        <th scope="col">Taxa</th>
                                        <th scope="col">Valor</th>
                                        <th scope="col">V. Liquido</th>
                                        <th scope="col">Status</th>
                                        <th scope="col">Bancos</th>
                                        <th scope="col"></th>
                                        <th scope="col"></th>
                                        <th scope="col"></th>
                                    </tr>
                                </thead>
                                <tbody id="tbRepasseBody">
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btFecharRepasseModal" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                    <%--<button type="button" class="btn btn-primary" onclick="alert('Registro salvo com sucesso!')">Salvar</button>--%>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal Operações -->
    <div class="modal fade" id="operacaoModal" tabindex="-1" role="dialog" data-backdrop="static"  aria-labelledby="operacaoModalLabel" aria-hidden="true">
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
                                            <asp:LinkButton ID="btDespesa" Text="Despesa" runat="server" CssClass="btn btn-light" />
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
                                    <%--<asp:TextBox runat="server" ID="tbSearch2" CssClass="form-control" onkeyup="filter()" placeholder="Filtrar..." />--%>
                                    <%--<asp:TextBox runat="server" ID="tbSearch" CssClass="form-control d-none" onkeyup="filter()" placeholder="Filtrar..." />--%>
                                    <%--DropDown Profissionais--%>
                                    <input runat="server" id="dpSearchClinicas" list="dsClinicasDP" name="dpProfissional" class="form-control" placeholder="Selecione a clínica..." onchange="CarregarDadosClinica()" />
                                    <datalist id="dsClinicasDP">
                                    </datalist>

                                    <%--DropDown Despesas--%>
                                    <input runat="server" id="dpSearchDespesas" list="dsDespesasDP" name="dpDespesas" class="form-control d-none" placeholder="Selecione a despesa..." />
                                    <datalist id="dsDespesasDP">
                                    </datalist>
                                </div>
                                <div>
                                    <%-- <asp:DropDownList runat="server" ID="dpTipoDespesa" DataTextField="ccTipo" DataValueField="idtipo" CssClass="form-control d-none">
                                    </asp:DropDownList>
                                    <asp:DropDownList runat="server" ID="dpTipoReceita" DataTextField="ccTipo" DataValueField="idtipo" CssClass="form-control" AutoPostBack="true" onchange="return DescontosClinica()">
                                    </asp:DropDownList>--%>
                                </div>
                            </div>
                        </div>
                        <div class="row collapse" id="rowDespesaNova">
                            <div class="col">
                                <input type="text" name="tbNovadespesa" id="tbNovadespesa" class="form-control" value="" />
                            </div>
                        </div>
                        <hr />
                        <div id="divDespesas" class="d-none">
                            <div class="row">
                                <div class="col-sm-6">
                                    <label for="tbDespesaDataNF">Data</label>
                                    <%--<input type="text" id="tbDespesaDataNF" name="tbDespesaDataNF" class="form-control" />--%>
                                    <asp:TextBox runat="server" ID="tbDespesaDataNF" CssClass="form-control" type="date" />
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
                                    <%--<input type="text" id="tbReceitaDataNF" name="tbReceitaDataNF" class="form-control" />--%>
                                    <asp:TextBox runat="server" ID="tbReceitaDataNF" CssClass="form-control" Enabled="false" type="date" />
                                </div>
                                <div class="col-sm-6">
                                    <label for="tbReceitaNF">NF</label>
                                    <%--<input type="text" id="tbReceitaNF" name="tbReceitaNF" class="form-control" />--%>
                                    <asp:TextBox runat="server" ID="tbReceitaNF" CssClass="form-control" Enabled="false" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <label for="tbReceitaDataPgtoNF">Data de Pagamento</label>
                                    <%--<input type="text" id="tbReceitaDataPgtoNF" name="tbReceitaDataPgtoNF" class="form-control" readonly="readonly" />--%>
                                    <asp:TextBox runat="server" ID="tbReceitaDataPgtoNF" CssClass="form-control" Enabled="false" type="date" />
                                </div>
                                <div class="col-sm-6">
                                    <label for="tbReceitaNFValorPG">Valor Pago</label>
                                    <%--<input type="text" id="tbReceitaNFValorPG" name="tbReceitaNFValorPG" class="form-control" readonly="readonly" />--%>
                                    <asp:TextBox runat="server" ID="tbReceitaNFValorPG" CssClass="form-control money" Enabled="false" />
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <label for="tbReceitaDesconto">Desconto(%)</label>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <%--<input type="text" id="tbReceitaDesconto" name="tbReceitaDesconto" class="form-control" readonly="readonly" value="6,5%" />--%>
                                            <asp:TextBox runat="server" ID="tbReceitaDesconto" CssClass="form-control num" />
                                        </div>
                                        <div class="col-sm-2">
                                            <input type="button" id="btLimparReceitaDesconto" name="Limpar" class="btn btn-info" value="Limpar" onclick="ClearDiscount()" />
                                        </div>
                                        <div class="col-sm-2">
                                            <input type="button" id="btEditarReceitaDesconto" name="Editar" class="btn btn-info" value="Editar" onclick="EnableDiscount()" />
                                        </div>
                                        <div class="col-sm-1"></div>
                                        <div class="col-sm-3">
                                            <asp:CheckBox Text="ISS Retido" runat="server" ID="chkIssRetido" CssClass="form-check-input" Enabled="false" />
                                        </div>

                                    </div>
                                </div>

                            </div>
                            <div class="row">
                                <div class="col">
                                    <label for="tbReceitaObs">Observações</label>
                                    <%--<input type="text" id="tbReceitaObs" name="tbReceitaObs" class="form-control" placeholder="..." style="height: 100px" />--%>
                                    <asp:TextBox runat="server" ID="tbReceitaObs" CssClass="form-control" TextMode="MultiLine" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                    <%--<button type="button" class="btn btn-primary" onclick="alert('Registro salvo com sucesso!')">Salvar</button>--%>
                    <%--<asp:Button Text="Salvar" runat="server" ID="btSalvar" CssClass="btn btn-primary" OnClick="btSalvar_Click" OnClientClick="RemoverMascaras()" />--%>
                    <input type="button" name="btSalvar" value="Salvar" class="btn btn-primary" onclick="Salvar()" />
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="../Scripts/DataTables/media/js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="../Scripts/jquery.mask.js"></script>
    <script type="text/javascript" src="../Scripts/Operacoes/Operacoes.js"></script>
    <script type="text/javascript" src="../Scripts/Site.js"></script>
    <script src="Scripts/moment.js"></script>
    <script src="Scripts/datetime-moment.js"></script>


    <script type="text/javascript">
        //DataTables

        $(document).ready(function () {

            $.fn.dataTable.moment('DD/MM/YYYY');
            //$.fn.dataTable.moment('HH:mm MMM D, YY');
            $('#MainContent_gvOperacoes').DataTable({
                "order": [[0, "desc"]], 
                "language": {
                    "lengthMenu": "Exibir _MENU_ registros.",
                    "zeroRecords": "Nenhum registro encontrado.",
                    "info": "Exibindo página _PAGE_ de _PAGES_",
                    "infoEmpty": "No records available", "search": "Procurar", "previous": "Anterior", "paginate": {
                        "previous": "Anterior", "next": "Próximo"
                    }
                }
            });

            $('#MainContent_gvRepasses').DataTable({
                "order": [[0, "desc"]],
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
            $('#MainContent_gvRepasses_filter').append("<input type='image' name='btFilter2' id='btFilter2' title='Filtrar' class='imgButton' src='../Content/Icons/filter_alt-24px.svg' style='height:1.2em;'  data-toggle='collapse' data-target='#divFiltros' onclick='return false;' >");
            

            EnableDiscount();

            CarregarFiltro();

            $('.dataTables_filter input').change(function () {
                localStorage["Operacoes"] = $('.dataTables_filter input').val();
            });

            //Calcular Desconto pelo valor pago
            $("#MainContent_tbReceitaNFValorPG").change(function () {
                CalcularDesconto();
            });

            //Calcular Valor Pago pelo desconto

            $("#MainContent_tbReceitaDesconto").change(function () {
                CalcularValorPago();
            });

            //Calcular Valor Pago pelo Valor total

            $("#MainContent_tbValorOperacao").change(function () {
                CalcularValorPago();
            });


            //Carregar Dropdowns
            CarregarClinicasDP();
            CarregarDespesasDP();

            if ($("#MainContent_HiddenDetalhes").val() == "1") {
                Detalhar();
            }
        });

        $("#MainContent_dpSearchDespesas").change(function () {
            if ($("#MainContent_dpSearchDespesas").val() == "Outra") {
                $("#rowDespesaNova").collapse("show");
            }
            else {
                $("#rowDespesaNova").collapse("hide");
                $("#tbNovadespesa").val("");
            }
        });


        //Click Despesa
        $("#MainContent_btDespesa").click(function () {
            AtvDespesa();
            return false;

        });


        $("#btFecharRepasseModal").click(function () {
            if ($("#hiddenRepasseAlterado").val() == "1") {
                location.reload();
                $("#hiddenRepasseAlterado").val("0");
            }
        });

        function novaOperacao() {
            ResetForm();
            $("#MainContent_dpSearchClinicas").val("");
            $("#MainContent_tbReceitaDataNF").val("");
            $("#MainContent_tbReceitaNF").val("");
            $("#MainContent_tbReceitaNFValorPG").val("");
            $("#MainContent_tbReceitaDataPgtoNF").val("");
            $("#MainContent_tbReceitaDesconto").val("");
            $("#MainContent_idHiddenOperacao").val("");
            $("#idHiddenOperacao2").val("");
            $("#MainContent_tbValorOperacao").val("");

            $("#MainContent_tbReceitaDataNF").attr("disabled", true);
            $("#MainContent_tbReceitaDataPgtoNF").attr("disabled", true);
            $("#MainContent_tbReceitaNF").attr("disabled", true);
            $("#MainContent_tbReceitaNFValorPG").attr("disabled", true);
            $("#operacaoModal").modal("show");
            AtvReceita();
        };

        function Salvar() {
            if ($("#MainContent_tbAbaAtiva").val() == "Receita") {
                SalvarReceita();
            }
            else {
                SalvarDespesa();
            };
        };

        function ConvertMoney(money) {
            //var str = money;
            //if (str.search(",") > 0) { money = str; } else { money = str + ",00"; };
            if ($(money).indexOf(",") == 0) {
                money += ",00";
            }
            return money;
        };

        function formatMoney(number, decPlaces, decSep, thouSep) {
            decPlaces = isNaN(decPlaces = Math.abs(decPlaces)) ? 2 : decPlaces,
                decSep = typeof decSep === "undefined" ? "." : decSep;
            thouSep = typeof thouSep === "undefined" ? "," : thouSep;
            var sign = number < 0 ? "-" : "";
            var i = String(parseInt(number = Math.abs(Number(number) || 0).toFixed(decPlaces)));
            var j = (j = i.length) > 3 ? j % 3 : 0;

            return sign +
                (j ? i.substr(0, j) + thouSep : "") +
                i.substr(j).replace(/(\decSep{3})(?=\decSep)/g, "$1" + thouSep) +
                (decPlaces ? decSep + Math.abs(number - i).toFixed(decPlaces).slice(2) : "");
        };

        function AtvDespesa() {
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
            //$("#MainContent_dpTipoReceita").addClass("d-none");
            $("#MainContent_dpSearchClinicas").addClass("d-none");

            //$("#MainContent_dpTipoDespesa").removeClass("d-none");
            $("#MainContent_dpSearchDespesas").removeClass("d-none");

            //Search Receita/Despesa
            $("#MainContent_tbSearch").removeClass("d-none");
            $("#MainContent_tbSearch2").addClass("d-none");
            $("#MainContent_tbSearch").val("");
            $("#MainContent_tbSearch2").val("");


            //Aba Ativa tbAbaAtiva
            $("#MainContent_tbAbaAtiva").val("Despesa");
        }


        //Click Receita
        $("#MainContent_btReceita").click(function () {
            AtvReceita();
            return false;
        });

        function AtvReceita() {
            $("#MainContent_btReceita").removeClass("btn-light").addClass("btn-success");
            $("#MainContent_btDespesa").removeClass("btn-danger").addClass("btn-light");

            $("#divDespesas").addClass("d-none");
            $("#divReceitas").removeClass("d-none");

            //tbValorOperacao
            $("#MainContent_tbValorOperacao").removeClass("text-danger").addClass("text-success");

            $("#operacaoModalLabel").text("Cadastro de Receita")

            //divNF
            $("#divNF").removeClass("d-none");

            //Dropdown Receita/Despesa
            //$("#MainContent_dpTipoReceita").removeClass("d-none");
            $("#MainContent_dpSearchClinicas").removeClass("d-none");
            //$("#MainContent_dpTipoDespesa").addClass("d-none");
            $("#MainContent_dpSearchDespesas").addClass("d-none");

            //Search Receita/Despesa
            $("#MainContent_tbSearch2").removeClass("d-none");
            $("#MainContent_tbSearch").addClass("d-none");
            $("#MainContent_tbSearch").val("");
            $("#MainContent_tbSearch2").val("");

            //Aba Ativa tbAbaAtiva
            $("#MainContent_tbAbaAtiva").val("Receita");
        };



        //Filter Clínica

        function filter() {
            var abaAtiva = $("#MainContent_tbAbaAtiva").val();

            if (abaAtiva == "Receita") {
                filterReceita();
            }
            else {
                filterDespesa()
            }
        }

        function filterDespesa() {
            var keyword = document.getElementById("MainContent_tbSearch").value;
            var select = document.getElementById("MainContent_dpTipoDespesa");
            for (var i = 0; i < select.length; i++) {
                var txt = select.options[i].text;
                //if (txt.substring(0, keyword.length).toLowerCase() !== keyword.toLowerCase() && keyword.trim() !== "") {
                if (txt.toLowerCase().includes(keyword.toLowerCase()) == false) {
                    $(select.options[i]).attr('disabled', 'disabled').hide();
                } else {
                    $(select.options[i]).removeAttr('disabled').show();
                }
            }
        }

        //function filterReceita() {
        //    //var keyword = $("#MainContent_tbSearch").val();
        //    //var select = $("#MainContent_dpTipoReceita");
        //    var keyword = document.getElementById("MainContent_tbSearch2").value;
        //    var select = document.getElementById("MainContent_dpTipoReceita");
        //    for (var i = 0; i < select.length; i++) {
        //        var txt = select.options[i].text;
        //        //if (txt.substring(0, keyword.length).toLowerCase() !== keyword.toLowerCase() && keyword.trim() !== "") {
        //        if (txt.toLowerCase().includes(keyword.toLowerCase()) == false) {
        //            $(select.options[i]).attr('disabled', 'disabled').hide();
        //        } else {
        //            $(select.options[i]).removeAttr('disabled').show();
        //        }
        //    }
        //}


        //Filter Médico

        //function filterProfissional() {
        //    var keyword = document.getElementById("tbRepasseProfissional").value;
        //    var select = document.getElementById("dpSelectProfissional");
        //    for (var i = 0; i < select.length; i++) {
        //        var txt = select.options[i].text;
        //        if (txt.substring(0, keyword.length).toLowerCase() !== keyword.toLowerCase() && keyword.trim() !== "") {
        //            $(select.options[i]).attr('disabled', 'disabled').hide();
        //        } else {
        //            $(select.options[i]).removeAttr('disabled').show();
        //        }
        //    }
        //}


        //Ativar disconto
        function EnableDiscount() {
            if ($("#MainContent_tbReceitaDesconto").attr("readonly") == undefined) {
                $("#MainContent_tbReceitaDesconto").attr("readonly", "readonly");
                console.log($("#MainContent_tbReceitaDesconto").attr("readonly"));
            } else {
                $("#MainContent_tbReceitaDesconto").removeAttr("readonly")
                $("#MainContent_tbReceitaNFValorPG").attr("readonly", "readonly")
            }
        }

        function ClearDiscount() {
            $("#MainContent_tbReceitaDesconto").val("");
            $("#MainContent_tbReceitaNFValorPG").removeAttr("readonly")
        }

        //Formatar Valor Disponivel

        function formatValorDisponivel(valor) {
            if (valor == "1") {
                $("#MainContent_tbValorDisponivel").removeClass("text-success");
                $("#MainContent_tbValorDisponivel").addClass("text-danger")
            }
            else {
                $("#MainContent_tbValorDisponivel").removeClass("text-danger");
                $("#MainContent_tbValorDisponivel").addClass("text-success")
            }
        }

        function Detalhar() {
            if ($("#btOpRep").val() == "Detalhar") {
                $("#divOperacoes").addClass("d-none");
                $("#divRepasses").removeClass("d-none");
                $("#btOpRep").val("Ocultar");
                $("#hTitulo").text("Repasses Detalhados");
                $("#MainContent_HiddenDetalhes").val("1");
            }
            else {
                $("#divRepasses").addClass("d-none");
                $("#divOperacoes").removeClass("d-none");
                $("#btOpRep").val("Detalhar");
                $("#hTitulo").text("Cadastro de Operações")
                $("#MainContent_HiddenDetalhes").val("0");
            }
        };


        function testar(obj) {
            console.log(obj);
        };

    </script>
</asp:Content>
