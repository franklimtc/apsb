$(document).ready(function () {
    
    $.ajax({
        type: "POST",
        url: "Dashboard.aspx/getChartfb",
        data: "",
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        },
        success: function (result) {
            new Chartist.Bar('#ChartFatBruto', {
                labels: result.d.labels,
                series: [
                   result.d.data
                ]
            }, {
                fullWidth: true,
                chartPadding: {
                    right: 40
                }
            });
        }
    });

    $.ajax({
        type: "POST",
        url: "Dashboard.aspx/getChartfl",
        data: "",
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        },
        success: function (result) {
            new Chartist.Bar('#ChartFatEfetivo', {
                labels: result.d.labels,
                series: [
                    result.d.data
                ]
            }, {
                fullWidth: true,
                chartPadding: {
                    right: 40
                }
            });
        }
    });

    $.ajax({
        type: "POST",
        url: "Dashboard.aspx/getChartrb",
        data: "",
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        },
        success: function (result) {
            new Chartist.Bar('#ChartRecBruta', {
                labels: result.d.labels,
                series: [
                    result.d.data
                ]
            }, {
                fullWidth: true,
                chartPadding: {
                    right: 40
                }
            });
        }
    });

    $.ajax({
        type: "POST",
        url: "Dashboard.aspx/getChartrl",
        data: "",
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        },
        success: function (result) {
            new Chartist.Bar('#ChartRecLiq', {
                labels: result.d.labels,
                series: [
                    result.d.data
                ]
            }, {
                fullWidth: true,
                chartPadding: {
                    right: 40
                }
            });
        }
    });

    $.ajax({
        type: "POST",
        url: "Dashboard.aspx/getChartDes",
        data: "",
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        },
        success: function (result) {
            new Chartist.Bar('#ChartDespesas', {
                labels: result.d.labels,
                series: [
                    result.d.data
                ]
            }, {
                fullWidth: true,
                chartPadding: {
                    right: 40
                }
            });
        }
    });

    $.ajax({
        type: "POST",
        url: "Dashboard.aspx/getChartNFs",
        data: "",
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        },
        success: function (result) {
            new Chartist.Bar('#ChartNotas', {
                labels: result.d.labels,
                series: [
                    result.d.data
                ]
            }, {
                fullWidth: true,
                chartPadding: {
                    right: 40
                }
            });
        }
    });


});

