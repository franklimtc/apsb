google.charts.load('current', { 'packages': ['corechart'] });
google.charts.setOnLoadCallback(drawVisualization);

var data = null;

$(document).ready(function () {
    $("#MainContent_lbFatBruto").text($.number($("#MainContent_lbFatBruto").text()));
    $("#MainContent_lbFatLiquido").text($.number($("#MainContent_lbFatLiquido").text()));
    $("#MainContent_lbRecBruta").text($.number($("#MainContent_lbRecBruta").text()));
    $("#MainContent_lbRecLiquida").text($.number($("#MainContent_lbRecLiquida").text()));

    $.ajax({
        type: "POST",
        url: "Dashboard2.aspx/GetChartGeral",
        data: "",
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        },
        success: function (result) {

            data = result.d;
            drawVisualization();
          
        }
    });
}
);

function drawVisualization() {

    var dados = google.visualization.arrayToDataTable(data);
    var FatBrutoView = new google.visualization.DataView(dados);
    var FatLiquidoView = new google.visualization.DataView(dados);
    var RecBrutoView = new google.visualization.DataView(dados);
    var RecLiquidaView = new google.visualization.DataView(dados);

    FatBrutoView.setColumns([0, 1,
        {
            calc: "stringify",
            sourceColumn: 1,
            type: "string",
            role: "annotation"
        }]);

    FatLiquidoView.setColumns([0, 2,
        {
            calc: "stringify",
            sourceColumn: 2,
            type: "string",
            role: "annotation"
        }]);

    RecBrutoView.setColumns([0, 3,
        {
            calc: "stringify",
            sourceColumn: 3,
            type: "string",
            role: "annotation"
        }]);

    RecLiquidaView.setColumns([0, 4,
        {
            calc: "stringify",
            sourceColumn: 4,
            type: "string",
            role: "annotation"
        }]);


    var options = {
        title: 'Faturamento Mensal',
        titleposition: 'center',
        seriesType: 'line',

    };

    var optionsFatBruto = {
        title: 'Faturamento Bruto',
        titleposition: 'center',
        seriesType: 'bars',
        series: {0: { color: 'green' }},
        legend: { position: 'none' }
    };

    var optionsFatLiquido = {
        title: 'Faturamento Líquido',
        titleposition: 'center',
        seriesType: 'bars',
        series: { 0: { color: 'orange' } },
        legend: { position: 'none' }
    };

    var optionsRecBruta = {
        title: 'Receita Bruta',
        titleposition: 'center',
        seriesType: 'bars',
        series: { 0: { color: 'green' } },
        legend: { position: 'none' }
    };

    var optionsRecLiquida = {
        title: 'Receita Líquida',
        titleposition: 'center',
        seriesType: 'bars',
        series: { 0: { color: 'orange' } },
        legend: { position: 'none' }
    };

    var chart1 = new google.visualization.ComboChart(document.getElementById('chart_FatBruto'));
    chart1.draw(FatBrutoView, optionsFatBruto);

    var chart2 = new google.visualization.ComboChart(document.getElementById('chart_FatLiquido'));
    chart2.draw(FatLiquidoView, optionsFatLiquido);

    var chart3 = new google.visualization.ComboChart(document.getElementById('chart_RecBruta'));
    chart3.draw(RecBrutoView, optionsRecBruta);

    var chart4 = new google.visualization.ComboChart(document.getElementById('chart_RecLiquida'));
    chart4.draw(RecLiquidaView, optionsRecLiquida);

};

//function drawVisualization() {
   
//    var dados = google.visualization.arrayToDataTable(data);

//    var options = {
//        title: 'Faturamento Mensal',
//        titleposition: 'center',
//        seriesType: 'line',

//        series: { 0: { color: 'green' }, 1: { color: 'orange' }, 2: { type: 'bars', color: 'green' }, 3: { type: 'bars', color: 'orange' } },
//        legend: { position: 'bottom' }
//    };

//    var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
//    chart.draw(dados, options);
//};

