<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="dash.aspx.cs" Inherits="Site.dash" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        body {
            background-color: black;
        }

        .card-header {
            margin: 0px 5px 0;
            border-bottom: none;
            border-radius: 3px;
            margin-top: -10px;
            padding: 15px;
            color: white;
        }

        .card-header-success {
            background: linear-gradient(60deg, #66bb6a, #43a047);
        }

        .card-header-warning {
            background: linear-gradient(60deg, #ffa726, #fb8c00);
        }

        .card-header-danger {
            background: linear-gradient(60deg, #ef5350, #e53935);
        }

        .card-header-info {
            background: linear-gradient(60deg, #26c6da, #00acc1);
        }
        span {
            color: #999999;
            font-size: .875rem;
        }
    </style>

    <div class="row">
        <div class="col">
            <div class="card">
                <div class="card-header card-header-success">
                    <canvas id="ChartFatBruto" height="200"></canvas>
                </div>
                <div class="card-body">
                    <h5 class="card-title">Faturamento Bruto</h5>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card">
                <div class="card-header card-header-warning">
                    <canvas id="ChartFatEfetivo" height="200"></canvas>
                </div>
                <div class="card-body">
                    <h5 class="card-title">Faturamento Efetivado</h5>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card">
                <div class="card-header card-header-danger">
                    <canvas id="ChartRecBruto" height="200"></canvas>
                </div>
                <div class="card-body">
                    <h5 class="card-title">Receita bruta</h5>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card">
                <div class="card-header card-header-info">
                    <canvas id="ChartRecEfetiva" height="200"></canvas>
                </div>
                <div class="card-body">
                    <h5 class="card-title">Receita Líquida</h5>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="Scripts/ChartJS/Chart.min.js"></script>
    <script>
        var ctxBruto = document.getElementById('ChartFatBruto');
        var cBruto = new Chart(ctxBruto, {
            type: 'line',
            data: {
                labels: ['S', 'T', 'Q', 'Q', 'S'],
                datasets: [{
                    data: [28000, 10000, 10941, 12141, 11000],
                    borderColor: ['rgba(255, 255, 255, 1)'],
                    borderWidth: 2
                }]
            },
            options: {
                legend: {
                    display: false
                },
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                }
            }
        });

        var ctxEfetivo = document.getElementById('ChartFatEfetivo');
        var cEfetivo = new Chart(ctxEfetivo, {
            type: 'bar',
            data: {
                labels: ['S', 'T', 'Q', 'Q', 'S'],
                datasets: [{
                    data: [28000, 10000, 10941, 12141, 11000],
                    backgroundColor: 'rgba(255, 255, 255, 0.5)'
                }]
            },
            options: {
                legend: {
                    display: false
                },
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                }
            }
        });

        //ChartRecEfetiva

        var ctxrEfetivo = document.getElementById('ChartRecBruto');
        var crEfetivo = new Chart(ctxrEfetivo, {
            type: 'line',
            data: {
                labels: ['S', 'T', 'Q', 'Q', 'S'],
                datasets: [{
                    data: [28000, 10000, 10941, 12141, 11000],
                    borderColor: ['rgba(255, 255, 255, 1)'],
                    borderWidth: 2
                }]
            },
            options: {
                legend: {
                    display: false
                },
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                }
            }
        });

        //ChartRecBruto

        var ctxrBruta = document.getElementById('ChartRecEfetiva');
        var crEBruta = new Chart(ctxrBruta, {
            type: 'bar',
            data: {
                labels: ['S', 'T', 'Q', 'Q', 'S'],
                datasets: [{
                    data: [28000, 10000, 10941, 12141, 11000],
                    data: [28000, 10000, 10941, 12141, 11000],
                    backgroundColor: 'rgba(255, 255, 255, 0.5)'
                }]
            },
            options: {
                legend: {
                    display: false
                },
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                }
            }
        });


    </script>
</asp:Content>
