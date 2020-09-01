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
    <asp:HiddenField runat="server" ID="HiddenUser" Value="" />
    <input runat="server" type="hidden" id="idHiddenMedico" name="idHiddenMedico" />
    <input runat="server" type="hidden" id="idHiddenProfissionalEndereco" name="idHiddenProfissionalEndereco" />
    <input runat="server" type="hidden" id="idHiddenProfissionalBanco" name="idHiddenProfissionalBanco" />
    <input runat="server" type="hidden" id="idHiddenProfissionalDado" name="idHiddenProfissionalDado" />
    <input runat="server" type="hidden" id="nameProfissional" name="nameProfissional" />
    <%--Hidden Filds--%>

    <div class="row">
        <div class="col-md-4"></div>

        <div class="col-md-4">
            <h2>Cadastro de Médicos</h2>
        </div>
        <div class="col-md-4"></div>
    </div>
    <asp:LinkButton runat="server" data-toggle="modal" data-target="#medicoModal" ToolTip="Editar" CssClass="btn btn-secondary" OnClientClick="LimparForm()">
        Novo Médico
    </asp:LinkButton>
    <div class="row">
        <div class="col">
            <br />

            <asp:GridView runat="server" ID="gvMedicos" DataSourceID="dsMedicos" AutoGenerateColumns="False" CssClass="table table-hover table-striped table-sm" UseAccessibleHeader="true" OnPreRender="gvMedicos_PreRender" OnRowCommand="gvMedicos_RowCommand">
                <Columns>
                    <asp:BoundField DataField="IdProfissional" HeaderText="ID" ItemStyle-CssClass="imgLink" />
                    <asp:BoundField DataField="ccNome" HeaderText="Nome" />
                    <asp:BoundField DataField="ccEmail" HeaderText="Email" />
                    <asp:BoundField DataField="Observacoes" HeaderText="Observações" />
                    <asp:TemplateField ItemStyle-CssClass="imgLink">
                        <ItemTemplate>
                            <input type="image" class="imgButton" src="../Content/Icons/person-outline.svg" title="Dados Pessoais" onclick="<%# DataBinder.Eval(Container.DataItem, "IdProfissional", "return CarregarModal({0});") %>"/>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-CssClass="imgLink">
                        <ItemTemplate>
                            <input type="image" class="imgButton" src="../Content/Icons/medkit-outline.svg" title="Dados Profissionais" onclick="<%# DataBinder.Eval(Container.DataItem, "IdProfissional", "return CarregarModalProfissional({0});") %>"/>
                            <%--<asp:ImageButton runat="server" CssClass="imgButton" ID="btEdProfissionais" ImageUrl="~/Content/Icons/medkit-outline.svg" CommandName="EdProfissionais" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" ToolTip="Dados Profissionais" OnClientClick="LimparForm();" />--%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-CssClass="imgLink">
                        <ItemTemplate>
                            <input type="image" class="imgButton" src="../Content/Icons/home-outline.svg" title="Endereço" onclick="<%# DataBinder.Eval(Container.DataItem, "IdProfissional", "return CarregarModalEndereco({0});") %>"/>
                            <%--<asp:ImageButton runat="server" CssClass="imgButton" ID="btEdEndereco" ImageUrl="~/Content/Icons/home-outline.svg" CommandName="EdEndereco" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" ToolTip="Endereço" OnClientClick="LimparForm()" />--%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-CssClass="imgLink">
                        <ItemTemplate>
                            <input type="image" class="imgButton" src="../Content/Icons/cash-outline.svg" title="Dados Bancários" onclick="<%# DataBinder.Eval(Container.DataItem, "IdProfissional", "return CarregarModalBanco({0});") %>"/>
                            <%--<asp:ImageButton runat="server" CssClass="imgButton" ID="btEdBanco" ImageUrl="~/Content/Icons/cash-outline.svg" CommandName="EdBanco" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" ToolTip="Dados Bancários" OnClientClick="LimparForm()" />--%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-CssClass="imgLink">
                        <ItemTemplate>
                            <input type="image" class="imgButton" src="../Content/Icons/archive-outline.svg" title="Arquivar" onclick="<%# DataBinder.Eval(Container.DataItem, "IdProfissional", "window.open('Arquivos.aspx?id={0}', '', 'width=600,height=400');") %>"/>
                            <%--<asp:ImageButton runat="server" CssClass="imgButton" ID="btAddArquivos" ImageUrl="~/Content/Icons/archive-outline.svg" CommandName="AddArquivos" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" ToolTip="Adicionar arquivos" />--%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-CssClass="imgLink">
                        <ItemTemplate>
                            <asp:ImageButton runat="server" CssClass="imgButton" ID="btExcluir" ImageUrl="~/Content/Icons/trash-outline.svg" title="Excluir" CommandName="Excluir" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" ToolTip="Excluir" OnClientClick="return confirm('Deseja excluir o registro?');" />
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
                        <input runat="server" type="text" name="tbNome" id="tbNome" value="" class="form-control" required />
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-sm-3">
                                <label for="dpSexo">Sexo:</label>
                                <select  runat="server" id="dpSexo" class="form-control">
                                    <option value="M">M</option>
                                    <option value="F">F</option>
                                </select>
                            </div>
                            <div class="col-sm-5">
                                <label for="dpUFNatural">Natural(UF):</label>
                                <select runat="server" id="dpUFNatural" class="form-control">
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
                                <input runat="server" type="text" name="tbCidade" id="tbCidade" value="" class="form-control" required />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <label for="tbEstCivil">Estado Civil:</label>
                                <select runat="server" id="tbEstCivil" class="form-control">
                                    <option value="C">Casado</option>
                                    <option value="S">Solteiro</option>
                                </select>
                            </div>
                            <div class="col">
                                <label for="tbdtNascimento">Data de Nascimento:</label>
                                <input runat="server" type="date" name="tbNome" id="tbdtNascimento" value="" class="form-control" required />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="tbPai">Nome do pai:</label>
                            <input runat="server" type="text" name="tbPai" id="tbPai" value="" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="tbMae">Nome da mãe:</label>
                            <input runat="server" type="text" name="tbMae" id="tbMae" value="" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="tbConjuge">Nome do cônjuge:</label>
                            <input runat="server" type="text" name="tbConjuge" id="tbConjuge" value="" class="form-control" />
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <label for="tbRGNum">RG:</label>
                                <input runat="server" type="text" name="tbRGNum" id="tbRGNum" value="" class="form-control number" required />
                            </div>
                            <div class="col">
                                <label for="tbRGEmissor">Emissor:</label>
                                <input runat="server" type="text" name="tbRGEmissor" id="tbRGEmissor" value="" class="form-control" required />
                            </div>
                            <div class="col-md-5">
                                <label for="tbRGdata">Emissão:</label>
                                <input runat="server" type="date" name="tbRGdata" id="tbRGdata" value="" class="form-control" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <label for="tbCPF">CPF:</label>
                                <input runat="server" type="text" name="tbCPF" id="tbCPF" value="" class="form-control cpf" required />
                            </div>
                            <div class="col">
                                <label for="tbCNH">CNH:</label>
                                <input runat="server" type="text" name="tbCNH" id="tbCNH" value="" class="form-control number" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="tbEmail">Email:</label>
                            <input runat="server" type="text" name="tbEmail" id="tbEmail" value="" class="form-control" onfocusout="Validaremails()" />
                        </div>
                        <div class="row">
                            <div class="col">
                                <label for="tbFone">Fone:</label>
                                <input runat="server" type="text" name="tbFone" id="tbFone" value="" class="form-control phone_with_ddd" />
                            </div>
                            <div class="col">
                                <label for="tbCelular">Celular:</label>
                                <input runat="server" type="text" name="tbCelular" id="tbCelular" value="" class="form-control phone_with_ddd" />
                            </div>
                        </div>
                        <hr />
                        <div class="row">
                            <div class="col">
                                <label for="tbDtFiliacao">Filiação:</label>
                                <input runat="server" type="date" name="tbDtFiliacao" id="tbDtFiliacao" value="" class="form-control" />
                            </div>
                            <div class="col">
                                <label for="tbDtPagamento">Pagamento:</label>
                                <input runat="server" type="date" name="tbDtPagamento" id="tbDtPagamento" value="" class="form-control" />
                            </div>
                           
                        </div>
                        <div class="row">
                            <div class="col">
                                <label for="tbDtRegCartorio">Registro:</label>
                                <input runat="server" type="date" name="tbDtRegCartorio" id="tbDtRegCartorio" value="" class="form-control" />
                            </div>
                            <div class="col"></div>
                        </div>
                        <hr />
                        <div class="form-group">
                            <label for="tbObs">Observações:</label>
                            <textarea runat="server" class="form-control" id="tbObs"></textarea>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <%--<button type="button" class="btn btn-primary" onclick="SalvarMedico()" >Salvar</button>--%>
                    <asp:Button Text="Salvar" ID="btSalvar" runat="server" CssClass="btn btn-primary" OnClick="btSalvar_Click" />
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
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
                                <%--<asp:TextBox runat="server" ID="tbFormacao" CssClass="form-control" placeholder="digite..." />--%>
                                <asp:DropDownList runat="server" ID="dpFormacao" DataSourceID="dsFormacao" CssClass="form-control" DataTextField="ccFormacao" DataValueField="ccFormacao">
                                </asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="dsFormacao" ConnectionString="<%$ ConnectionStrings:Dados %>" SelectCommand="SEL_Formacoes" SelectCommandType="StoredProcedure" />
                            </div>
                        </div>
                        </div>
                    <div class="form-group">
                        <div class="row collapse" id="rowFormacao">
                            <div class="col">
                                <input runat="server" type="text" id="tbFormProfissional" name="tbFormProfissional" value="" class="form-control" placeholder="Nova Formação" />
                            </div>
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
                            <label>Conselho Regional</label>
                            <%--<asp:TextBox runat="server" ID="tbConselhoRegional" CssClass="form-control" placeholder="digite..." />--%>
                            <input runat="server" list="dsConselhos" id="dpConselhoRegional" class="form-control" />
                            <datalist id="dsConselhos">
                                <option value="CRM">
                                <option value="CRO">
                                <option value="CREFITO">
                            </datalist>
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
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                    <%--<asp:Button ID="btSalvarDados" Text="Salvar" runat="server" CssClass="btn btn-primary" OnClientClick="" />--%>
                    <button type="button" class="btn btn-primary" onclick="SalvarDados()">Salvar</button>
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
                            <div class="col-md-4">
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
                            <div class="col-md-8">
                                <label for="tbEnderecoCidade">Cidade</label>
                                <asp:TextBox runat="server" ID="tbEnderecoCidade" CssClass="form-control" placeholder="digite..." />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                    <%--<asp:Button ID="btSalvarEndereco" Text="Salvar" runat="server" CssClass="btn btn-primary" OnClientClick="RemoverMascaras()" />--%>
                    <input type="button" id="btSalvarEndereco" name="btSalvarEndereco" value="Salvar" class="btn btn-primary" onclick="SalvarEndereco()" />
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
                                <asp:DropDownList runat="server" ID="dpProfissionalBanco" CssClass="form-control" DataSourceID="dsBancos" DataTextField="ccBancoCod" DataValueField="IdBanco">
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
                            <input type="button" id="btAdicionarBanco" value="Adicionar" class="btn btn-secondary" onclick="AdicionarBanco()" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col" id="tbBanco">
                            <br />
                            <table class="table table-hover table-striped table-sm">
                               <thead>
                                   <tr>
                                       <td>ID</td>
                                       <td>Banco</td>
                                       <td>Agência</td>
                                       <td>Conta</td>
                                       <td>Operação</td>
                                       <td></td>
                                   </tr>
                               </thead>
                                <tbody id="bodyBanco">

                                </tbody>
                            </table>

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

     <!-- Modal Arquivos -->
    <div class="modal fade" id="arquivosModal" tabindex="-1" role="dialog" aria-labelledby="arquivosModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="arquivosModalLabel">Arquivos(<asp:Label Text="" runat="server" ID="nameArquivos" />)</h5>
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
                            <asp:GridView runat="server" ID="gvProfissionalArquivo" CssClass="table table-hover table-striped table-sm" AutoGenerateColumns="false"  OnRowCommand="gvProfissionalArquivo_RowCommand" >
                                <Columns>
                                    <asp:BoundField DataField="idArquivo" HeaderText="ID" />
                                    <asp:BoundField DataField="ccNomeArquivo" HeaderText="Arquivo" />
                                    <asp:BoundField DataField="cdDataCriacao" HeaderText="Data" />
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:ImageButton runat="server" ID="btBaixarArquivo" ImageUrl="~/Content/Icons/cloud-download-outline.svg" CommandName="Baixar" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" Height="1.5em" ToolTip="Editar" />&nbsp&nbsp
                                            <asp:ImageButton runat="server" ID="btExcluirArquivo" ImageUrl="~/Content/Icons/trash-outline.svg" CommandName="Excluir" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" Height="1.5em" ToolTip="Editar" OnClientClick="return confirm('Deseja excluir o registro?');" />&nbsp&nbsp
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
            CarregarFiltro();

            $('.dataTables_filter input').change(function () {
                localStorage["Medico"] = $('.dataTables_filter input').val();
            });

            $("#MainContent_dpEspecialidade").change(function () {
                //alert($(this).children("option:selected").text());
                var op = $(this).children("option:selected").text();
                if (op === "Outra") {
                    $('#colNovaEspecialidade').collapse('show');
                } else {
                    $('#colNovaEspecialidade').collapse('hide');
                    $("#MainContent_tbEspecialidadeNova").val('');
                }
            });

            $("#MainContent_dpFormacao").append('<option>Outra</option>')

            $("#MainContent_dpFormacao").change(function () {
                if ($("#MainContent_dpFormacao option:selected").val() === "Outra") {
                    $("#rowFormacao").collapse("show")
                } else {
                    $("#rowFormacao").collapse("hide")
                    $("#MainContent_tbFormProfissional").val('');
                }
            });
        });

        function LimparForm()
        {
            $("#MainContent_tbNome").val("");
            $("#MainContent_dpSexo").val("H").change();
            $("#MainContent_dpUFNatural").val("DF").change();
            $("#MainContent_tbCidade").val("");
            $("#MainContent_tbEstCivil").val("C").change();
            $("#MainContent_tbdtNascimento").val("");
            $("#MainContent_tbPai").val("");
            $("#MainContent_tbMae").val("");
            $("#MainContent_tbConjuge").val("");
            $("#MainContent_tbRGNum").val("");
            $("#MainContent_tbRGEmissor").val("");
            $("#MainContent_tbRGdata").val("");
            $("#MainContent_tbCPF").val("");
            $("#MainContent_tbCNH").val("");
            $("#MainContent_tbEmail").val("");
            $("#MainContent_tbFone").val("");
            $("#MainContent_tbCelular").val("");
            $("#MainContent_tbDtFiliacao").val("");
            $("#MainContent_tbDtPagamento").val("");
            $("#MainContent_tbDtRegCartorio").val("");
            $("#MainContent_tbObs").val("");
        };

        function Validaremails() {
            var emailReg = new RegExp(/^([A-Z0-9.%+-]+@[A-Z0-9.-]+.[A-Z]{2,6})*([,;][\s]*([A-Z0-9.%+-]+@[A-Z0-9.-]+.[A-Z]{2,6}))*$/i);
            var emailText = $('#MainContent_tbEmail').val();
            if (!emailReg.test(emailText)) {
                alert('ERRO: Email inserido com formato incorreto. Insira os emails separados por vírgula!');
                return false;
            }
        };

    </script>
</asp:Content>
