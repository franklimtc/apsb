$(document).ready(function () {
    google.charts.load('current', { 'packages': ['corechart'] });
    google.charts.setOnLoadCallback(drawVisualization);

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
           
            //var data = google.visualization.arrayToDataTable(result.d);
            drawVisualization(result.d);
        }
    });
}
)


function drawVisualization(data) {
    // Some raw data (not necessarily accurate)
    //var data = google.visualization.arrayToDataTable(
    //[
    //    ['Mês', 'Fat Bruto', 'Fat Liquido', 'Rec Bruta', 'Rec Liquida'],
    //    ['Jan', 100000, 80000, 20000, 19000],
    //    ['Fev', 150000, 120000, 20000, 19000],
    //    ['Mar', 100000, 80000, 20000, 19000],
    //    ['Mai', 150000, 120000, 20000, 19000],
    //    ['Jun', 100000, 80000, 20000, 19000],
    //    ['Jul', 150000, 120000, 20000, 19000],
    //    ['Ago', 100000, 80000, 20000, 19000],
    //    ['Set', 150000, 120000, 20000, 19000],
    //    ['Out', 100000, 80000, 20000, 19000],
    //    ['Nov', 150000, 120000, 20000, 19000],
    //    ['Dez', 100000, 80000, 20000, 19000]
    //]
    //);

    var data = google.visualization.arrayToDataTable(data);

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
