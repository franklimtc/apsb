<%@ Page Title="Médicos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Medicos.aspx.cs" Inherits="Site.Cadastros.Medicos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        #fileLoader {
            display: none;
        }
    </style>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-4"></div>

            <div class="col-md-4">
                <h2>Cadastro de Médicos</h2>
            </div>
            <div class="col-md-4"></div>
        </div>
        <asp:LinkButton runat="server" data-toggle="modal" data-target="#medicoModal" ToolTip="Editar">
                    <asp:button text="Novo Médico" runat="server" CssClass="btn btn-secondary" />
        </asp:LinkButton>
        <br />
        <div class="row">
            <div class="col-md-12">
                <%--<asp:GridView runat="server" ID="gvClinicas"></asp:GridView>--%>
                <br />
                <asp:Table runat="server" ID="gvClinicas" CssClass="table table-hover table-striped table-sm">
                    <asp:TableHeaderRow>
                        <asp:TableHeaderCell>ID</asp:TableHeaderCell>
                        <asp:TableHeaderCell>Nome</asp:TableHeaderCell>
                        <asp:TableHeaderCell>Email</asp:TableHeaderCell>
                        <asp:TableHeaderCell>Observações</asp:TableHeaderCell>
                        <asp:TableHeaderCell>Ações</asp:TableHeaderCell>
                    </asp:TableHeaderRow>
                    <asp:TableRow>
                        <asp:TableCell>01</asp:TableCell>
                        <asp:TableCell>Médico A</asp:TableCell>
                        <asp:TableCell>medico@dominio.com</asp:TableCell>
                        <asp:TableCell>...</asp:TableCell>
                        <asp:TableCell>
                            <asp:LinkButton runat="server" data-toggle="modal" data-target="#medicoModal" ToolTip="Dados Pessoais">
                                <asp:imagebutton imageurl="~/Content/Icons/person-outline.svg" Height="1.5em" runat="server"/>
                            </asp:LinkButton>&nbsp&nbsp
                             <asp:LinkButton runat="server" data-toggle="modal" data-target="#profissionalModal" ToolTip="Dados Profissionais">
                                <asp:imagebutton imageurl="~/Content/Icons/medkit-outline.svg" Height="1.5em" runat="server"/>
                            </asp:LinkButton>&nbsp&nbsp
                             <asp:LinkButton runat="server" data-toggle="modal" data-target="#moradiaModal" ToolTip="Endereço">
                                <asp:imagebutton imageurl="~/Content/Icons/home-outline.svg" Height="1.5em" runat="server"/>
                            </asp:LinkButton>&nbsp&nbsp
                             <asp:LinkButton runat="server" data-toggle="modal" data-target="#bancoModal" ToolTip="Dados bancários">
                                <asp:imagebutton imageurl="~/Content/Icons/cash-outline.svg" Height="1.5em" runat="server"/>
                            </asp:LinkButton>&nbsp&nbsp
                            <asp:LinkButton runat="server" data-toggle="modal" data-target="#arquivosModal" ToolTip="Arquivos">
                                <asp:imagebutton imageurl="~/Content/Icons/archive-outline.svg" Height="1.5em" runat="server"/>
                            </asp:LinkButton>&nbsp&nbsp
                            <asp:imagebutton imageurl="~/Content/Icons/trash-outline.svg" Height="1.5em" runat="server" ToolTip="Excluir" OnClientClick="confirm('Deseja excluir o registro?')" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>02</asp:TableCell>
                        <asp:TableCell>Médico B</asp:TableCell>
                        <asp:TableCell>medico@dominio.com</asp:TableCell>
                        <asp:TableCell>...</asp:TableCell>
                        <asp:TableCell>
                            <asp:LinkButton runat="server" data-toggle="modal" data-target="#medicoModal" ToolTip="Dados Pessoais">
                                <asp:imagebutton imageurl="~/Content/Icons/person-outline.svg" Height="1.5em" runat="server"/>
                            </asp:LinkButton>&nbsp&nbsp
                             <asp:LinkButton runat="server" data-toggle="modal" data-target="#profissionalModal" ToolTip="Dados Profissionais">
                                <asp:imagebutton imageurl="~/Content/Icons/medkit-outline.svg" Height="1.5em" runat="server"/>
                            </asp:LinkButton>&nbsp&nbsp
                             <asp:LinkButton runat="server" data-toggle="modal" data-target="#moradiaModal" ToolTip="Endereço">
                                <asp:imagebutton imageurl="~/Content/Icons/home-outline.svg" Height="1.5em" runat="server"/>
                            </asp:LinkButton>&nbsp&nbsp
                             <asp:LinkButton runat="server" data-toggle="modal" data-target="#bancoModal" ToolTip="Dados bancários">
                                <asp:imagebutton imageurl="~/Content/Icons/cash-outline.svg" Height="1.5em" runat="server"/>
                            </asp:LinkButton>&nbsp&nbsp
                            <asp:LinkButton runat="server" data-toggle="modal" data-target="#arquivosModal" ToolTip="Arquivos">
                                <asp:imagebutton imageurl="~/Content/Icons/archive-outline.svg" Height="1.5em" runat="server"/>
                            </asp:LinkButton>&nbsp&nbsp
                            <asp:imagebutton imageurl="~/Content/Icons/trash-outline.svg" Height="1.5em" runat="server" ToolTip="Excluir" OnClientClick="confirm('Deseja excluir o registro?')" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>03</asp:TableCell>
                        <asp:TableCell>Médico C</asp:TableCell>
                        <asp:TableCell>medico@dominio.com</asp:TableCell>
                        <asp:TableCell>...</asp:TableCell>
                        <asp:TableCell>
                            <asp:LinkButton runat="server" data-toggle="modal" data-target="#medicoModal" ToolTip="Dados Pessoais">
                                <asp:imagebutton imageurl="~/Content/Icons/person-outline.svg" Height="1.5em" runat="server"/>
                            </asp:LinkButton>&nbsp&nbsp
                             <asp:LinkButton runat="server" data-toggle="modal" data-target="#profissionalModal" ToolTip="Dados Profissionais">
                                <asp:imagebutton imageurl="~/Content/Icons/medkit-outline.svg" Height="1.5em" runat="server"/>
                            </asp:LinkButton>&nbsp&nbsp
                             <asp:LinkButton runat="server" data-toggle="modal" data-target="#moradiaModal" ToolTip="Endereço">
                                <asp:imagebutton imageurl="~/Content/Icons/home-outline.svg" Height="1.5em" runat="server"/>
                            </asp:LinkButton>&nbsp&nbsp
                             <asp:LinkButton runat="server" data-toggle="modal" data-target="#bancoModal" ToolTip="Dados bancários">
                                <asp:imagebutton imageurl="~/Content/Icons/cash-outline.svg" Height="1.5em" runat="server"/>
                            </asp:LinkButton>&nbsp&nbsp
                            <asp:LinkButton runat="server" data-toggle="modal" data-target="#arquivosModal" ToolTip="Arquivos">
                                <asp:imagebutton imageurl="~/Content/Icons/archive-outline.svg" Height="1.5em" runat="server"/>
                            </asp:LinkButton>&nbsp&nbsp
                            <asp:imagebutton imageurl="~/Content/Icons/trash-outline.svg" Height="1.5em" runat="server" ToolTip="Excluir" OnClientClick="confirm('Deseja excluir o registro?')" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>04</asp:TableCell>
                        <asp:TableCell>Médico D</asp:TableCell>
                        <asp:TableCell>medico@dominio.com</asp:TableCell>
                        <asp:TableCell>...</asp:TableCell>
                        <asp:TableCell>
                            <asp:LinkButton runat="server" data-toggle="modal" data-target="#medicoModal" ToolTip="Dados Pessoais">
                                <asp:imagebutton imageurl="~/Content/Icons/person-outline.svg" Height="1.5em" runat="server"/>
                            </asp:LinkButton>&nbsp&nbsp
                             <asp:LinkButton runat="server" data-toggle="modal" data-target="#profissionalModal" ToolTip="Dados Profissionais">
                                <asp:imagebutton imageurl="~/Content/Icons/medkit-outline.svg" Height="1.5em" runat="server"/>
                            </asp:LinkButton>&nbsp&nbsp
                             <asp:LinkButton runat="server" data-toggle="modal" data-target="#moradiaModal" ToolTip="Endereço">
                                <asp:imagebutton imageurl="~/Content/Icons/home-outline.svg" Height="1.5em" runat="server"/>
                            </asp:LinkButton>&nbsp&nbsp
                             <asp:LinkButton runat="server" data-toggle="modal" data-target="#bancoModal" ToolTip="Dados bancários">
                                <asp:imagebutton imageurl="~/Content/Icons/cash-outline.svg" Height="1.5em" runat="server"/>
                            </asp:LinkButton>&nbsp&nbsp
                            <asp:LinkButton runat="server" data-toggle="modal" data-target="#arquivosModal" ToolTip="Arquivos">
                                <asp:imagebutton imageurl="~/Content/Icons/archive-outline.svg" Height="1.5em" runat="server"/>
                            </asp:LinkButton>&nbsp&nbsp
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
                            <input type="file" id="myfile" name="myfile" class="btn"><br>
                            <br>
                        </div>
                        <div class="col-sm-3">
                            <input type="submit" class="btn btn-primary">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="progress">
                                <div class="progress-bar" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                        </div>
                    </div>
                    <hr />
                    <div class="row">
                        <div class="col">
                            <asp:Table runat="server" CssClass="table table-hover table-striped table-sm">
                                <asp:TableHeaderRow>
                                    <asp:TableHeaderCell>ID</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Arquivo</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Data</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Ações</asp:TableHeaderCell>
                                </asp:TableHeaderRow>
                                <asp:TableRow>
                                    <asp:TableCell>01</asp:TableCell>
                                    <asp:TableCell>Contrato</asp:TableCell>
                                    <asp:TableCell>01/01/2020</asp:TableCell>
                                    <asp:TableCell>
                                         <asp:imagebutton imageurl="~/Content/Icons/cloud-download-outline.svg" Height="1.5em" runat="server" ToolTip="Excluir" />&nbsp&nbsp
                                         <asp:imagebutton imageurl="~/Content/Icons/trash-outline.svg" Height="1.5em" runat="server" ToolTip="Excluir" OnClientClick="confirm('Deseja excluir o registro?')" />
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>02</asp:TableCell>
                                    <asp:TableCell>Comprovante de residência</asp:TableCell>
                                    <asp:TableCell>01/01/2020</asp:TableCell>
                                    <asp:TableCell>
                                         <asp:imagebutton imageurl="~/Content/Icons/cloud-download-outline.svg" Height="1.5em" runat="server" ToolTip="Excluir" />&nbsp&nbsp
                                         <asp:imagebutton imageurl="~/Content/Icons/trash-outline.svg" Height="1.5em" runat="server" ToolTip="Excluir" OnClientClick="confirm('Deseja excluir o registro?')" />
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>03</asp:TableCell>
                                    <asp:TableCell>Contrato</asp:TableCell>
                                    <asp:TableCell>01/01/2020</asp:TableCell>
                                    <asp:TableCell>
                                         <asp:imagebutton imageurl="~/Content/Icons/cloud-download-outline.svg" Height="1.5em" runat="server" ToolTip="Excluir" />&nbsp&nbsp
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

    <script>

</script>
</asp:Content>
