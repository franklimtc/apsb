<%@ Page Title="Médicos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Medicos.aspx.cs" Inherits="Site.Cadastros.Medicos" %>

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
    <asp:HiddenField runat="server" ID="idHiddenMedico" />
    <asp:HiddenField runat="server" ID="idHiddenProfissionalEndereco" />
    <asp:HiddenField runat="server" ID="idHiddenProfissionalBanco" />
    <asp:HiddenField runat="server" ID="idHiddenProfissionalDado" />
    <%--Hidden Filds--%>

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-4"></div>

            <div class="col-md-4">
                <h2>Cadastro de Médicos</h2>
            </div>
            <div class="col-md-4"></div>
        </div>
        <asp:LinkButton runat="server" data-toggle="modal" data-target="#medicoModal" ToolTip="Editar" CssClass="btn btn-secondary" OnClientClick="LimparForm()">Novo Médico
        </asp:LinkButton>
        <br />
        <div class="row">
            <div class="col-md-12">
                <br />
                <asp:GridView runat="server" ID="gvMedicos" CssClass="table table-hover table-striped table-sm" OnPreRender="gvMedicos_PreRender" AutoGenerateColumns="false" OnRowCommand="gvMedicos_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="IdProfissional" HeaderText="ID" />
                        <asp:BoundField DataField="ccNome" HeaderText="Nome" />
                        <asp:BoundField DataField="ccEmail" HeaderText="Email" />
                        <asp:BoundField DataField="Observacoes" HeaderText="Observações" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:ImageButton runat="server" CssClass="imgButton" ID="btEditar" ImageUrl="~/Content/Icons/person-outline.svg" CommandName="Editar" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" ToolTip="Dados Pessoais" />
                                <asp:ImageButton runat="server" CssClass="imgButton" ID="btEdProfissionais" ImageUrl="~/Content/Icons/medkit-outline.svg" CommandName="EdProfissionais" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" ToolTip="Dados Profissionais" />
                                <asp:ImageButton runat="server" CssClass="imgButton" ID="btEdEndereco" ImageUrl="~/Content/Icons/home-outline.svg" CommandName="EdEndereco" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" ToolTip="Endereço" OnClientClick="LimparForm()" />
                                <asp:ImageButton runat="server" CssClass="imgButton" ID="btEdBanco" ImageUrl="~/Content/Icons/cash-outline.svg" CommandName="EdBanco" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" ToolTip="Dados Bancários" />
                                <asp:ImageButton runat="server" CssClass="imgButton" ID="btAddArquivos" ImageUrl="~/Content/Icons/archive-outline.svg" CommandName="AddArquivos" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" ToolTip="Adicionar arquivos" />
                                <asp:ImageButton runat="server" CssClass="imgButton" ID="btExcluir" ImageUrl="~/Content/Icons/trash-outline.svg" CommandName="Excluir" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" ToolTip="Excluir" OnClientClick="return confirm('Deseja excluir o registro?');" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <br />
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

    <!-- Modal Arquivos -->
    <div class="modal fade" id="arquivosModal" tabindex="-1" role="dialog" aria-labelledby="arquivosModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="arquivosModalLabel">Arquivos</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-sm-9">
                            <asp:FileUpload runat="server" ID="btUpload" CssClass="btn btn-secondary" />
                            <%--<input type="file" id="myfile" name="myfile" class="btn">--%><br>
                            <br>
                        </div>
                        <div class="col-sm-3">
                            <%--<input id="btUploadFile" type="button" class="btn btn-primary" value="Enviar">--%>
                            <asp:Button Text="Enviar" runat="server" ID="btUploadFile" CssClass="btn btn-primary" OnClick="btUploadFile_Click" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <%--<div class="progress">
                                <div class="progress-bar" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>--%>
                        </div>
                    </div>
                    <hr />
                    <div class="row">
                        <div class="col">
                            <asp:GridView runat="server" ID="gvProfissionalArquivo" CssClass="table table-hover table-striped table-sm" AutoGenerateColumns="false" OnRowCommand="gvProfissionalArquivo_RowCommand">
                                <Columns>
                                    <asp:BoundField DataField="idArquivo" HeaderText="ID" />
                                    <asp:BoundField DataField="ccNomeArquivo" HeaderText="Arquivo" />
                                    <asp:BoundField DataField="cdDataCriacao" HeaderText="Data" />
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:ImageButton runat="server" ID="btBaixarArquivo" ImageUrl="~/Content/Icons/cloud-download-outline.svg" CommandName="Baixar" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" Height="1.5em" ToolTip="Editar" />&nbsp&nbsp
                                            <asp:ImageButton runat="server" ID="btExcluirArquivo" ImageUrl="~/Content/Icons/trash-outline.svg" CommandName="Excluir" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" Height="1.5em" ToolTip="Editar" OnClientClick="return confirm('Deseja excluir o registro?');"  />&nbsp&nbsp
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>

                            </asp:GridView>
                           
                         
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
                                <asp:TextBox runat="server" ID="tbDataNascimento" CssClass="form-control date" Text="" />
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
                                <asp:TextBox runat="server" ID="tbEmissorRG" CssClass="form-control" placeholder="digite..." />
                            </div>
                            <div class="col">
                                <label for="tbdtEmissaoRG">Data de Emissão</label>
                                <asp:TextBox runat="server" ID="tbdtEmissaoRG" CssClass="form-control date" placeholder="digite..." />
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
                    <asp:Button ID="btSalvar" Text="Salvar" runat="server" CssClass="btn btn-primary" OnClick="btSalvar_Click" OnClientClick="RemoverMascaras()" />
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
                    <asp:Button ID="btSalvarDados" Text="Salvar" runat="server" CssClass="btn btn-primary" OnClick="btSalvarDados_Click" />
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
                    <asp:Button ID="btSalvarEndereco" Text="Salvar" runat="server" CssClass="btn btn-primary" OnClick="btSalvarEndereco_Click" />
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
                                            <asp:imagebutton imageurl="~/Content/Icons/trash-outline.svg" Height="1.5em" runat="server" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CommandName="Excluir"  ToolTip="Excluir" OnClientClick="return confirm('Deseja excluir o registro?');" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <input type="button" id="btAdicionarBanco" value="Adicionar" class="btn btn-secondary" onclick="AdicionarBanco()" />
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
        });

        function LimparForm() {
            //alert("limpando form!");

            $("#MainContent_tbNome").val("").attr("required", "required");
            $("#MainContent_tbCidade").val("");
            $("#MainContent_tbNomePai").val("");
            $("#MainContent_tbNomeMae").val("");
            $("#MainContent_tbNomeConjuge").val("");
            $("#MainContent_tbRG").val("").attr("required", "required");
            $("#MainContent_tbEmissorRG").val("");
            $("#MainContent_tbdtEmissaoRG").val("");
            $("#MainContent_tbCPF").val("").attr("required", "required");
            $("#MainContent_tbEmail").val("");
            $("#MainContent_tbTelefone").val("");
            $("#MainContent_tbCelular").val("").attr("required", "required");
            $("#MainContent_idHiddenMedico").val("");
            $("#MainContent_dpSexo ").val("M").change();
            $("#MainContent_dpNaturalidade").val("00").change();
            $("#MainContent_dpEstCivil").val("C").change();
            $("#MainContent_tbObservacoes").val("");

            $("#MainContent_tbDataNascimento").val("")

        }

        //Remover requireds para abrir modais

        $(document).ready(function () {
            $(".imgButton").click(function () {
                $("#MainContent_tbNome").removeAttr("required");
                $("#MainContent_tbRG").removeAttr("required");
                $("#MainContent_tbCPF").removeAttr("required");
                $("#MainContent_tbCelular").removeAttr("required");
            });
        });

        //Cadastrar Nova Especialidade
        $(document).ready(function () {
            $("#MainContent_dpEspecialidade").change(function () {
                //alert($(this).children("option:selected").text());
                var op = $(this).children("option:selected").text();
                if (op === "Outra") {
                    $('#colNovaEspecialidade').collapse('show');
                } else {
                    $('#colNovaEspecialidade').collapse('hide');
                    $("#MainContent_tbEspecialidadeNova").val('')
                }
            });
        });


    </script>
</asp:Content>
