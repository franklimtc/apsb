function SalvarRelacao() {

    $.ajax({
        type: "POST",
        url: "Clinicas.aspx/OnSubmit",
        //data: dataValue,
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        },
        success: function (result) {
            alert("We returned: " + result.d);
        }
    });
}