<%@ Page Title="Cadastro de Profissional" Language="C#" AutoEventWireup="true" CodeBehind="Autocadastro.aspx.cs" Inherits="Site.Autocadastro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title><%: Page.Title %> - APSB</title>

    <asp:PlaceHolder runat="server">
        <%: Scripts.Render("~/bundles/modernizr") %>
    </asp:PlaceHolder>
    <webopt:BundleReference runat="server" Path="~/Content/css" />
    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />
</head>
<body>

    <form id="formCadastro" runat="server">
        <asp:ScriptManager runat="server">
            <Scripts>
                <%--To learn more about bundling scripts in ScriptManager see https://go.microsoft.com/fwlink/?LinkID=301884 --%>
                <%--Framework Scripts--%>
                <asp:ScriptReference Name="MsAjaxBundle" />
                <asp:ScriptReference Name="jquery" />
                <asp:ScriptReference Name="bootstrap" />
                <asp:ScriptReference Name="WebForms.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebForms.js" />
                <asp:ScriptReference Name="WebUIValidation.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebUIValidation.js" />
                <asp:ScriptReference Name="MenuStandards.js" Assembly="System.Web" Path="~/Scripts/WebForms/MenuStandards.js" />
                <asp:ScriptReference Name="GridView.js" Assembly="System.Web" Path="~/Scripts/WebForms/GridView.js" />
                <asp:ScriptReference Name="DetailsView.js" Assembly="System.Web" Path="~/Scripts/WebForms/DetailsView.js" />
                <asp:ScriptReference Name="TreeView.js" Assembly="System.Web" Path="~/Scripts/WebForms/TreeView.js" />
                <asp:ScriptReference Name="WebParts.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebParts.js" />
                <asp:ScriptReference Name="Focus.js" Assembly="System.Web" Path="~/Scripts/WebForms/Focus.js" />
                <asp:ScriptReference Name="WebFormsBundle" />
                <%--Site Scripts--%>
            </Scripts>
        </asp:ScriptManager>

        <nav class="navbar fixed-top navbar-dark bg-dark" style="height: 50px;">
            <!-- Navbar content -->
        </nav>
        <div class="container-fluid" style="padding-top: 50px;">
            <div class="row">
                <div class="col-sm-3"></div>
                <div class="col-sm-6 border">
                    <h5>Cadastro Profissional</h5>
                    <p>Navegue pelas opções e preencha os dados.</p>
                    <asp:LinkButton Text="Dados Pessoais" runat="server" ID="btPessoal" class="btn btn-secondary" data-toggle="modal" data-target="#medicoModal" />
                    <asp:LinkButton Text="Dados Profissionais" runat="server" id="btProfissional" class="btn btn-secondary" data-toggle="modal" data-target="#profissionalModal"/>
                    <asp:LinkButton Text="Endereço" runat="server" id="btEndereco" class="btn btn-secondary" data-toggle="modal" data-target="#moradiaModal"/>
                    <asp:LinkButton Text="Dados Bancários" runat="server" id="btBanco" class="btn btn-secondary" data-toggle="modal" data-target="#bancoModal"/>
                    <div class="progress"  style="margin-top:30px; margin-bottom:30px;">
                        <div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                </div>
                <div class="col-sm-3"></div>
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

        <!-- Modal Médico - Dados Pessoais -->
        <div class="modal fade" id="medicoModal" tabindex="-1" role="dialog" aria-labelledby="medicoModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="medicoModalLabel">Dados Pessoais</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="tbNome">Nome</label>
                            <asp:TextBox runat="server" ID="tbNome" CssClass="form-control" placeholder="digite..." Width="100%" />
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col">
                                    <label for="tbSexo">Sexo</label>
                                    <select id="tbSexo" class="form-control">
                                        <option selected>Selecione...</option>
                                        <option>Masculino</option>
                                        <option>Feminino</option>
                                        <option>Outro</option>
                                    </select>
                                    <%--<asp:TextBox runat="server" ID="tbSexo" CssClass="form-control" placeholder="Sexo" />--%>
                                </div>
                                <div class="col">
                                    <label for="tbNaturalidade">Nat.(UF)</label>
                                    <select id="dpUF" class="form-control">
                                        <option selected>Selecione...</option>
                                        <option>AL</option>
                                        <option>CE</option>
                                        <option>MA</option>
                                    </select>
                                </div>
                                <div class="col">
                                    <label for="tbCidade">Nat. (Cidade)</label>
                                    <asp:TextBox runat="server" ID="tbCidade" CssClass="form-control" placeholder="Cidade" />
                                </div>
                            </div>

                        </div>
                        <hr />

                        <div class="form-group">
                            <label for="tbEstCivil">Estado Civil</label>
                            <select id="tbEstCivil" class="form-control">
                                <option selected>Selecione...</option>
                                <option>Casado</option>
                                <option>Solteiro</option>
                                <option>Outro</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="tbNomePai">Nome do pai</label>
                            <asp:TextBox runat="server" ID="tbNomePai" CssClass="form-control" placeholder="digite..." Width="100%" />
                        </div>
                        <div class="form-group">
                            <label for="tbNomeMae">Nome da mãe</label>
                            <asp:TextBox runat="server" ID="tbNomeMae" CssClass="form-control" placeholder="digite..." Width="100%" />
                        </div>
                        <div class="form-group">
                            <label for="tbNomeConjuge">Nome do cônjuge</label>
                            <asp:TextBox runat="server" ID="tbNomeConjuge" CssClass="form-control" placeholder="digite..." Width="100%" />
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col">
                                    <label for="tbRG">RG</label>
                                    <asp:TextBox runat="server" ID="tbRG" CssClass="form-control" placeholder="digite..." />
                                </div>
                                <div class="col">
                                    <label for="tbEmissorRG">Órgão Emissor</label>
                                    <asp:TextBox runat="server" ID="tbEmissorRG" CssClass="form-control" placeholder="digite..." />
                                </div>
                                <div class="col">
                                    <label for="tbdtEmissaoRG">Data de Emissão</label>
                                    <asp:TextBox runat="server" ID="tbdtEmissaoRG" CssClass="form-control" placeholder="digite..." />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <label for="tbCPF">CPF</label>
                                    <asp:TextBox runat="server" ID="tbCPF" CssClass="form-control" placeholder="digite..." />
                                </div>
                                <div class="col-md-8">
                                    <label for="tbEmail">Email</label>
                                    <asp:TextBox runat="server" ID="tbEmail" CssClass="form-control" placeholder="digite..." />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <label for="tbTelefone">Telefone</label>
                                    <asp:TextBox runat="server" ID="tbTelefone" CssClass="form-control" placeholder="digite..." />
                                </div>
                                <div class="col">
                                    <label for="tbCelular">Celular</label>
                                    <asp:TextBox runat="server" ID="tbCelular" CssClass="form-control" placeholder="digite..." />
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
        <!-- Modal Médico - Dados Profissionais - profissionalModal-->
        <div class="modal fade" id="profissionalModal" tabindex="-1" role="dialog" aria-labelledby="profissionalModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="profissionalModalLabel">Dados Profissionais</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <div class="row">
                                <div class="col">
                                    <label for="tbFormacao">Formação Profissional</label>
                                    <asp:TextBox runat="server" ID="tbFormacao" CssClass="form-control" placeholder="digite..." />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <label for="dpEspecialidade">Especialidade</label>
                                    <select id="dpEspecialidade" class="form-control">
                                        <option selected>Selecione...</option>
                                        <option>Angiologista</option>
                                        <option>Cardiologista</option>
                                        <option>Clínico geral</option>
                                        <option>Outra</option>
                                    </select>
                                </div>
                                <div class="col">
                                    <label for="tbPosGraduacao">Pós-Graduação</label>
                                    <asp:TextBox runat="server" ID="tbPosGraduacao" CssClass="form-control" placeholder="digite..." />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <label for="tbConselhoRegional">Conselho Regional</label>
                                    <asp:TextBox runat="server" ID="tbConselhoRegional" CssClass="form-control" placeholder="digite..." />
                                </div>
                                <div class="col">
                                    <label for="tbNumInscricaoConselho">Num. Inscrição</label>
                                    <asp:TextBox runat="server" ID="tbNumInscricaoConselho" CssClass="form-control" placeholder="digite..." />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label for="tbTituloEleitor">Título de Eleitor</label>
                                    <asp:TextBox runat="server" ID="tbTituloEleitor" CssClass="form-control" placeholder="digite..." />
                                </div>
                                <div class="col-md-3">
                                    <label for="tbZonaEleitor">Zona</label>
                                    <asp:TextBox runat="server" ID="tbZonaEleitor" CssClass="form-control" placeholder="digite..." />
                                </div>
                                <div class="col-md-3">
                                    <label for="tbSecaoEleitor">Seção</label>
                                    <asp:TextBox runat="server" ID="tbSecaoEleitor" CssClass="form-control" placeholder="digite..." />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <label for="tbReservista">Reservista</label>
                                    <asp:TextBox runat="server" ID="tbReservista" CssClass="form-control" placeholder="digite..." />
                                </div>
                                <div class="col">
                                    <label for="tbPisPasep">PIS/PASEP/NIT</label>
                                    <asp:TextBox runat="server" ID="tbPisPasep" CssClass="form-control" placeholder="digite..." />
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
        <!-- Modal Médico - Dados de Moradia - moradiaModal-->
        <div class="modal fade" id="moradiaModal" tabindex="-1" role="dialog" aria-labelledby="moradiaModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="moradiaModalLabel">Dados de Moradia</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <div class="row">
                                <div class="col">
                                    <label for="tbEndereço">Endereço</label>
                                    <asp:TextBox runat="server" ID="tbEndereço" CssClass="form-control" placeholder="digite..." />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <label for="tbBairro">Bairro</label>
                                    <asp:TextBox runat="server" ID="tbBairro" CssClass="form-control" placeholder="digite..." />
                                </div>
                                <div class="col">
                                    <label for="tbCep">CEP</label>
                                    <asp:TextBox runat="server" ID="tbCep" CssClass="form-control" placeholder="digite..." />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <label for="dpEnderecoUF">UF</label>
                                    <select id="dpEnderecoUF" class="form-control">
                                        <option selected>Selecione...</option>
                                        <option>AL</option>
                                        <option>CE</option>
                                        <option>MA</option>
                                    </select>
                                </div>
                                <div class="col-md-9">
                                    <label for="tbEnderecoCidade">Cidade</label>
                                    <asp:TextBox runat="server" ID="tbEnderecoCidade" CssClass="form-control" placeholder="digite..." />
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
        <!-- Modal Médico - Dados Bancários - bancoModal-->
        <div class="modal fade" id="bancoModal" tabindex="-1" role="dialog" aria-labelledby="bancoModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="bancoModalLabel">Dados Bancários</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <div class="row">
                                <div class="col">
                                    <label for="dpBanco">Banco</label>
                                    <select runat="server" id="dpBanco" class="form-control">
                                        <option selected="selected">Selecione...</option>
                                        <option>001 - Banco do Brasil</option>
                                        <option>104 - Caixa Econômica</option>
                                        <option>341 - Itaú</option>
                                        <option>077 - Inter</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <label for="tbAgencia">Agência</label>
                                    <asp:TextBox runat="server" ID="tbAgencia" CssClass="form-control" placeholder="digite..." />
                                </div>
                                <div class="col">
                                    <label for="tbConta">Conta</label>
                                    <asp:TextBox runat="server" ID="tbConta" CssClass="form-control" placeholder="digite..." />
                                </div>
                                <div class="col">
                                    <label for="tbOperacao">Operação</label>
                                    <asp:TextBox runat="server" ID="tbOperacao" CssClass="form-control" placeholder="digite..." />
                                </div>
                            </div>
                        </div>
                        <asp:Table runat="server" ID="gvDadosBancarios" CssClass="table table-hover table-striped table-sm">
                            <asp:TableHeaderRow>
                                <asp:TableCell>Banco</asp:TableCell>
                                <asp:TableCell>Agência</asp:TableCell>
                                <asp:TableCell>Conta</asp:TableCell>
                                <asp:TableCell>Operação</asp:TableCell>
                                <asp:TableCell>Ações</asp:TableCell>
                            </asp:TableHeaderRow>
                            <asp:TableRow>
                                <asp:TableCell>001 - Banco do Brasil</asp:TableCell>
                                <asp:TableCell>0001-X</asp:TableCell>
                                <asp:TableCell>112233</asp:TableCell>
                                <asp:TableCell>001</asp:TableCell>
                                <asp:TableCell>
                                <asp:imagebutton imageurl="~/Content/Icons/create-outline.svg" Height="1.5em" runat="server" ToolTip="Editar"/>&nbsp&nbsp
                                <asp:imagebutton imageurl="~/Content/Icons/trash-outline.svg" Height="1.5em" runat="server" ToolTip="Excluir"/>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>077 - Inter</asp:TableCell>
                                <asp:TableCell>001</asp:TableCell>
                                <asp:TableCell>034301</asp:TableCell>
                                <asp:TableCell>001</asp:TableCell>
                                <asp:TableCell>
                                  <asp:imagebutton imageurl="~/Content/Icons/create-outline.svg" Height="1.5em" runat="server" ToolTip="Editar" />&nbsp&nbsp
                                <asp:imagebutton imageurl="~/Content/Icons/trash-outline.svg" Height="1.5em" runat="server" ToolTip="Excluir"/>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>341 - Itaú</asp:TableCell>
                                <asp:TableCell>134</asp:TableCell>
                                <asp:TableCell>332211</asp:TableCell>
                                <asp:TableCell>001</asp:TableCell>
                                <asp:TableCell>
                                  <asp:imagebutton imageurl="~/Content/Icons/create-outline.svg" Height="1.5em" runat="server" ToolTip="Editar" />&nbsp&nbsp
                                <asp:imagebutton imageurl="~/Content/Icons/trash-outline.svg" Height="1.5em" runat="server" ToolTip="Excluir"/>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>341 - Itaú</asp:TableCell>
                                <asp:TableCell>001</asp:TableCell>
                                <asp:TableCell>001</asp:TableCell>
                                <asp:TableCell>001</asp:TableCell>
                                <asp:TableCell>
                                 <asp:imagebutton imageurl="~/Content/Icons/create-outline.svg" Height="1.5em" runat="server" ToolTip="Editar" />&nbsp&nbsp
                                <asp:imagebutton imageurl="~/Content/Icons/trash-outline.svg" Height="1.5em" runat="server" ToolTip="Excluir"/>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                        <asp:Button Text="Salvar" runat="server" CssClass="btn btn-primary" OnClientClick="alert('Registro salvo com sucesso!')" />
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script>    
        $("#btPessoal").click(function () {
            $("#btPessoal").removeClass("btn-secondary").addClass("btn-info");
            $("#btProfissional").removeClass("btn-info").addClass("btn-secondary");
            $("#btEndereco").removeClass("btn-info").addClass("btn-secondary");
            $("#btBanco").removeClass("btn-info").addClass("btn-secondary");
            $('.progress-bar').attr('aria-valuenow', 25).css('width', '25%');
        });
        $("#btProfissional").click(function () {
            $("#btProfissional").removeClass("btn-secondary").addClass("btn-info");
            $("#btPessoal").removeClass("btn-info").addClass("btn-secondary");
            $("#btEndereco").removeClass("btn-info").addClass("btn-secondary");
            $("#btBanco").removeClass("btn-info").addClass("btn-secondary");
            $('.progress-bar').attr('aria-valuenow', 50).css('width', '50%');
        });
        $("#btEndereco").click(function () {
            $("#btEndereco").removeClass("btn-secondary").addClass("btn-info");
            $("#btProfissional").removeClass("btn-info").addClass("btn-secondary");
            $("#btPessoal").removeClass("btn-info").addClass("btn-secondary");
            $("#btBanco").removeClass("btn-info").addClass("btn-secondary");
            $('.progress-bar').attr('aria-valuenow', 75).css('width', '75%');
        });
        $("#btBanco").click(function () {
            $("#btBanco").removeClass("btn-secondary").addClass("btn-info");
            $("#btProfissional").removeClass("btn-info").addClass("btn-secondary");
            $("#btEndereco").removeClass("btn-info").addClass("btn-secondary");
            $("#btPessoal").removeClass("btn-info").addClass("btn-secondary");
            $('.progress-bar').attr('aria-valuenow', 100).css('width', '100%');
        });
    </script>
</body>
</html>
