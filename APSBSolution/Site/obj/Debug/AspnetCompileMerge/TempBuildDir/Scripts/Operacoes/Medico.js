function AdicionarBanco() {


    var idbanco = $("#MainContent_dpProfissionalBanco").children("option:selected").val();
    var _nomeBanco = $("#MainContent_dpProfissionalBanco").children("option:selected").text();
    var _agencia = $("#MainContent_tbAgencia").val();
    var _conta = $("#MainContent_tbConta").val();
    var _operacao = $("#MainContent_tbOperacao").val();
    var _idMedico = $("#MainContent_idHiddenMedico").val();

    var url = "Medicos.aspx/AdicionarBanco";
    var gridview = "#MainContent_gvProfissionalBanco";
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
                    $(gridview).append("<tr><td>add</td><td>" + _nomeBanco + "</td ><td>" + _agencia + "</td><td>" + _conta + "</td><td>" + _operacao + "</td><td></td></tr >");
                }
                else {
                    alert("Falha ao adicionar o registro");
                }
            }
        });
    }
};

function CarregarModal(_idProfissional) {

    //BuscarPorID(int idProfissional)
    //alert("CarregarModal - " + idProfissional);
    var url = "Medico.aspx/BuscarPorID";

    var relacaoObj = {
        idProfissional: _idProfissional
    };

    $('#idHiddenMedico').val(_idProfissional);
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
            $("#tbNome").val(result.d["ccNome"]);
            $("#dpSexo").val(result.d["ccSexo"]).change();
            $("#dpUFNatural").val(result.d["ccNaturalUF"]).change();
            $("#tbCidade").val(result.d["ccNaturalCidade"]);
            $("#tbPai").val(result.d["nomePai"]);
            $("#tbMae").val(result.d["nomeMae"]);
            $("#tbConjuge").val(result.d["nomeConjuge"]);
            $("#tbRGNum").val(result.d["RGNum"]);
            $("#tbRGEmissor").val(result.d["RGEmissor"]);
            $("#tbRGdata").val(ConvertDate(result.d["RGdtEmissao"]));
            $("#tbCPF").val(("0000" + result.d["CPFNum"]).slice(-11));
            $("#tbCPF").mask("000.000.000-00")
            $("#tbCNH").val(result.d["cvCNH"]);
            $("#tbEmail").val(result.d["ccEmail"]);
            $("#tbFone").val(result.d["cvTelefone"]);
            $("#tbCelular").val(result.d["cvCelular"]);
            $("#tbDtFiliacao").val(ConvertDate(result.d["cdFiliacao"]));
            $("#tbDtPagamento").val(ConvertDate(result.d["cdPgtoTaxa"]));
            $("#tbDtRegCartorio").val(ConvertDate(result.d["cdRegCartorio"]));
            $("#tbdtNascimento").val(ConvertDate(result.d["dtNascimento"]));
            $("#tbObs").val(result.d["Observacoes"]);
            $("#medicoModal").modal("show");
            AdicionarMascaras();
        }
    });
};

function CarregarModalProfissional(_idProfissional) {

    var url = "Medicos.aspx/BuscarDadosID";

    var relacaoObj = {
        idProfissional: _idProfissional
    };

    $('#MainContent_idHiddenMedico').val(_idProfissional);
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
            console.log(result.d);
            if (result.d != null) {
                var IdDadoProfissional = result.d["IdDadoProfissional"];
                $("#idHiddenProfissionalDado").val(IdDadoProfissional);
                $("#MainContent_tbFormacao").val(result.d["ccFormacao"]);
                $("#MainContent_dpEspecialidade").val(result.d["ccEspecialidade"]).change();
                $("#MainContent_tbPosGraduacao").val(result.d["ccPosGraduacao"]);
                $("#MainContent_tbConselhoRegional").val(result.d["ccConselho"]);
                $("#MainContent_tbNumInscricaoConselho").val(result.d["cvNumInscricao"]);
                $("#MainContent_tbTituloEleitor").val(result.d["cvTitulo"]);
                $("#MainContent_tbZonaEleitor").val(result.d["cvTituloZona"]);
                $("#MainContent_tbSecaoEleitor").val(result.d["cvTituloSecao"]);
                $("#MainContent_tbReservista").val(result.d["cvReservista"]);
                $("#MainContent_tbPisPasep").val(result.d["cvPIS"]);

                AdicionarMascaras();
            } else {
                ResetForm();
            }
            $("#profissionalModal").modal("show");
        }
    });
    
};

