<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Despesas.aspx.cs" Inherits="Site.Reports.Despesas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col"></div>
        <div class="col">
            <h2>Relatório de Despesas</h2>
        </div>
        <div class="col"></div>
    </div>
   
    <div class="row" style="border-style:dotted;border-color:darkcyan; border-width:thin; margin-left: 3px">
        <div class="col-sm-2">
            <h4>Filtros</h4>
            <asp:CheckBox Text="&nbsp Arquivado" runat="server" Checked="false" ID="checkArquivo" /><br />
            <asp:CheckBox Text="&nbsp Ativo" runat="server" Checked="true" ID="checkStatus" />
        </div>
         <div class="col">
            <label>Período:</label><br />
             <asp:TextBox runat="server" id="dtInicio" type="date"/>&nbsp <label for="dtInicial">Data Inicial</label><br>
             <asp:TextBox runat="server" id="dtFim" type="date"/>&nbsp <label for="dtFinal">Data Final</label>
        </div>
    </div>
     <div class="row">
        <div class="col">
            <asp:Button ID="btAtualizar" Text="Atualizar" runat="server" CssClass="btn btn-primary" OnClick="btAplicarFiltro_Click" />
            <asp:Button ID="btExportar" Text="Exportar" runat="server" CssClass="btn btn-secondary" OnClick="btExportar_Click" />


        </div>
    </div>

    <div class="row">
        <div class="col">
            <br />
            <asp:GridView ID="gvDespesas" runat="server" DataSourceID="dsDespesas" CssClass="table table-hover table-striped table-sm" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="idDespesas" HeaderText="ID" />
                    <asp:BoundField DataField="ccCategoria" HeaderText="Categoria" />
                    <asp:BoundField DataField="ccTipo" HeaderText="Descrição" />
                    <asp:BoundField DataField="cvValor" HeaderText="Valor" DataFormatString="{0:C}"/>
                    <asp:BoundField DataField="cdData" HeaderText="Data" DataFormatString="{0:d}" />
                </Columns>
            </asp:GridView>

            <asp:SqlDataSource runat="server" ID="dsDespesas" ConnectionString="<%$ ConnectionStrings:Dados %>" SelectCommand="SEL_Despesas" SelectCommandType="StoredProcedure">
                <SelectParameters>
                <asp:ControlParameter ControlID="checkArquivo" Name="cbArquivado" PropertyName="Checked" Type="Boolean" />
                    <asp:ControlParameter ControlID="checkStatus" Name="cbStatus" PropertyName="Checked" Type="Boolean" />
                    <asp:ControlParameter ControlID="dtInicio" Name="dtInicial" PropertyName="Text" Type="DateTime" />
                    <asp:ControlParameter ControlID="dtFim" Name="dtFinal" PropertyName="Text" Type="DateTime" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
