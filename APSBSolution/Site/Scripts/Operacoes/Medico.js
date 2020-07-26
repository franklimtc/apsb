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
    var url = "Medicos.aspx/BuscarPorID";

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
            //console.log(result.d);
           
            $('#MainContent_tbCPF').val(result.d['CPFNum']);
            $('#MainContent_tbObservacoes').val(result.d['Observacoes']);
            $('#MainContent_tbEmissorRG').val(result.d['RGEmissor']);
            $('#MainContent_tbRG').val(result.d['RGNum']);
            $('#MainContent_RGdtEmissao').val(result.d['RGdtEmissao']);
            $('#MainContent_tbEmail').val(result.d['ccEmail']);
            $('#MainContent_tbCidade').val(result.d['ccNaturalCidade']);
            $('#MainContent_tbNome').val(result.d['ccNome']);
            $("#MainContent_dpEstCivil").val(result.d['ccEstadoCivil']).change();
            $("#MainContent_dpSexo").val(result.d['ccSexo']).change();
            $("#MainContent_dpNaturalidade").val(result.d['ccNaturalUF']).change();
            $('#MainContent_cdFiliacao').val(result.d['cdFiliacao']);
            $('#MainContent_cdPgtoTaxa').val(result.d['cdPgtoTaxa']);
            $('#MainContent_cdRegCartorio').val(result.d['cdRegCartorio']);
            $('#MainContent_tbCelular').val(result.d['cvCelular']);
            $('#MainContent_tbTelefone').val(result.d['cvTelefone']);
            $('#MainContent_dtNascimento').val(result.d['dtNascimento']);
            $('#MainContent_tbNomeConjuge').val(result.d['nomeConjuge']);
            $('#MainContent_tbNomeMae').val(result.d['nomeMae']);
            $('#MainContent_tbNomePai').val(result.d['nomePai']);
            AdicionarMascaras();
            $("#medicoModal").modal("show");
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