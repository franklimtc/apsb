<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Despesas.aspx.cs" Inherits="Site.Reports.Despesas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col"></div>
        <div class="col">
            <h2>Relatório de Despesas</h2>
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
            <h2>Filtros adicionais</h2>
            <div class="row">
                <div class="col-sm-2">
                    <asp:Label Text="Status" runat="server" AssociatedControlID="chkStatus" />
                    <asp:RadioButtonList runat="server" CssClass="input-group-text" ID="chkStatus">
                        <asp:ListItem Text="Ativo" Selected="True" Value="true" />
                        <asp:ListItem Text="Inativo" Value="false" />
                    </asp:RadioButtonList>
                </div>
                <div class="col-sm-2">
                    <asp:Label Text="Arquivado" runat="server" AssociatedControlID="chkArquivado" />
                    <asp:RadioButtonList runat="server" CssClass="input-group-text" ID="chkArquivado">
                        <asp:ListItem Text="Sim" Value="true" />
                        <asp:ListItem Text="Não" Value="false" Selected="True" />
                    </asp:RadioButtonList>
                </div>
                <div class="col-sm-2">
                    <asp:Label Text="Data Inicial" runat="server" AssociatedControlID="dtInicio" /><asp:TextBox runat="server" ID="dtInicio" type="date" /><br />
                </div>
                <div class="col-sm-2">
                    <asp:Label Text="Data Final" runat="server" AssociatedControlID="dtFim" /><asp:TextBox runat="server" ID="dtFim" type="date" />
                </div>
            </div>
            <div class="row">
                <div class="col-sm-2">
                    <br />
                    <asp:LinkButton ID="btAplicarFiltro" Text="Aplicar" runat="server" CssClass="btn btn-secondary" OnClick="btAplicarFiltro_Click"/>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <br />
            <asp:GridView ID="gvDespesas" runat="server" DataSourceID="dsDespesas" CssClass="table table-hover table-striped table-sm" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="idDespesas" HeaderText="ID" />
                    <asp:BoundField DataField="cvValor" HeaderText="Valor" DataFormatString="{0:C}"/>
                    <asp:BoundField DataField="ccTipo" HeaderText="Descrição" />
                    <asp:BoundField DataField="cdData" HeaderText="Data" DataFormatString="{0:d}" />
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource ID="dsDespesas" runat="server" SelectMethod="Listar" TypeName="Site.Classes.Despesa">
                <SelectParameters>
                    <asp:ControlParameter ControlID="chkArquivado" Name="arquivado" PropertyName="SelectedValue" Type="Boolean" />
                    <asp:ControlParameter ControlID="chkStatus" Name="status" PropertyName="SelectedValue" Type="Boolean" />
                    <asp:ControlParameter ControlID="dtInicio" Name="dtInicio" PropertyName="Text" Type="DateTime" />
                    <asp:ControlParameter ControlID="dtFim" Name="dtFim" PropertyName="Text" Type="DateTime" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
    </div>
</asp:Content>
