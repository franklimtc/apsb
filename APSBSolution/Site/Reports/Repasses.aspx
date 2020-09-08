<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Repasses.aspx.cs" Inherits="Site.Reports.Repasses" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col"></div>
        <div class="col">
            <h2>Relatório de Repasses</h2>
        </div>
        <div class="col"></div>
    </div>
    <div class="row">
        <div class="col">
            <asp:Button ID="btExportar" Text="Exportar" runat="server" CssClass="btn btn-secondary" OnClientClick="alert('Não implementado!')" />
        </div>
    </div>

    <div class="row">
        <div class="col">
            <br />
            <asp:GridView runat="server" DataSourceID="dsRepasses" CssClass="table table-hover table-striped" AutoGenerateColumns="False" DataKeyNames="IdProfissional">
                <Columns>
                    <asp:BoundField DataField="IdProfissional" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="IdProfissional" Visible="false" />
                    <asp:BoundField DataField="ccNome" HeaderText="Profissional" SortExpression="ccNome" />
                    <asp:BoundField DataField="nomeMae" HeaderText="Nome da mãe" SortExpression="nomeMae" />
                    <asp:BoundField DataField="CPFNum" HeaderText="CPF" SortExpression="CPFNum"  ItemStyle-CssClass="cpf"/>
                    <asp:BoundField DataField="RGNum" HeaderText="RG" SortExpression="RGNum" />
                    <asp:BoundField DataField="titulo" HeaderText="Título Eleitoral" SortExpression="titulo" />
                    <asp:BoundField DataField="cvCNH" HeaderText="CNH" SortExpression="cvCNH" />
                    <asp:BoundField DataField="pis" HeaderText="PIS" SortExpression="pis" />
                    <asp:BoundField DataField="conselho" HeaderText="Conselho Regional" SortExpression="conselho" />
                    <asp:BoundField DataField="regConselho" HeaderText="Num Inscrição" SortExpression="regConselho" />
                    <asp:BoundField DataField="Banco" HeaderText="Informações Bancárias" ReadOnly="True" SortExpression="Banco" />
                    <asp:BoundField DataField="faturamento" HeaderText="Faturamento" ReadOnly="True" SortExpression="faturamento" ItemStyle-CssClass="money2" />
                    <asp:BoundField DataField="periodo" HeaderText="Período" ReadOnly="True" SortExpression="periodo" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource runat="server" ID="dsRepasses" ConnectionString="<%$ ConnectionStrings:Dados %>" SelectCommand="SEL_ProfissionalRepasses" SelectCommandType="StoredProcedure">
            </asp:SqlDataSource>
        </div>
    </div>
    <script type="text/javascript" src="../Scripts/DataTables/media/js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="../Scripts/jquery.mask.js"></script>
    <script type="text/javascript" src="../Scripts/Site.js"></script>
</asp:Content>
