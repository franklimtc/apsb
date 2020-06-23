function AdicionarBanco() {
    

    var idbanco = $("#MainContent_dpProfissionalBanco").children("option:selected").val();
    var _nomeBanco = $("#MainContent_dpProfissionalBanco").children("option:selected").text();
    var _agencia = $("#MainContent_tbAgencia").val();
    var _conta = $("#MainContent_tbConta").val();
    var _operacao = $("#MainContent_tbOperacao").val();
    var _idMedico = $("#MainContent_idHiddenMedico").val();

    var relacaoObj = {
        _idProfissional: _idMedico
        , ccAgencia: _agencia
        , ccConta: _conta
        , ccOperacao: _operacao
        , _idBanco: idbanco
    };

    $.ajax({
        type: "POST",
        url: "Medicos.aspx/AdicionarBanco",
        data: JSON.stringify(relacaoObj),
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        },
        success: function (result) {
            //alert("Registro adicionado com sucesso");
            if (result.d === true) {
                $("#MainContent_gvProfissionalBanco").append("<tr><td>add</td><td>" + _nomeBanco + "</td ><td>" + _agencia + "</td><td>" + _conta + "</td><td>" + _operacao +"</td><td></td></tr >");
            }
            else {
                alert("Falha ao adicionar o registro");
            }
        }
    });

    
}