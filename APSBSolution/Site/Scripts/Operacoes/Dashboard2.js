google.charts.load('current', { 'packages': ['corechart'] });
google.charts.setOnLoadCallback(drawVisualization);

var data = null;

$(document).ready(function () {
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

    var options = {
        title: 'Faturamento Mensal',
        titleposition: 'center',
        seriesType: 'line',

        series: { 0: { color: 'green' }, 1: { color: 'orange' }, 2: { type: 'bars', color: 'green' }, 3: { type: 'bars', color: 'orange' } },
        legend: { position: 'bottom' }
    };

    var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
    chart.draw(dados, options);
};
