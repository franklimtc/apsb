<%@ Page Title="Operações" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Operacoes.aspx.cs" Inherits="Site.Operacoes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-4"></div>

            <div class="col-md-4">
                <h2>Cadastro de Operações</h2>
                <spam class="alert-danger">Definir quais as colunas devem fazer parte dessa lista!</spam>
            </div>
            <div class="col-md-4"></div>
        </div>
        <asp:LinkButton runat="server" data-toggle="modal" data-target="#operacaoModal" ToolTip="Editar">
                    <asp:button text="Nova Operação" runat="server" CssClass="btn btn-secondary" />
        </asp:LinkButton>
        <br />
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
                                <div id="divDespesas" class="d-none">
                                    <label for="search">Tipo</label>
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
                        </div>
                        <div class="row">
                            <div class="col">
                                <div id="divReceitas">
                                    DIV RECEITAS
                                </div>
                            </div>
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
    <script type="text/javascript">
        //Click Despesa
        $("#btDespesa").click(function () {
            $("#btDespesa").removeClass("btn-light").addClass("btn-success");
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
            $("#btDespesa").removeClass("btn-success").addClass("btn-light");

            $("#divDespesas").addClass("d-none");
            $("#divReceitas").removeClass("d-none");

            //tbValorOperacao
            $("#tbValorOperacao").removeClass("text-danger").addClass("text-success");

            $("#operacaoModalLabel").text("Cadastro de Receita")

        });

        //Filter

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

    </script>
</asp:Content>
