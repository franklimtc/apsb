function SalvarRelacao() {
    var _idClinica = $("#MainContent_idHiddenClinica").val();
    var _nomeProfissional = $("#dpProfissional2").val();
    var _idProfissional = $("#MainContent_HiddenProfissionalID").val();
    var _Usuario = $("#MainContent_HiddenUser").val().substring(0, $("#MainContent_HiddenUser").val().indexOf("@"));

    var _taxa = $("#MainContent_tbValorRepasse").val();
    var _obs = $("#MainContent_tbObsProfissional").val();

    //Validar Taxa

    _taxa = _taxa.replace(",", ".");

    if (isNaN(parseFloat(_taxa))) {
        alert("Informe um valor válido para taxa!");
    } else {
        if (_nomeProfissional !== "Selecionar...") {
            var relacaoObj = {
                idClinica: _idClinica
                , idProfissional: _idProfissional
                , taxa: _taxa
                , observacao: _obs
                , user: _Usuario
            };

            $.ajax({
                type: "POST",
                url: "Clinicas.aspx/SalvarRelacao",
                data: JSON.stringify(relacaoObj),
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                error: function () {
                    alert("Falha na operação! Informe os dados a seguir para o administrador: " + JSON.stringify(relacaoObj));
                },
                success: function (result) {
                    //alert("Registro adicionado com sucesso");
                    if (result.d === true) {
                        $("#MainContent_gvProfissionalClinica").append("<tr><td></td><td>" + _nomeProfissional + "</td><td>" + _taxa + "</td><td>Adicionado</td><td>" + _obs + "</td><td></td></tr>");
                    }
                    else {
                        alert("Falha ao adicionar o registro");
                    }
                }
            });
        } else {
            alert("Selecione um profissional!");
        }
    }
}

$("#MainContent_tbClinicaISS").focusout(function () {
    var valor = $("#MainContent_tbClinicaISS").val();

    if (valor.includes(".")) {
        valor = valor.replace(".", ",");
    };

    if (!$.isNumeric(valor.replace(",", "."))){
        $("#MainContent_tbClinicaISS").val("")
    } else {
        $("#MainContent_tbClinicaISS").val(valor);
    };
});


$("#MainContent_tbDescontos").focusout(function () {
    var valor = $("#MainContent_tbDescontos").val();

    if (valor.includes(".")) {
        valor = valor.replace(".", ",");
    };

    if (!$.isNumeric(valor.replace(",", "."))) {
        $("#MainContent_tbDescontos").val("")
    } else {
        $("#MainContent_tbDescontos").val(valor);
    };
});

function CarregarDPProfissionais() {

    $.ajax({
        type: "POST",
        url: "Clinicas.aspx/ListarProfissionalDP",
        data: null,
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: function (result) {
            //alert("Registro adicionado com sucesso");
            //console.log(result.d);
            for (var i = 0; i < result.d.length; i++) {
                $('#dsProfissionais').append("<option value='"+result.d[i].ccNome+"'>");
            }

        }
    });

};

function GetIdProfissionalByName(nome) {
    var relacaoObj = {
        name: nome
    };

    $.ajax({
        type: "POST",
        url: "Clinicas.aspx/GetIdByName",
        data: JSON.stringify(relacaoObj),
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        error: function () {
            //alert("Falha na operação! Informe os dados a seguir para o administrador: " + JSON.stringify(relacaoObj));
            console.log("erro ao capturar id do profissional!");
        },
        success: function (result) {
            //alert("Registro adicionado com sucesso");
            $("#MainContent_HiddenProfissionalID").val(result.d)
        }
    });

};