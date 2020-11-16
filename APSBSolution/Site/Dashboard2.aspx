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
                    <h3 id="MainContent_hrp" class="card-title">1.000.000,00</h3>
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
                    <h3 id="MainContent_hrp" class="card-title">100.000,00</h3>
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
                    <h3 id="MainContent_hrp" class="card-title">100.000,00</h3>
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
                    <h3 id="MainContent_hrp" class="card-title">100.000,00</h3>
                </div>
                <div class="card-footer">
                    <div class="stats">
                    </div>
                </div>
            </div>
        </div>
    </div>


    <%--Faturamento Histórico--%>

    <div class="row">
        <div class="col">
            <div class="card">
                <div class="card-header">
                    <div id="chart_div" style="width: 100%; height: 400px;"></div>

                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load('current', { 'packages': ['corechart'] });
        google.charts.setOnLoadCallback(drawVisualization);

        function drawVisualization() {
            // Some raw data (not necessarily accurate)
            var data = google.visualization.arrayToDataTable([
                ['Mês', 'Fat Bruto', 'Fat Liquido', 'Rec Bruta', 'Rec Liquida'],
                ['Jan', 100000, 80000, 20000, 19000],
                ['Fev', 150000, 120000, 20000, 19000],
                ['Mar', 100000, 80000, 20000, 19000],
                ['Mai', 150000, 120000, 20000, 19000],
                ['Jun', 100000, 80000, 20000, 19000],
                ['Jul', 150000, 120000, 20000, 19000],
                ['Ago', 100000, 80000, 20000, 19000],
                ['Set', 150000, 120000, 20000, 19000],
                ['Out', 100000, 80000, 20000, 19000],
                ['Nov', 150000, 120000, 20000, 19000],
                ['Dez', 100000, 80000, 20000, 19000]
            ]);

            var options = {
                title: 'Faturamento Mensal',
                titleposition: 'center',
                seriesType: 'line',

                series: { 0: { color: 'green' }, 1: { color: 'orange' }, 2: { type: 'bars', color: 'green' }, 3: { type: 'bars', color: 'orange' } },
                legend: { position: 'bottom' }
            };

            var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
            chart.draw(data, options);
        }
    </script>
</asp:Content>
