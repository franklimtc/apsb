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
            <asp:GridView ID="gvMedicos" runat="server" DataSourceID="dsMedico" CssClass="table table-hover table-striped table-sm" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="IdProfissional" HeaderText="IdProfissional" SortExpression="IdProfissional" />
                    <asp:BoundField DataField="ccNome" HeaderText="ccNome" SortExpression="ccNome" />
                    <asp:BoundField DataField="ccSexo" HeaderText="ccSexo" SortExpression="ccSexo" />
                    <asp:BoundField DataField="ccNaturalUF" HeaderText="ccNaturalUF" SortExpression="ccNaturalUF" />
                    <asp:BoundField DataField="ccNaturalCidade" HeaderText="ccNaturalCidade" SortExpression="ccNaturalCidade" />
                    <asp:BoundField DataField="ccEstadoCivil" HeaderText="ccEstadoCivil" SortExpression="ccEstadoCivil" />
                    <asp:BoundField DataField="ccEmail" HeaderText="ccEmail" SortExpression="ccEmail" />
                    <asp:BoundField DataField="cvStatus" HeaderText="cvStatus" SortExpression="cvStatus" />
                    <asp:BoundField DataField="ccCriadoPor" HeaderText="ccCriadoPor" SortExpression="ccCriadoPor" />
                    <asp:BoundField DataField="cdDataCriacao" HeaderText="cdDataCriacao" SortExpression="cdDataCriacao" />
                    <asp:BoundField DataField="ccAlteradoPor" HeaderText="ccAlteradoPor" SortExpression="ccAlteradoPor" />
                    <asp:BoundField DataField="cdDAtaAlteracao" HeaderText="cdDAtaAlteracao" SortExpression="cdDAtaAlteracao" />
                    <asp:BoundField DataField="idObservacao" HeaderText="idObservacao" SortExpression="idObservacao" />
                    <asp:BoundField DataField="Observacoes" HeaderText="Observacoes" SortExpression="Observacoes" />
                    <asp:BoundField DataField="RGNum" HeaderText="RGNum" SortExpression="RGNum" />
                    <asp:BoundField DataField="RGEmissor" HeaderText="RGEmissor" SortExpression="RGEmissor" />
                    <asp:BoundField DataField="RGdtEmissao" HeaderText="RGdtEmissao" SortExpression="RGdtEmissao" />
                    <asp:BoundField DataField="CPFNum" HeaderText="CPFNum" SortExpression="CPFNum" />
                    <asp:BoundField DataField="cvTelefone" HeaderText="cvTelefone" SortExpression="cvTelefone" />
                    <asp:BoundField DataField="cvCelular" HeaderText="cvCelular" SortExpression="cvCelular" />
                    <asp:BoundField DataField="nomePai" HeaderText="nomePai" SortExpression="nomePai" />
                    <asp:BoundField DataField="nomeMae" HeaderText="nomeMae" SortExpression="nomeMae" />
                    <asp:BoundField DataField="nomeConjuge" HeaderText="nomeConjuge" SortExpression="nomeConjuge" />
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource ID="dsMedico" runat="server" SelectMethod="Listar" TypeName="Site.Classes.Profissional"></asp:ObjectDataSource>
        </div>
    </div>
</asp:Content>
