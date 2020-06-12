<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profissionais.aspx.cs" Inherits="Site.Reports.Report1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col"></div>
        <div class="col">
            <h2>Lista de Profissionais</h2>
        </div>
        <div class="col"></div>
    </div>
    <div class="row">
        <div class="col">
            <asp:Button ID="btExportar" Text="Exportar" runat="server" CssClass="btn btn-secondary" OnClick="btExportar_Click" />
        </div>
    </div>
    <div class="row">
        <div class="col">
            <br />
            <asp:GridView ID="gvMedicos" runat="server" DataSourceID="dsMedico" CssClass="table table-hover table-striped table-sm" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="cvIdProfissional" HeaderText="ID" />
                    <asp:BoundField DataField="ccNome" HeaderText="Nome" />
                    <asp:BoundField DataField="cvCPF" HeaderText="CPF" />
                    <asp:BoundField DataField="ccSexo" HeaderText="Sexo" />
                    <asp:BoundField DataField="cvTelCelular" HeaderText="Celular" />
                    <asp:BoundField DataField="ccEmail" HeaderText="Email" />
                    <asp:BoundField HeaderText="UF" />
                    <asp:BoundField DataField="ccCidade" HeaderText="Cidade" />
                    <asp:BoundField DataField="ccEndereco" HeaderText="Endereço" />
                    <asp:BoundField DataField="ccEspecialidade" HeaderText="Especialidade" />
                    <asp:BoundField HeaderText="Data Adesão" />
                    <asp:BoundField HeaderText="Data Registro Cartório" />
                    <asp:BoundField HeaderText="Clínicas" />



                    <%--<asp:BoundField DataField="ccNaturalidade" HeaderText="Naturalidade" />--%>
                    <%--<asp:BoundField DataField="ccUF" HeaderText="UF" />--%>
                    <%--<asp:BoundField DataField="cdNascimento" HeaderText="Data Nascimento" DataFormatString="{0:d}"/>--%>
                    <%--<asp:BoundField DataField="ccEstadoCivil" HeaderText="Estado Civil" />--%>
                    <%--<asp:BoundField DataField="ccNomePai" HeaderText="Nome Pai" />
                    <asp:BoundField DataField="ccNomeMae" HeaderText="Nome Mãe" />
                    <asp:BoundField DataField="ccNomeConjuge" HeaderText="Nome Cônjuge" />
                    <asp:BoundField DataField="cvRG" HeaderText="RG" />
                    <asp:BoundField DataField="cdDataExpedicao" HeaderText="Data Expedição" DataFormatString="{0:d}"/>
                    <asp:BoundField DataField="ccOrgaoExpedidor" HeaderText="Órgão Expedidor" />
                    <asp:BoundField DataField="ccTelefone" HeaderText="Telefone" />
                    <asp:BoundField DataField="ccFormacaoProfissional" HeaderText="Formação Profissional" />
                    <asp:BoundField DataField="ccPosGraduacao" HeaderText="Pós-Graduação" />
                    <asp:BoundField DataField="ccConselhoRegional" HeaderText="Conselho Regional" />
                    <asp:BoundField DataField="cvNumInscricao" HeaderText="Num Inscrição" />
                    <asp:BoundField DataField="cvPisPasepNit" HeaderText="PIS/PASEP/NIT" />
                    <asp:BoundField DataField="cvTituloEleitor" HeaderText="Título Eleitor" />
                    <asp:BoundField DataField="cvZona" HeaderText="Zona" />
                    <asp:BoundField DataField="cvSecao" HeaderText="Seção" />
                    <asp:BoundField DataField="cvCnh" HeaderText="CNH" />
                    <asp:BoundField DataField="cvCertificadoReservista" HeaderText="Reservista" />
                    <asp:BoundField DataField="ccBairro" HeaderText="Bairro" />
                    <asp:BoundField DataField="ccCep" HeaderText="CEP" />
                    <asp:BoundField DataField="ccBanco" HeaderText="Banco" />
                    <asp:BoundField DataField="ccAgencia" HeaderText="Agencia" />
                    <asp:BoundField DataField="ccContaCorrente" HeaderText="Conta Corrente" />
                    <asp:BoundField DataField="ccOperacao" HeaderText="Operação" />--%>

                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource ID="dsMedico" runat="server" SelectMethod="Listar" TypeName="Site.Classes.Profissional"></asp:ObjectDataSource>
        </div>
    </div>
</asp:Content>
