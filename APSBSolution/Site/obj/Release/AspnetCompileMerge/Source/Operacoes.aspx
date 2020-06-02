<%@ Page Title="Operações" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Operacoes.aspx.cs" Inherits="Site.Operacoes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-4"></div>

            <div class="col-md-4">
                <h2>Cadastro de Operações</h2>
                <span class="alert-danger">Definir quais as colunas devem fazer parte dessa lista!</span>
                <br />
            </div>
            <div class="col-md-4"></div>
            <span><b>Solicitação => Emissão => Recebimento => Repasse</b></span>

        </div>
        <asp:LinkButton runat="server" data-toggle="modal" data-target="#operacaoModal" ToolTip="Editar">
                    <asp:button text="Nova Operação" runat="server" CssClass="btn btn-secondary" />
        </asp:LinkButton>
        <br />
        <div class="row">
            <div class="col-md-12">
                <br />
                <asp:Table ID="gvOperacoes" runat="server" CssClass="table table-hover table-striped table-sm">
                    <asp:TableHeaderRow>
                        <asp:TableHeaderCell>ID</asp:TableHeaderCell>
                        <asp:TableHeaderCell>Descrição</asp:TableHeaderCell>
                        <asp:TableHeaderCell>Valor</asp:TableHeaderCell>
                        <asp:TableHeaderCell>Nota</asp:TableHeaderCell>
                        <asp:TableHeaderCell>Emissão</asp:TableHeaderCell>
                        <asp:TableHeaderCell>Recebimento</asp:TableHeaderCell>
                        <asp:TableHeaderCell>Repasse</asp:TableHeaderCell>
                        <asp:TableHeaderCell>Ações</asp:TableHeaderCell>
                    </asp:TableHeaderRow>
                    <asp:TableRow>
                        <asp:TableCell>1234</asp:TableCell>
                        <asp:TableCell>MEDLAR</asp:TableCell>
                        <asp:TableCell>R$ 2.744,00</asp:TableCell>
                        <asp:TableCell>5917</asp:TableCell>
                        <asp:TableCell>09/03/2020</asp:TableCell>
                        <asp:TableCell>09/03/2020</asp:TableCell>
                        <asp:TableCell>09/03/2020</asp:TableCell>
                        <asp:TableCell>
                            <asp:LinkButton runat="server" data-toggle="modal" data-target="#operacaoModal" ToolTip="Editar">
                                <asp:imagebutton imageurl="~/Content/Icons/create-outline.svg" Height="1.5em" runat="server"/>
                            </asp:LinkButton>&nbsp&nbsp
                             <asp:LinkButton runat="server" data-toggle="modal" data-target="#repasseMedicoModal" ToolTip="Repasse">
                                <asp:imagebutton imageurl="~/Content/Icons/person-outline.svg" Height="1.5em" runat="server"/>
                            </asp:LinkButton>&nbsp&nbsp
                            <asp:imagebutton imageurl="~/Content/Icons/archive-outline.svg" Height="1.5em" runat="server" ToolTip="Arquivar" OnClientClick="confirm('Deseja arquivar o registro?')" />&nbsp&nbsp
                            <asp:imagebutton imageurl="~/Content/Icons/trash-outline.svg" Height="1.5em" runat="server" ToolTip="Excluir" OnClientClick="confirm('Deseja excluir o registro?')" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </div>
        </div>
    </div>

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
                                    <option>
                                    Adriane De Fátima Silva De Assumção/option>
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
                            <asp:Table ID="gvRepasseMedico" runat="server" CssClass="table-responsive-sm">
                                <asp:TableHeaderRow>
                                    <asp:TableCell>ID</asp:TableCell>
                                    <asp:TableCell>Profissional</asp:TableCell>
                                    <asp:TableCell>Valor</asp:TableCell>
                                    <asp:TableCell>Data</asp:TableCell>
                                    <asp:TableCell>Ações</asp:TableCell>
                                </asp:TableHeaderRow>
                                <asp:TableRow>
                                    <asp:TableCell>12343</asp:TableCell>
                                    <asp:TableCell>CARLOS HENRIQUE</asp:TableCell>
                                    <asp:TableCell>R$ 1.000,00</asp:TableCell>
                                    <asp:TableCell><input type="text" name="name" value="<%DateTime.Now.ToString("dd/mm/yyyy"); %>" class="form-control" style="width:130px" /></asp:TableCell>
                                    <asp:TableCell>
                                        <asp:imagebutton imageurl="~/Content/Icons/cash-outline.svg" Height="1.5em" runat="server" ToolTip="Pagar" OnClientClick="confirm('Deseja arquivar o registro?')" />&nbsp&nbsp
                                        <asp:imagebutton imageurl="~/Content/Icons/trash-outline.svg" Height="1.5em" runat="server" ToolTip="Excluir" OnClientClick="confirm('Deseja excluir o registro?')" />
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>12343</asp:TableCell>
                                    <asp:TableCell>CARLOS HENRIQUE</asp:TableCell>
                                    <asp:TableCell>R$ 1.000,00</asp:TableCell>
                                    <asp:TableCell><input type="text" name="name" value="<%DateTime.Now.ToShortDateString(); %>" class="form-control" style="width:130px" /></asp:TableCell>
                                    <asp:TableCell>
                                        <asp:imagebutton imageurl="~/Content/Icons/cash-outline.svg" Height="1.5em" runat="server" ToolTip="Pagar" OnClientClick="confirm('Deseja arquivar o registro?')" />&nbsp&nbsp
                                        <asp:imagebutton imageurl="~/Content/Icons/trash-outline.svg" Height="1.5em" runat="server" ToolTip="Excluir" OnClientClick="confirm('Deseja excluir o registro?')" />
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>12343</asp:TableCell>
                                    <asp:TableCell>CARLOS HENRIQUE</asp:TableCell>
                                    <asp:TableCell>R$ 1.000,00</asp:TableCell>
                                    <asp:TableCell><input type="text" name="name" value="<%DateTime.Now.ToShortDateString(); %>" class="form-control" style="width:130px"/></asp:TableCell>
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
                    <button type="button" class="btn btn-primary">Salvar</button>
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
                                            <button id="btDespesa" class="btn btn-light" type="button" onclick="$('btDespesa').removeClass('btn-light')">Despesa</button>&nbsp&nbsp
                                        <button id="btReceita" class="btn btn-success" type="button">Receita</button>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text" id="basic-addon1">R$</span>
                                                </div>
                                                <input id="tbValorOperacao" type="text" class="form-control text-success" placeholder="Valor..." aria-label="tbValor" aria-describedby="basic-addon1">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <label class="text-danger">Mapear regras para lançamento de receitas/despesas.</label><br />

                                <label for="search">Clínica | Hospital | Despesa</label>
                                <div>
                                    <input type="text" id="search" class="form-control" placeholder="Filtrar..." name="search" onkeyup="filter()">
                                </div>
                                <div>
                                    <select id="select" class="form-control">
                                        <option>Selecionar...</option>
                                        <option>ALINE MEI</option>
                                        <option>CELEBRATE</option>
                                        <option>CELEBRATE DMA</option>
                                        <option>CERTIFICADO DIGITAL APSB</option>
                                        <option>CLIPS</option>
                                        <option>CRM ANUIDADE 2020</option>
                                        <option>CRM CERTIFICADO PJ</option>
                                        <option>CRM TAXA DE INSCRIÇÃO</option>
                                        <option>GPS ALG</option>
                                        <option>GPS APSB</option>
                                        <option>GPS DMA</option>
                                        <option>HONORÁRIOS DA CONTABILIDADE ALG</option>

                                    </select>
                                </div>
                            </div>
                        </div>

                        <hr />
                        <div id="divDespesas" class="d-none">

                            <div class="row">
                                <div class="col-sm-6">
                                    <label for="tbDespesaDataNF">Data</label>
                                    <input type="text" id="tbDespesaDataNF" name="tbDespesaDataNF" class="form-control" />
                                </div>
                                <div class="col-sm-6">
                                    <label for="tbDespesaNF">NF</label>
                                    <input type="text" id="tbNumNF" name="tbNumNF" class="form-control" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <label for="tbDespesaObs">Observações</label>
                                    <input type="text" id="tbDespesaObs" name="tbDespesaObs" class="form-control" style="height: 100px" />
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
    <script type="text/javascript">
        //Click Despesa
        $("#btDespesa").click(function () {
            $("#btDespesa").removeClass("btn-light").addClass("btn-danger");
            $("#btReceita").removeClass("btn-success").addClass("btn-light");

            $("#divDespesas").removeClass("d-none");
            $("#divReceitas").addClass("d-none");

            $("#operacaoModalLabel").text("Cadastro de Despesa")

            //tbValorOperacao
            $("#tbValorOperacao").removeClass("text-success").addClass("text-danger");

        });

        //Click Receita
        $("#btReceita").click(function () {
            $("#btReceita").removeClass("btn-light").addClass("btn-success");
            $("#btDespesa").removeClass("btn-danger").addClass("btn-light");

            $("#divDespesas").addClass("d-none");
            $("#divReceitas").removeClass("d-none");

            //tbValorOperacao
            $("#tbValorOperacao").removeClass("text-danger").addClass("text-success");

            $("#operacaoModalLabel").text("Cadastro de Receita")

        });

        //Filter Clínica

        function filter() {
            var keyword = document.getElementById("search").value;
            var select = document.getElementById("select");
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

    </script>
</asp:Content>
