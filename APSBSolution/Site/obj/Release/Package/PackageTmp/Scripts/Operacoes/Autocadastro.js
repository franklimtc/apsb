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
                    $("#btAddCNPJ").removeAttr("disabled");
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
            alert("Falha ao adicionar clínica. Procure o administrador!");
        },
        success: function (result) {
            if ($("#gvClinicas").val() != undefined) {
                $("#gvClinicas").append("<tr><td>" + clinica + "</td></tr >");
                AdicionarMascaras();
            }
            else {
                $("#divgvClinicas").append("<table id='gvClinicas' class='table table-hover table-striped table-sm'><tbody><tr><th>Clínica</th></tr><tr><td>" + clinica+"</td></tr></tbody></table>");
            }
            $("#btAddCNPJ").attr("disabled", true);
        }
    });
};

function AdicionarBancoAuto() {


    var idbanco = $("#MainContent_dpProfissionalBanco").children("option:selected").val();
    var _nomeBanco = $("#MainContent_dpProfissionalBanco").children("option:selected").text();
    var _agencia = $("#MainContent_tbAgencia").val();
    var _conta = $("#MainContent_tbConta").val();
    var _operacao = $("#MainContent_tbOperacao").val();
    var _idMedico = $("#MainContent_idHiddenMedico").val();

    var url = "Medicos.aspx/AdicionarBanco";
    if (idbanco === undefined) {
        idbanco = $("#dpProfissionalBanco").children("option:selected").val();
        _nomeBanco = $("#dpProfissionalBanco").children("option:selected").text();
        _agencia = $("#tbAgencia").val();
        _conta = $("#tbConta").val();
        _operacao = $("#tbOperacao").val();
        _idMedico = $("#idHiddenMedico").val();

        url = "Autocadastro.aspx/AdicionarBanco";
        gridview = "#gvProfissionalBanco";
    }

    var relacaoObj = {
        _idProfissional: _idMedico
        , ccAgencia: _agencia
        , ccConta: _conta
        , ccOperacao: _operacao
        , _idBanco: idbanco
    };

    if (_conta === "" || _agencia === "") {
        alert("Informe agência e conta!");
    }
    else {
        $.ajax({
            type: "POST",
            url: url,
            data: JSON.stringify(relacaoObj),
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
            },
            success: function (result) {
                //alert("Registro adicionado com sucesso");
                if (result.d === true) {
                    //CarregarModalBanco(_idMedico);
                    $("#gvProfissionalBanco > tbody").append("<tr><td>Novo</td><td>" + _nomeBanco + "</td><td>" + _agencia + "</td><td>" + _conta + "</td><td>" + _operacao +"</td><td></td></tr>")
                }
                else {
                    alert("Falha ao adicionar o registro");
                }
            }
        });
    }
};


