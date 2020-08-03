function AdicionarBanco() {


    var idbanco = $("#MainContent_dpProfissionalBanco").children("option:selected").val();
    var _nomeBanco = $("#MainContent_dpProfissionalBanco").children("option:selected").text();
    var _agencia = $("#MainContent_tbAgencia").val();
    var _conta = $("#MainContent_tbConta").val();
    var _operacao = $("#MainContent_tbOperacao").val();
    var _idMedico = $("#idHiddenMedico").val();

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
                    CarregarModalBanco(_idMedico);
                }
                else {
                    alert("Falha ao adicionar o registro");
                }
            }
        });
    }
};

function CarregarModal(_idProfissional) {
    $("#idHiddenMedico").val(_idProfissional);

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
            $("#MainContent_tbNome").val(result.d["ccNome"]);
            $("#MainContent_dpSexo").val(result.d["ccSexo"]).change();
            $("#MainContent_dpUFNatural").val(result.d["ccNaturalUF"]).change();
            $("#MainContent_tbCidade").val(result.d["ccNaturalCidade"]);
            $("#MainContent_tbPai").val(result.d["nomePai"]);
            $("#MainContent_tbMae").val(result.d["nomeMae"]);
            $("#MainContent_tbConjuge").val(result.d["nomeConjuge"]);
            $("#MainContent_tbRGNum").val(result.d["RGNum"]);
            $("#MainContent_tbRGEmissor").val(result.d["RGEmissor"]);
            $("#MainContent_tbRGdata").val(ConvertDate(result.d["RGdtEmissao"]));
            $("#MainContent_tbCPF").val(("0000" + result.d["CPFNum"]).slice(-11));
            $("#MainContent_tbCPF").mask("000.000.000-00")
            $("#MainContent_tbCNH").val(result.d["cvCNH"]);
            $("#MainContent_tbEmail").val(result.d["ccEmail"]);
            $("#MainContent_tbFone").val(result.d["cvTelefone"]);
            $("#MainContent_tbCelular").val(result.d["cvCelular"]);
            $("#MainContent_tbDtFiliacao").val(ConvertDate(result.d["cdFiliacao"]));
            $("#MainContent_tbDtPagamento").val(ConvertDate(result.d["cdPgtoTaxa"]));
            $("#MainContent_tbDtRegCartorio").val(ConvertDate(result.d["cdRegCartorio"]));
            $("#MainContent_tbdtNascimento").val(ConvertDate(result.d["dtNascimento"]));
            $("#MainContent_tbObs").val(result.d["Observacoes"]);
            $("#medicoModal").modal("show");
            RemoverMascaras();
            AdicionarMascaras();
        }
    });
    return false;
};

function CarregarModalProfissional(_idProfissional) {
    $("#idHiddenMedico").val(_idProfissional);

    var url = "Medico.aspx/BuscarDadosID";

    var relacaoObj = {
        idProfissional: _idProfissional
    };

    $('idHiddenMedico').val(_idProfissional);

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
            //console.log(result.d);
            if (result.d != null) {
                var IdDadoProfissional = result.d["IdDadoProfissional"];
                $("#idHiddenProfissionalDado").val(IdDadoProfissional);
                $("#MainContent_tbFormacao").val(result.d["ccFormacao"]);
                //$("#MainContent_dpEspecialidade").val(result.d["ccEspecialidade"]).change();

                $("#MainContent_dpEspecialidade option").filter(function () {
                    return this.text == result.d["ccEspecialidade"];
                }).attr('selected', true);

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
    return false;
};

function CarregarModalEndereco(_idProfissional) {
    $("#idHiddenMedico").val(_idProfissional);

    var url = "Medico.aspx/BuscarEnderecoID";

    var relacaoObj = {
        idProfissional: _idProfissional
    };

    $('idHiddenMedico').val(_idProfissional);

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
            //console.log(result.d);    
           
            if (result.d != null) {
                $("#MainContent_tbEndereço").val(result.d.ccEndereco);
                $("#MainContent_tbBairro").val(result.d.ccBairro);
                $("#MainContent_tbCep").val(result.d.cvCEP);
                $("#MainContent_tbEnderecoCidade").val(result.d.ccCidade);
                $("#MainContent_dpEnderecoUF").val(result.d.ccUF).change();
            }
        }
    });
    $("#moradiaModal").modal("show");
    return false;
};

function SalvarEndereco() {
    alert('Implementar!');
};

function CarregarModalBanco(_idProfissional) {
    $("#idHiddenMedico").val(_idProfissional);

    var url = "Medico.aspx/BuscarBancosID";

    var relacaoObj = {
        idProfissional: _idProfissional
    };

    $('idHiddenMedico').val(_idProfissional);

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
            //console.log(result.d);
            $("#bodyBanco").empty();
            if (result.d.length > 0) {
                for (var i = 0; i < result.d.length; i++) {
                    //console.log(result.d[i]);
                    $("#bodyBanco").append("<tr><td>"
                        + result.d[i].IdProfissionalBanco + "</td><td>"
                        + result.d[i].ccBanco + "</td><td>"
                        + result.d[i].ccAgencia + "</td><td>"
                        + result.d[i].ccConta + "</td><td>"
                        + result.d[i].ccOperacao + "</td><td>"
                        + "<input type='image' class='imgButton' src='../Content/Icons/trash-outline.svg' onclick='return RemoverBanco(" + result.d[i].IdProfissionalBanco+")'/>" + "</td>"
                        + "</tr>");
                }
            }
        }
    });
    $("#bancoModal").modal("show");
    return false;
};

function CarregarModalArquivos(_idProfissional) {
    $("#idHiddenMedico").val(_idProfissional);
    
    var url = "Medico.aspx/BuscararquivosID";

    var relacaoObj = {
        idProfissional: _idProfissional
    };

    $('idHiddenMedico').val(_idProfissional);

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
        }
    });
    $("#arquivosModal").modal("show");
    return false;
};

function RemoverBanco(id) {
    var url = "Medico.aspx/RemoverBanco";
    var user = $("#MainContent_HiddenUser").val().substring(0, $("#MainContent_HiddenUser").val().indexOf("@"));
    var relacaoObj = {
        Usuario: user,
        IdProfissionalBanco: id
    };

    var idMedico = $('#idHiddenMedico').val();
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
            CarregarModalBanco(idMedico);
        }
    });
    return false;
};

function SalvarMedico() {
    alert("Salvando médico!");
};




