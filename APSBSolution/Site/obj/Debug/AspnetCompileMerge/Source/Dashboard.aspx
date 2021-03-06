<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Site.Dash" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
    <link href="../assets/css/material-dashboard.css?v=2.1.2" rel="stylesheet" />
    <div class="row">
        <div class="col-md-3">
            <div class="card card-chart">
                <div class="card-header card-header-success">
                    <div class="ct-chart" id="ChartFatBruto"></div>
                </div>
                <div class="card-body">
                    <h4 class="card-title">Faturamento bruto</h4>
                    <p class="card-category">
                        Notas fiscais emitidas.
                    </p>
                </div>
                <div class="card-footer">
                    <div class="stats">
                        <%--<i class="material-icons">access_time</i> updated 4 minutes ago--%>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card card-chart">
                <div class="card-header card-header-warning">
                    <div class="ct-chart" id="ChartFatEfetivo"></div>
                </div>
                <div class="card-body">
                    <h4 class="card-title">Faturamento efetivado</h4>
                    <p class="card-category">(Notas fiscais recebidas)</p>
                </div>
                <div class="card-footer">
                    <div class="stats">
                        <%--<i class="material-icons">access_time</i> campaign sent 2 days ago--%>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card card-chart">
                <div class="card-header card-header-danger">
                    <div class="ct-chart" id="ChartRecBruta"></div>
                </div>
                <div class="card-body">
                    <h4 class="card-title">Receita bruta</h4>
                    <p class="card-category">(Taxa dos associados)</p>
                </div>
                <div class="card-footer">
                    <div class="stats">
                        <%--<i class="material-icons">access_time</i> campaign sent 2 days ago--%>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card card-chart">
                <div class="card-header card-header-info">
                    <div class="ct-chart" id="ChartRecLiq"></div>
                </div>
                <div class="card-body">
                    <h4 class="card-title">Receita líquida</h4>
                    <p class="card-category">(RB - Impostos)</p>
                </div>
                <div class="card-footer">
                    <div class="stats">
                        <%--<i class="material-icons">access_time</i> campaign sent 2 days ago--%>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-3">
            <div class="card card-chart">
                <div class="card-header card-header-success">
                    <div class="ct-chart" id="ChartDespesas"></div>
                </div>
                <div class="card-body">
                    <h4 class="card-title">Despesas</h4>
                    <%--<p class="card-category">...</p>--%>
                </div>
                <div class="card-footer">
                    <div class="stats">
                        <%--<i class="material-icons">access_time</i> updated 4 minutes ago--%>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card card-chart">
                <div class="card-header card-header-warning">
                    <div class="ct-chart" id="ChartNotas"></div>
                </div>
                <div class="card-body">
                    <h4 class="card-title">Qtd Notas emitidas</h4>
                    <%--<p class="card-category">...</p>--%>
                </div>
                <div class="card-footer">
                    <div class="stats">
                        <%-- <i class="material-icons">access_time</i> campaign sent 2 days ago--%>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6 col-sm-6">
            <div class="card card-stats">
                <div class="card-header card-header-info card-header-icon">
                    <div class="card-icon">
                        <i class="material-icons">attach_money</i>
                    </div>
                    <p class="card-category">Repasses pendentes</p>
                    <h3 class="card-title" runat="server" id="hrp"></h3>
                </div>
                <div class="card-footer">
                    <div class="stats">
                        <%--<i class="material-icons">update</i>atualizado às 20:28--%>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6 col-sm-6">
            <div class="card card-stats">
                <div class="card-header card-header-warning card-header-icon">
                    <div class="card-icon">
                        <i class="material-icons">attach_money</i>
                    </div>
                    <p class="card-category">Faturamento pendente</p>
                    <h3 class="card-title" runat="server" id="hfp">0.5M</h3>
                </div>
                <div class="card-footer">
                    <div class="stats">
                        <%--<i class="material-icons">update</i>atualizado às 20:28--%>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-6 col-md-12">
            <div class="card">
                <div class="card-header card-header-success">
                    <h4 class="card-title">Top 10 Faturamento Bruto</h4>
                    <%--<p class="card-category">New employees on 15th September, 2016</p>--%>
                </div>
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
        </div>

        <div class="col-lg-6 col-md-12">
            <div class="card">
                <div class="card-header card-header-info">
                    <h4 class="card-title">Top 10 Receita Líquida</h4>
                    <%--<p class="card-category">New employees on 15th September, 2016</p>--%>
                </div>
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
        </div>
    </div>

    <!-- Site content goes here !-->
    <script src="assets/js/plugins/chartist.min.js"></script>
    <script src="Scripts/Operacoes/Dashboard.js"></script>

</asp:Content>
