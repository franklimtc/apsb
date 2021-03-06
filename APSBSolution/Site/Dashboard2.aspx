<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dashboard2.aspx.cs" Inherits="Site.Dashboard2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
    <link href="../assets/css/material-dashboard.css?v=2.1.2" rel="stylesheet" />

    <%--Faturamento do mês atual--%>
    <div class="row">
        <div class="col-lg-3 col-md-6 col-sm-6">
            <div class="card card-stats">
                <div class="card-header card-header-success card-header-icon">
                    <div class="card-icon">
                        <%--<i class="material-icons">attach_money</i>--%>
                        <asp:Image ImageUrl="~/Content/Icons/brazil-real-symbol.svg" runat="server" Height="2.5em" />
                    </div>
                    <p class="card-category">Faturamento Bruto</p>
                    <h3 id="lbFatBruto" runat="server" class="card-title money"></h3>
                </div>
                <div class="card-footer">
                    <div class="stats">
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6 col-sm-6">
            <div class="card card-stats">
                <div class="card-header card-header-warning card-header-icon">
                    <div class="card-icon">
                        <asp:Image ImageUrl="~/Content/Icons/brazil-real-symbol.svg" runat="server" Height="2.5em" />
                    </div>
                    <p class="card-category">Faturamento Líquido</p>
                    <h3 id="lbFatLiquido" runat="server" class="card-title">100.000,00</h3>
                </div>
                <div class="card-footer">
                    <div class="stats">
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6 col-sm-6">
            <div class="card card-stats">
                <div class="card-header card-header-success card-header-icon">
                    <div class="card-icon">
                        <asp:Image ImageUrl="~/Content/Icons/brazil-real-symbol.svg" runat="server" Height="2.5em" />
                    </div>
                    <p class="card-category">Receita Bruta</p>
                    <h3 id="lbRecBruta" runat="server" class="card-title">100.000,00</h3>
                </div>
                <div class="card-footer">
                    <div class="stats">
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6 col-sm-6">
            <div class="card card-stats">
                <div class="card-header card-header-warning card-header-icon">
                    <div class="card-icon">
                        <asp:Image ImageUrl="~/Content/Icons/brazil-real-symbol.svg" runat="server" Height="2.5em" />
                    </div>
                    <p class="card-category">Receita Líquida</p>
                    <h3 id="lbRecLiquida" runat="server" class="card-title">100.000,00</h3>
                </div>
                <div class="card-footer">
                    <div class="stats">
                    </div>
                </div>
            </div>
        </div>
    </div>


    <%--Faturamento Histórico--%>

    <%--Gráfico Geral com todos os parâmetros
    <div class="row">
        <div class="col">
            <div class="card">
                <div class="card-header">
                    <div id="chart_div" style="width: 100%; height: 400px;"></div>
                </div>
            </div>
        </div>
    </div>
    --Gráfico Geral com todos os parâmetros--%>

    <%--Gráficos Individuais--%>

    <div class="row">
        <div class="col"><div id="chart_FatBruto" style="width: 100%; height: 300px;"></div></div>
        <div class="col"><div id="chart_FatLiquido" style="width: 100%; height: 300px;"></div></div>
    </div>
    <p></p>
    <div class="row">
        <div class="col"><div id="chart_RecBruta" style="width: 100%; height: 300px;"></div></div>
        <div class="col"><div id="chart_RecLiquida" style="width: 100%; height: 300px;"></div></div>
    </div>
     <%--Gráficos Individuais--%>


     <div class="row">
        <div class="col-lg-6 col-md-12">
            <div class="card collapse" id="cardFatBrutoAcumulado">
                <%--<div class="card-header card-header-success">--%>
                    <input type="button" name="name" value="Top 10 Faturamento Bruto (Acumulado)" class="card-header card-header-success" onclick="return MudarTop10AcuMes()" style="width: 95%; border-style: none;" />
                    <%--<button onclick="MudarTop10()"><h4 class="card-title">Top 10 Faturamento Bruto (Acumulado)</h4></button>--%>
                <%--</div>--%>
                <div class="card-body table-responsive">
                    <asp:GridView runat="server" ID="gvFatBruto" DataSourceID="dsResumoFaturamento" AutoGenerateColumns="False" CssClass="table table-hover" HeaderStyle-CssClass="text-success">
                        <Columns>
                            <asp:BoundField DataField="nome" HeaderText="Clínica" SortExpression="nome" />
                            <asp:BoundField DataField="cvValor" HeaderText="Valor" ReadOnly="True" SortExpression="cvValor" DataFormatString="{0:C}" />
                            <asp:BoundField DataField="UltimoPagamento" HeaderText="Último Pagamento" ReadOnly="True" SortExpression="UltimoPagamento" DataFormatString="{0:d}" />
                        </Columns>

                    </asp:GridView>
                    <asp:SqlDataSource runat="server" ID="dsResumoFaturamento" ConnectionString="<%$ ConnectionStrings:Dados %>" SelectCommand="SEL_Faturamento10" SelectCommandType="StoredProcedure" />
                </div>
            </div>

            <div class="card collapse" id="cardFatBrutoMes">
                <%--<div class="card-header card-header-success">
                    <h4 class="card-title">Top 10 Faturamento Bruto (Mensal)</h4>
                </div>--%>
                <input type="button" name="name" value="Top 10 Faturamento Bruto (Mensal)" class="card-header card-header-success card-title" onclick="return MudarTop10MesAcu()" style="width: 95%; border-style: none;" />
                <div class="card-body table-responsive">
                    <asp:GridView runat="server" ID="GridView1" DataSourceID="dsResumoFaturamentoMes" AutoGenerateColumns="False" CssClass="table table-hover" HeaderStyle-CssClass="text-success">
                        <Columns>
                            <asp:BoundField DataField="nome" HeaderText="Clínica" SortExpression="nome" />
                            <asp:BoundField DataField="cvValor" HeaderText="Valor" ReadOnly="True" SortExpression="cvValor" DataFormatString="{0:C}" />
                            <asp:BoundField DataField="UltimoPagamento" HeaderText="Último Pagamento" ReadOnly="True" SortExpression="UltimoPagamento" DataFormatString="{0:d}" />
                        </Columns>

                    </asp:GridView>
                    <asp:SqlDataSource runat="server" ID="dsResumoFaturamentoMes" ConnectionString="<%$ ConnectionStrings:Dados %>" SelectCommand="SEL_Faturamento10" SelectCommandType="StoredProcedure" >
                        <SelectParameters>
                            <asp:Parameter DefaultValue="0" Name="cbAcumulado " />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>

        <div class="col-lg-6 col-md-12">
            <div class="card collapse" id="cardRecLiqAcumulada">
                <input type="button" name="name" value="Top 10 Receita Líquida (Acumulada)" class="card-header card-header-info card-title" onclick="return MudarTop10ReceitaAcuMes()" style="width: 95%; border-style: none;" />
              <%--  <div class="card-header card-header-info">
                    <h4 class="card-title">Top 10 Receita Líquida (Acumulada)</h4>
                    <%--<p class="card-category">New employees on 15th September, 2016</p>
                </div>--%>
                <div class="card-body table-responsive">
                    <asp:GridView runat="server" ID="gvReceitaLiquida" DataSourceID="dsResumoReceita" AutoGenerateColumns="False" CssClass="table table-hover" HeaderStyle-CssClass="text-info">
                        <Columns>
                            <asp:BoundField DataField="nome" HeaderText="Médico" SortExpression="nome" />
                            <asp:BoundField DataField="cvValor" HeaderText="Valor" ReadOnly="True" SortExpression="cvValor" DataFormatString="{0:C}" />
                            <asp:BoundField DataField="UltimoRepasse" HeaderText="Último Repasse" ReadOnly="True" SortExpression="UltimoRepasse" DataFormatString="{0:d}" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource runat="server" ID="dsResumoReceita" ConnectionString="<%$ ConnectionStrings:Dados %>" SelectCommand="SEL_Repasse10" SelectCommandType="StoredProcedure" />
                </div>
            </div>

            <div class="card collapse" id="cardRecLiqMes">
                <%--<div class="card-header card-header-info">
                    <h4 class="card-title">Top 10 Receita Líquida (Mensal)</h4>
                   
                </div>--%>
                <input type="button" name="name" value="Top 10 Receita Líquida (Mensal)" class="card-header card-header-info card-title" onclick="return MudarTop10ReceitaMesAcu()" style="width: 95%; border-style: none;" />
                <div class="card-body table-responsive">
                    <asp:GridView runat="server" ID="GridView2" DataSourceID="dsResumoReceitaMes" AutoGenerateColumns="False" CssClass="table table-hover" HeaderStyle-CssClass="text-info">
                        <Columns>
                            <asp:BoundField DataField="nome" HeaderText="Médico" SortExpression="nome" />
                            <asp:BoundField DataField="cvValor" HeaderText="Valor" ReadOnly="True" SortExpression="cvValor" DataFormatString="{0:C}" />
                            <asp:BoundField DataField="UltimoRepasse" HeaderText="Último Repasse" ReadOnly="True" SortExpression="UltimoRepasse" DataFormatString="{0:d}" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource runat="server" ID="dsResumoReceitaMes" ConnectionString="<%$ ConnectionStrings:Dados %>" SelectCommand="SEL_Repasse10" SelectCommandType="StoredProcedure" >
                        <SelectParameters>
                            <asp:Parameter DefaultValue="0" Name="cbAcumulado" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
    </div>
   
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script src="Scripts/Operacoes/Dashboard2.js"></script>
    <script src="Scripts/jquery.number.js"></script>
    
    <script>
        $(document).ready(function () {
            $("#cardFatBrutoAcumulado").collapse("show");
            $("#cardRecLiqAcumulada").collapse("show");
        });

        function MudarTop10AcuMes() {
            $("#cardFatBrutoAcumulado").collapse("hide");
            $("#cardFatBrutoMes").collapse("show");
            return false;
        };
        function MudarTop10MesAcu() {
            $("#cardFatBrutoAcumulado").collapse("show");
            $("#cardFatBrutoMes").collapse("hide");
            return false;
        };

        function MudarTop10ReceitaAcuMes() {
            $("#cardRecLiqAcumulada").collapse("hide");
            $("#cardRecLiqMes").collapse("show");
            return false;
        };

        function MudarTop10ReceitaMesAcu() {
            $("#cardRecLiqAcumulada").collapse("show");
            $("#cardRecLiqMes").collapse("hide");
            return false;
        };
    </script>
</asp:Content>
