<%@ Page Title="Cadastro de Profissional" Language="C#" AutoEventWireup="true" CodeBehind="Autocadastro.aspx.cs" Inherits="Site.Autocadastro" %>

<!DOCTYPE html  lang="pt-br">

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

        <%--Hidden Filds--%>
        <asp:HiddenField runat="server" ID="idHiddenMedico" />
        <asp:HiddenField runat="server" ID="idHiddenProfissionalEndereco" />
        <asp:HiddenField runat="server" ID="idHiddenProfissionalBanco" />
        <asp:HiddenField runat="server" ID="HiddenFormPreenchido" Value="0" />
        <asp:HiddenField runat="server" ID="idHiddenProfissionalDado" />
        <asp:HiddenField runat="server" ID="HiddenBancoCadastrado" Value="0" />

        <%--Hidden Filds--%>

        <nav class="navbar fixed-top navbar-dark bg-dark" style="height: 50px;">
            <!-- Navbar content -->
        </nav>
        <div class="container-fluid" style="padding-top: 50px;">
            <div class="row">
                <div class="col d-flex justify-content-center">
                    <asp:Panel runat="server" ID="pnValidar" HorizontalAlign="Center">
                        <h3 style="text-align: center">Informe o Token!</h3>
                        <br />
                        <div class="form-inline">
                            <label>Token:</label>&nbsp
                            <asp:TextBox ID="tbToken" runat="server" CssClass="form-control" requerid />&nbsp
                            <asp:Button Text="Validar" runat="server" ID="btValidar" CssClass="btn btn-secondary" OnClick="btValidar_Click" />
                        </div>
                    </asp:Panel>
                    <asp:Table runat="server" Visible="false" ID="tbCampos">
                        <asp:TableRow>
                            <asp:TableCell ColumnSpan="4">
                                 <h5>Cadastro Profissional</h5>
                                <p>Navegue pelas opções e preencha os dados.</p>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell><input type="button" name="btPessoal" id="btPessoal" value="Dados Pessoais" class="btn btn-secondary" /> </asp:TableCell>
                            <asp:TableCell><input type="button" name="btProfissional" id="btProfissional" value="Dados Profissionais" class="btn btn-secondary" disabled/> </asp:TableCell>
                            <asp:TableCell><input type="button" name="btEndereco" id="btEndereco" value="Endereço" class="btn btn-secondary" disabled/> </asp:TableCell>
                            <asp:TableCell><input type="button" name="btBanco" id="btBanco" value="Dados Bancários" class="btn btn-secondary" disabled/> </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell ColumnSpan="4">
                                <div class="progress" style="margin-top: 30px; margin-bottom: 30px;">
                                    <div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </div>
            </div>
            <div class="row d-none" id="divImprimir">
                <div class="col"></div>
                <div class="col">
                    <input type="button" name="btImprimir" value="Imprimir" class="btn btn-secondary" style="width:100%" />
                </div>
                <div class="col"></div>
            </div>
        </div>

        <%--Modais--%>

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
                            <asp:TextBox runat="server" ID="tbNome" CssClass="form-control" placeholder="digite..." Width="100%"/>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col">
                                    <label for="dpSexo">Sexo</label>
                                    <asp:DropDownList runat="server" ID="dpSexo" CssClass="form-control">
                                        <asp:ListItem Text="Masculino" Value="M" Selected="True" />
                                        <asp:ListItem Text="Feminino" Value="F" />
                                    </asp:DropDownList>
                                </div>
                                <div class="col">
                                    <label for="dpNaturalidade">Nat.(UF)</label>
                                    <asp:DropDownList runat="server" ID="dpNaturalidade" CssClass="form-control">
                                        <asp:ListItem Text="Selecionar..." Value="00" />
                                        <asp:ListItem Text="Acre" Value="AC" />
                                        <asp:ListItem Text="Alagoas " Value="AL" />
                                        <asp:ListItem Text="Amapá " Value="AP" />
                                        <asp:ListItem Text="Amazonas " Value="AM" />
                                        <asp:ListItem Text="Bahia " Value="BA" />
                                        <asp:ListItem Text="Ceará " Value="CE" />
                                        <asp:ListItem Text="Distrito Federal " Value="DF" />
                                        <asp:ListItem Text="Espírito Santo " Value="ES" />
                                        <asp:ListItem Text="Goiás " Value="GO" />
                                        <asp:ListItem Text="Maranhão " Value="MA" />
                                        <asp:ListItem Text="Mato Grosso " Value="MT" />
                                        <asp:ListItem Text="Mato Grosso do Sul " Value="MS" />
                                        <asp:ListItem Text="Minas Gerais " Value="MG" />
                                        <asp:ListItem Text="Pará " Value="PA" />
                                        <asp:ListItem Text="Paraíba " Value="PB" />
                                        <asp:ListItem Text="Paraná " Value="PR" />
                                        <asp:ListItem Text="Pernambuco " Value="PE" />
                                        <asp:ListItem Text="Piauí " Value="PI" />
                                        <asp:ListItem Text="Rio de Janeiro " Value="RJ" />
                                        <asp:ListItem Text="Rio Grande do Norte " Value="RN" />
                                        <asp:ListItem Text="Rio Grande do Sul " Value="RS" />
                                        <asp:ListItem Text="Rondônia " Value="RO" />
                                        <asp:ListItem Text="Roraima " Value="RR" />
                                        <asp:ListItem Text="Santa Catarina " Value="SC" />
                                        <asp:ListItem Text="São Paulo " Value="SP" />
                                        <asp:ListItem Text="Sergipe " Value="SE" />
                                        <asp:ListItem Text="Tocantins " Value="TO" />
                                    </asp:DropDownList>
                                </div>
                                <div class="col">
                                    <label for="tbCidade">Nat. (Cidade)</label>
                                    <asp:TextBox runat="server" ID="tbCidade" CssClass="form-control" placeholder="Cidade" />
                                </div>
                            </div>

                        </div>
                        <hr />

                        <div class="form-group">
                            <div class="row">
                                <div class="col">
                                    <label for="dpEstCivil">Estado Civil</label>
                                    <asp:DropDownList runat="server" ID="dpEstCivil" CssClass="form-control">
                                        <asp:ListItem Text="Casado" Value="C" Selected="true" />
                                        <asp:ListItem Text="Solteiro" Value="S" />
                                        <asp:ListItem Text="Outro" Value="O" />
                                    </asp:DropDownList>
                                </div>
                                <div class="col">
                                    <label for="tbDataNascimento">Data de Nascimento</label>
                                    <asp:TextBox runat="server" ID="tbDataNascimento" CssClass="form-control" type="date"/>
                                </div>
                            </div>

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
                                    <asp:TextBox runat="server" ID="tbRG" CssClass="form-control number" placeholder="digite..." />
                                </div>
                                <div class="col">
                                    <label for="tbEmissorRG">Órgão Emissor</label>
                                    <asp:TextBox runat="server" ID="tbEmissorRG" CssClass="form-control" placeholder="digite..."/>
                                </div>
                                <div class="col">
                                    <label for="tbdtEmissaoRG">Data de Emissão</label>
                                    <asp:TextBox runat="server" ID="tbdtEmissaoRG" CssClass="form-control" placeholder="digite..." type="date"/>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <label for="tbCPF">CPF</label>
                                    <asp:TextBox runat="server" ID="tbCPF" CssClass="form-control cpf" placeholder="digite..." />
                                </div>
                                <div class="col-md-8">
                                    <label for="tbEmail">Email</label>
                                    <asp:TextBox runat="server" ID="tbEmail" CssClass="form-control" placeholder="digite..." />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <label for="tbTelefone">Telefone</label>
                                    <asp:TextBox runat="server" ID="tbTelefone" CssClass="form-control phone_with_ddd" placeholder="digite..." />
                                </div>
                                <div class="col">
                                    <label for="tbCelular">Celular</label>
                                    <asp:TextBox runat="server" ID="tbCelular" CssClass="form-control phone_with_ddd" placeholder="digite..." />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <label for="tbObservacoes">Observações</label>
                                    <asp:TextBox runat="server" ID="tbObservacoes" CssClass="form-control" TextMode="MultiLine" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                        <asp:Button ID="btSalvar" Text="Salvar" runat="server" CssClass="btn btn-primary" OnClientClick="Validar();" OnClick="btSalvar_Click" />
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
                                    <asp:DropDownList runat="server" ID="dpEspecialidade" DataSourceID="dsEspecialidades" CssClass="form-control" DataTextField="ccEspecialidade" DataValueField="idEspecialidade">
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource runat="server" ID="dsEspecialidades" SelectMethod="Listar" TypeName="Site.Classes.Especialidade" />
                                </div>

                                <div class="col">
                                    <label for="tbPosGraduacao">Pós-Graduação</label>
                                    <asp:TextBox runat="server" ID="tbPosGraduacao" CssClass="form-control" placeholder="digite..." />
                                </div>
                            </div>
                            <div class="row collapse" id="colNovaEspecialidade">
                                <div class="col">
                                    <label for="tbEspecialidadeNova">Cadastrar Nova</label>
                                    <asp:TextBox runat="server" ID="tbEspecialidadeNova" CssClass="form-control" />
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <label for="tbConselhoRegional">Conselho Regional</label>
                                    <asp:TextBox runat="server" ID="tbConselhoRegional" CssClass="form-control" placeholder="digite..." />
                                </div>
                                <div class="col">
                                    <label for="tbNumInscricaoConselho">Num. Inscrição</label>
                                    <asp:TextBox runat="server" ID="tbNumInscricaoConselho" CssClass="form-control number" placeholder="digite..." />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label for="tbTituloEleitor">Título de Eleitor</label>
                                    <asp:TextBox runat="server" ID="tbTituloEleitor" CssClass="form-control number" placeholder="digite..." />
                                </div>
                                <div class="col-md-3">
                                    <label for="tbZonaEleitor">Zona</label>
                                    <asp:TextBox runat="server" ID="tbZonaEleitor" CssClass="form-control number" placeholder="digite..." />
                                </div>
                                <div class="col-md-3">
                                    <label for="tbSecaoEleitor">Seção</label>
                                    <asp:TextBox runat="server" ID="tbSecaoEleitor" CssClass="form-control number" placeholder="digite..." />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <label for="tbReservista">Reservista</label>
                                    <asp:TextBox runat="server" ID="tbReservista" CssClass="form-control number" placeholder="digite..." />
                                </div>
                                <div class="col">
                                    <label for="tbPisPasep">PIS/PASEP/NIT</label>
                                    <asp:TextBox runat="server" ID="tbPisPasep" CssClass="form-control number" placeholder="digite..." />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                        <asp:Button ID="btSalvarDados" Text="Salvar" runat="server" CssClass="btn btn-primary" OnClick="btSalvarDados_Click" OnClientClick="ValidarFormacao()" />
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
                                    <asp:TextBox runat="server" ID="tbCep" CssClass="form-control cep" placeholder="digite..." />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <label for="dpEnderecoUF">UF</label>
                                    <asp:DropDownList runat="server" ID="dpEnderecoUF" CssClass="form-control">
                                        <asp:ListItem Text="Selecionar..." Value="00" />
                                        <asp:ListItem Text="Acre" Value="AC" />
                                        <asp:ListItem Text="Alagoas " Value="AL" />
                                        <asp:ListItem Text="Amapá " Value="AP" />
                                        <asp:ListItem Text="Amazonas " Value="AM" />
                                        <asp:ListItem Text="Bahia " Value="BA" />
                                        <asp:ListItem Text="Ceará " Value="CE" />
                                        <asp:ListItem Text="Distrito Federal " Value="DF" />
                                        <asp:ListItem Text="Espírito Santo " Value="ES" />
                                        <asp:ListItem Text="Goiás " Value="GO" />
                                        <asp:ListItem Text="Maranhão " Value="MA" />
                                        <asp:ListItem Text="Mato Grosso " Value="MT" />
                                        <asp:ListItem Text="Mato Grosso do Sul " Value="MS" />
                                        <asp:ListItem Text="Minas Gerais " Value="MG" />
                                        <asp:ListItem Text="Pará " Value="PA" />
                                        <asp:ListItem Text="Paraíba " Value="PB" />
                                        <asp:ListItem Text="Paraná " Value="PR" />
                                        <asp:ListItem Text="Pernambuco " Value="PE" />
                                        <asp:ListItem Text="Piauí " Value="PI" />
                                        <asp:ListItem Text="Rio de Janeiro " Value="RJ" />
                                        <asp:ListItem Text="Rio Grande do Norte " Value="RN" />
                                        <asp:ListItem Text="Rio Grande do Sul " Value="RS" />
                                        <asp:ListItem Text="Rondônia " Value="RO" />
                                        <asp:ListItem Text="Roraima " Value="RR" />
                                        <asp:ListItem Text="Santa Catarina " Value="SC" />
                                        <asp:ListItem Text="São Paulo " Value="SP" />
                                        <asp:ListItem Text="Sergipe " Value="SE" />
                                        <asp:ListItem Text="Tocantins " Value="TO" />
                                    </asp:DropDownList>
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
                        <asp:Button ID="btSalvarEndereco" Text="Salvar" runat="server" CssClass="btn btn-primary" OnClientClick="ValidarEndereco()" OnClick="btSalvarEndereco_Click" />
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
                                    <label for="dpProfissionalBanco">Banco</label>
                                    <asp:DropDownList runat="server" ID="dpProfissionalBanco" CssClass="form-control" DataSourceID="dsBancos" DataTextField="ccBanco" DataValueField="IdBanco">
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsBancos" runat="server" SelectMethod="Listar" TypeName="Site.Classes.Banco"></asp:ObjectDataSource>

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
                        <div class="row">
                            <div class="col">
                                <input type="button" id="btAdicionarBanco" value="Adicionar" class="btn btn-secondary" onclick="AdicionarBanco(); ValidarBanco();"  />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <br />
                                <asp:GridView runat="server" ID="gvProfissionalBanco" CssClass="table table-hover table-striped table-sm" AutoGenerateColumns="false" OnRowCommand="gvProfissionalBanco_RowCommand">
                                    <%--banco - agencia - conta - operacao - acoes--%>
                                    <Columns>
                                        <asp:BoundField DataField="IdProfissionalBanco" HeaderText="ID" />
                                        <asp:BoundField DataField="ccBanco" HeaderText="Banco" />
                                        <asp:BoundField DataField="ccAgencia" HeaderText="Agência" />
                                        <asp:BoundField DataField="ccConta" HeaderText="Conta" />
                                        <asp:BoundField DataField="ccOperacao" HeaderText="Operação" />
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <%--<asp:imagebutton imageurl="~/Content/Icons/create-outline.svg" Height="1.5em" runat="server" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CommandName="Editar"  ToolTip="Editar" />--%>
                                                <asp:ImageButton ImageUrl="~/Content/Icons/trash-outline.svg" Height="1.5em" runat="server" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CommandName="Excluir" ToolTip="Excluir" OnClientClick="return confirm('Deseja excluir o registro?');" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="reset" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                        <%--<asp:Button ID="btSalvarProfissionalBanco" Text="Salvar" runat="server" CssClass="btn btn-primary" OnClick="btSalvarProfissionalBanco_Click" />--%>
                    </div>
                </div>
            </div>
        </div>

        <%--Modais--%>
    </form>

    <script type="text/javascript" src="../Scripts/DataTables/media/js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="../Scripts/jquery.mask.js"></script>
    <script type="text/javascript" src="../Scripts/Site.js"></script>
    <script type="text/javascript" src="../Scripts/Operacoes/Medico.js"></script>

    <script>  
        $(document).ready(function () {
            Validar();
            ValidarFormacao();
            ValidarEndereco();
            if ($("#HiddenBancoCadastrado").val() != "0") {
                $('.progress-bar').attr('aria-valuenow', 100).css('width', '100%');
                $("#divImprimir").removeClass("d-none")
            }
        });


        $("#btPessoal").click(function () {
            $("#btPessoal").removeClass("btn-secondary").addClass("btn-info");
            $("#btProfissional").removeClass("btn-info").addClass("btn-secondary");
            $("#btEndereco").removeClass("btn-info").addClass("btn-secondary");
            $("#btBanco").removeClass("btn-info").addClass("btn-secondary");
            
            $("#medicoModal").modal("show");

            $('#tbNome').attr('required', 'required');
            $('#tbCidade').attr('required', 'required');
            $('#tbDataNascimento').attr('required', 'required');
            $('#tbRG').attr('required', 'required');
            $('#tbEmissorRG').attr('required', 'required');
            $('#tbdtEmissaoRG').attr('required', 'required');
            $('#tbCPF').attr('required', 'required');
            $('#tbEmissorRG').attr('required', 'required');
            $('#tbEmail').attr('required', 'required');
            $('#tbTelefone').attr('required', 'required');
            $('#tbCelular').attr('required', 'required');
            AdicionarMascaras();
        });

        $("#btProfissional").click(function () {
            $("#btProfissional").removeClass("btn-secondary").addClass("btn-info");
            $("#btPessoal").removeClass("btn-info").addClass("btn-secondary");
            $("#btEndereco").removeClass("btn-info").addClass("btn-secondary");
            $("#btBanco").removeClass("btn-info").addClass("btn-secondary");

            $('#tbFormacao').attr('required', 'required');
            $('#tbConselhoRegional').attr('required', 'required');
            $('#tbNumInscricaoConselho').attr('required', 'required');

            $("#profissionalModal").modal("show");

            AdicionarMascaras();
        });

        $("#btEndereco").click(function () {
            $("#btEndereco").removeClass("btn-secondary").addClass("btn-info");
            $("#btProfissional").removeClass("btn-info").addClass("btn-secondary");
            $("#btPessoal").removeClass("btn-info").addClass("btn-secondary");
            $("#btBanco").removeClass("btn-info").addClass("btn-secondary");

            $('#tbEndereço').attr('required', 'required');
            $('#tbBairro').attr('required', 'required');
            $('#tbCep').attr('required', 'required');
            $('#tbEnderecoCidade').attr('required', 'required');
            $("#moradiaModal").modal("show");

            AdicionarMascaras();
        });

        $("#btBanco").click(function () {
            $("#btBanco").removeClass("btn-secondary").addClass("btn-info");
            $("#btProfissional").removeClass("btn-info").addClass("btn-secondary");
            $("#btEndereco").removeClass("btn-info").addClass("btn-secondary");
            $("#btPessoal").removeClass("btn-info").addClass("btn-secondary");

            $("#bancoModal").modal("show");

            AdicionarMascaras();
        });

        function Validar()
        {
            var v1 = $('#tbNome').val();
            var v2 = $('#tbCidade').val();
            var v3 = $('#tbDataNascimento').val();
            var v4 = $('#tbRG').val();
            var v5 = $('#tbEmissorRG').val();
            var v6 = $('#tbdtEmissaoRG').val();
            var v7 = $('#tbCPF').val();
            var v8 = $('#tbEmissorRG').val();
            var v9 = $('#tbEmail').val();
            var v10 = $('#tbTelefone').val();
            var v11 = $('#tbCelular').val();


            if (v1 != "" && v2 != "" && v3 != "" && v4 != "" && v5 != "" && v6 != "" && v7 != "" && v8 != "" && v9 != "" && v10 != "" && v11 != "") {
                RemoverMascaras();
                $("#btProfissional").removeAttr("disabled");
                $('.progress-bar').attr('aria-valuenow', 25).css('width', '25%');
            }
            else {
                console.log("Campos invalidados");
            }
        }

        function ValidarFormacao() {

            var v1 = $('#tbFormacao').val();
            var v2 = $('#tbConselhoRegional').val();
            var v3 = $('#tbNumInscricaoConselho').val();
            if (v1 != "" && v2 != "" && v3 != "") {
                RemoverMascaras();
                $("#btEndereco").removeAttr("disabled");
                $('.progress-bar').attr('aria-valuenow', 50).css('width', '50%');
            } else {
                console.log("Campos invalidados");
            }
        }

        function ValidarEndereco() {
            var v1 = $('#tbEndereço').val();
            var v2 = $('#tbBairro').val();
            var v3 = $('#tbCep').val();
            var v4 = $('#tbEnderecoCidade').val();

            if (v1 != "" && v2 != "" && v3 != "" && v4 != "") {
                RemoverMascaras();
                $("#btBanco").removeAttr("disabled");
                $('.progress-bar').attr('aria-valuenow', 75).css('width', '75%');
            } else {
                console.log("Campos invalidados");
            }
        }

        function ValidarBanco() {
            RemoverMascaras();
            $("#divImprimir").removeClass("d-none")
            $('.progress-bar').attr('aria-valuenow', 100).css('width', '100%');
        }
        
        function AdicionarMascaras() {
            $('.cep').mask('00000-000');
            $('.cpf').mask('000.000.000-00', { reverse: true });
            $('.cnpj').mask('00.000.000/0000-00', { reverse: true });
            $('.phone_with_ddd').mask('(00) 00000-0000');
        };
    </script>
</body>
</html>
