function BuscarClinica() {

    RemoverMascaras();
    var cnpj = $("#tbcnpj").val();

    var obj = { cnpj}

    var url = "Autocadastro.aspx/GetClinica";
        $.ajax({
            type: "POST",
            url: url,
            data: JSON.stringify(obj),
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
            },
            success: function (result) {
                if (result.d === null) {
                    $("#lbApelidoClinica").text("Clínica não encontrada!");
                }
                else {
                    $("#lbApelidoClinica").text(result.d["ccApelido"]);
                }
                console.log(result.d);
                AdicionarMascaras();
            }
        });
}

function AddClinica() {
    RemoverMascaras();
    var cnpj = $("#tbcnpj").val();
    var token = $("#hdToken").val();
    var clinica = $("#lbApelidoClinica").text();
    var obj = { cnpj, token }

    var url = "Autocadastro.aspx/AddClinicaProfissional";
    $.ajax({
        type: "POST",
        url: url,
        data: JSON.stringify(obj),
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        },
        success: function (result) {
            if ($("#gvClinicas").val() != undefined) {
                $("#gvClinicas").append("<tr><td>" + clinica + "</td></tr >");
                console.log(result.d);
                AdicionarMascaras();
            }
            else {

            }
        }
    });
};