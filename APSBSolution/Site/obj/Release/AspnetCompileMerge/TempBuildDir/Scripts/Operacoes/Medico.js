//import { isUndefined } from "../DataTables/extensions/pdfmake/pdfmake";

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
            error: function () {
                alert("Falha na operação! Informe os dados a seguir para o administrador: " + JSON.stringify(relacaoObj));
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
    $("#MainContent_idHiddenMedico").val(_idProfissional);

    var url = "Medico.aspx/BuscarPorID";

    var relacaoObj = {
        idProfissional: _idProfissional
    };

    $.ajax({
        type: "POST",
        url: url,
        data: JSON.stringify(relacaoObj),
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        error: function () {
            alert("Falha na operação! Informe os dados a seguir para o administrador: " + JSON.stringify(relacaoObj));
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
            $("#MainContent_tbRGdata").val(ConvertDate2(result.d["RGdtEmissao"]));
            $("#MainContent_tbCPF").val(("0000" + result.d["CPFNum"]).slice(-11));
            $("#MainContent_tbCPF").mask("000.000.000-00")
            $("#MainContent_tbCNH").val(result.d["cvCNH"]);
            $("#MainContent_tbEmail").val(result.d["ccEmail"]);
            $("#MainContent_tbFone").val(result.d["cvTelefone"]);
            $("#MainContent_tbCelular").val(result.d["cvCelular"]);
            $("#MainContent_tbDtFiliacao").val(ConvertDate2(result.d["cdFiliacao"]));
            $("#MainContent_tbDtPagamento").val(ConvertDate2(result.d["cdPgtoTaxa"]));
            $("#MainContent_tbDtRegCartorio").val(ConvertDate2(result.d["cdRegCartorio"]));
            $("#MainContent_tbdtNascimento").val(ConvertDate2(result.d["dtNascimento"]));
            $("#MainContent_tbObs").val(result.d["Observacoes"]);
            $("#medicoModal").modal("show");
            $("#MainContent_tbCNH").val(result.d["cvCNH"]);

            RemoverMascaras();
            AdicionarMascaras();
        }
    });
    return false;
};

function CarregarModalProfissional(_idProfissional) {
    $("#MainContent_idHiddenMedico").val(_idProfissional);

    var url = "Medico.aspx/BuscarDadosID";

    var relacaoObj = {
        idProfissional: _idProfissional
    };


    $.ajax({
        type: "POST",
        url: url,
        data: JSON.stringify(relacaoObj),
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        error: function () {
            alert("Falha na operação! Informe os dados a seguir para o administrador: " + JSON.stringify(relacaoObj));
        },
        success: function (result) {
            //console.log(result.d);
            if (result.d != null) {
                ResetForm();

                var IdDadoProfissional = result.d["IdDadoProfissional"];
                $("#MainContent_idHiddenProfissionalDado").val(IdDadoProfissional);
                //$("#MainContent_tbFormacao").val(result.d["ccFormacao"]);
                //$("#MainContent_dpEspecialidade").val(result.d["ccEspecialidade"]).change();
                $('#MainContent_dpFormacao option:selected').removeAttr('selected');

                $("#MainContent_dpFormacao option").filter(function () {
                    return this.text == result.d["ccFormacao"];
                }).attr('selected', true);

                $('#MainContent_dpEspecialidade option:selected').removeAttr('selected');
                $("#MainContent_dpEspecialidade option").filter(function () {
                    return this.text == result.d["ccEspecialidade"];
                }).attr('selected', true);

                $("#MainContent_tbPosGraduacao").val(result.d["ccPosGraduacao"]);
                $("#MainContent_dpConselhoRegional").val(result.d["ccConselho"]);
                $("#MainContent_tbNumInscricaoConselho").val(result.d["cvNumInscricao"]);
                $("#MainContent_tbTituloEleitor").val(result.d["cvTitulo"]);
                $("#MainContent_tbZonaEleitor").val(result.d["cvTituloZona"]);
                $("#MainContent_tbSecaoEleitor").val(result.d["cvTituloSecao"]);
                $("#MainContent_tbReservista").val(result.d["cvReservista"]);
                $("#MainContent_tbPisPasep").val(result.d["cvPIS"]);

                AdicionarMascaras();
                $("#rowFormacao").collapse("hide");

            } else {
                ResetForm();
            }
            $("#profissionalModal").modal("show");
        }
    });
    return false;
};

function CarregarModalEndereco(_idProfissional) {
    $("#MainContent_idHiddenMedico").val(_idProfissional);

    var url = "Medico.aspx/BuscarEnderecoID";

    var relacaoObj = {
        idProfissional: _idProfissional
    };


    $.ajax({
        type: "POST",
        url: url,
        data: JSON.stringify(relacaoObj),
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        error: function () {
            ResetForm();
            alert("Falha na operação! Informe os dados a seguir para o administrador: " + JSON.stringify(relacaoObj));
        },
        success: function (result) {
            //console.log(result.d);    
            ResetForm();
            if (result.d != null) {
                $("#MainContent_idHiddenProfissionalEndereco").val(result.d.IdEndereco)
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

function CarregarModalBanco(_idProfissional) {
    $("#MainContent_idHiddenMedico").val(_idProfissional);

    var url = "Medico.aspx/BuscarBancosID";

    var relacaoObj = {
        idProfissional: _idProfissional
    };


    $.ajax({
        type: "POST",
        url: url,
        data: JSON.stringify(relacaoObj),
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        error: function () {
            alert("Falha na operação! Informe os dados a seguir para o administrador: " + JSON.stringify(relacaoObj));
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
                        + "<input type='image' class='imgButton' src='../Content/Icons/trash-outline.svg' onclick='return RemoverBanco(" + result.d[i].IdProfissionalBanco + ")'/>" + "</td>"
                        + "</tr>");
                }
            }
        }
    });
    $("#bancoModal").modal("show");
    return false;
};

function CarregarModalArquivos(_idProfissional) {
    $("#MainContent_idHiddenMedico").val(_idProfissional);

    var url = "Medico.aspx/BuscararquivosID";

    var relacaoObj = {
        idProfissional: _idProfissional
    };


    $.ajax({
        type: "POST",
        url: url,
        data: JSON.stringify(relacaoObj),
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        error: function () {
            alert("Falha na operação! Informe os dados a seguir para o administrador: " + JSON.stringify(relacaoObj));
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

    var idMedico = $('#MainContent_idHiddenMedico').val();
    $.ajax({
        type: "POST",
        url: url,
        data: JSON.stringify(relacaoObj),
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        error: function () {
            alert("Falha na operação! Informe os dados a seguir para o administrador: " + JSON.stringify(relacaoObj));
        },
        success: function (result) {
            CarregarModalBanco(idMedico);
        }
    });
    return false;
};

function SalvarDados() {


    var url = "Medico.aspx/SalvarDados";
    var formacao;

    if ($("#MainContent_dpFormacao  option:selected").val() === "Outra") {
        formacao = $("#MainContent_tbFormProfissional").val();
        $("#MainContent_dpFormacao").append('<option>' + formacao + '</option>');
    }
    else {
        formacao = $("#MainContent_dpFormacao  option:selected").val();
    }

    var relacaoObj = {
        user: $("#MainContent_HiddenUser").val().substring(0, $("#MainContent_HiddenUser").val().indexOf("@")),
        idDado: $("#MainContent_idHiddenProfissionalDado").val(),
        idMedico: $("#MainContent_idHiddenMedico").val(),
        ccFormacao: formacao,
        ccPosGraduacao: $("#MainContent_tbPosGraduacao").val(),
        ccEspecialidade: $("#MainContent_dpEspecialidade option:selected").text(),
        ccEspecialidadeNova: $("#MainContent_tbEspecialidadeNova").val(),
        ccConselho: $("#MainContent_dpConselhoRegional").val(),
        NumInscricaoConselho: $("#MainContent_tbNumInscricaoConselho").val(),
        TituloEleitor: $("#MainContent_tbTituloEleitor").val(),
        ZonaEleitor: $("#MainContent_tbZonaEleitor").val(),
        SecaoEleitor: $("#MainContent_tbSecaoEleitor").val(),
        Reservista: $("#MainContent_tbReservista").val(),
        PisPasep: $("#MainContent_tbPisPasep").val()
    };
    //console.log(relacaoObj);
    //console.log(JSON.stringify(relacaoObj));

    $.ajax({
        type: "POST",
        url: url,
        data: JSON.stringify(relacaoObj),
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        error: function () {
            alert("Falha na operação! Informe os dados a seguir para o administrador: " + JSON.stringify(relacaoObj));
        },
        success: function (result) {
            if (result.d == true) {
                alert("Registro salvo com sucesso!");
            } else {
                alert("Falha ao salvar o registro!");
            }
        }
    });
};

function SalvarMedico() {
    var url = "Medico.aspx/SalvarMedico";

    var relacaoObj = {
        user: $("#MainContent_HiddenUser").val().substring(0, $("#MainContent_HiddenUser").val().indexOf("@"))
        , nome: $("#MainContent_tbNome").val()
        , sexo: $("#MainContent_dpSexo").val()
        , uf: $("#MainContent_dpUFNatural").val()
        , cidade: $("#MainContent_tbCidade").val()
        , estCivil: $("#MainContent_tbEstCivil").val()
        , pai: $("#MainContent_tbPai").val()
        , mae: $("#MainContent_tbMae").val()
        , conjuge: $("#MainContent_tbConjuge").val()
        , rgNum: $("#MainContent_tbRGNum").val()
        , rgEmissor: $("#MainContent_tbRGEmissor").val()
        , rgData: $("#MainContent_tbRGdata").val()
        , cpf: $("#MainContent_tbCPF").val()
        , email: $("#MainContent_tbEmail").val()
        , telefone: $("#MainContent_tbFone").val()
        , celular: $("#MainContent_tbCelular").val()
        , obs: $("#MainContent_tbObs").val()
        , dtNascimento: $("#MainContent_tbdtNascimento").val()
        , dtTaxa: $("#MainContent_tbDtPagamento").val()
        , dtFiliacao: $("#MainContent_tbDtFiliacao").val()
        , dtCartorio: $("#MainContent_tbDtRegCartorio").val()
        , idMedico: $("#MainContent_idHiddenMedico").val()
        , cnh: $("#MainContent_tbCNH").val()
    }

    if (relacaoObj.nome != "" && relacaoObj.cpf != "") {
        $.ajax({
            type: "POST",
            url: url,
            data: JSON.stringify(relacaoObj),
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            error: function () {
                alert("Falha na operação! Informe os dados a seguir para o administrador: " + JSON.stringify(relacaoObj));
            },
            success: function (result) {
                if (result.d == true) {
                    alert("Registro salvo com sucesso!");
                    location.reload();
                } else {
                    alert("Falha ao salvar o registro!");
                }
            }
        });
    } else {
        alert("Obrigatório inserir Nome e CPF do profissional!");
    };

    

    //$("#MainContent_gvMedicos").append("<tr><td>0</td><td>" + relacaoObj.nome + "</td><td>" + relacaoObj.email + "</td><td>" + relacaoObj.obs+"</td><td>Atualize</td><td>a</td><td>página</td><td>...</td><td>...</td><td>...</td></tr>");

};

function SalvarEndereco() {
    var url = "Medico.aspx/SalvarEndereco";
    var relacaoObj = {
        user: $("#MainContent_HiddenUser").val().substring(0, $("#MainContent_HiddenUser").val().indexOf("@")),
        idMedico: $("#MainContent_idHiddenMedico").val(),
        endereco: $("#MainContent_tbEndereço").val(),
        bairro: $("#MainContent_tbBairro").val(),
        cep: $("#MainContent_tbCep").val(),
        uf: $("#MainContent_dpEnderecoUF").val(),
        cidade: $("#MainContent_tbEnderecoCidade").val(),
        idEndereco: $("#MainContent_idHiddenProfissionalEndereco").val()
    };

    $.ajax({
        type: "POST",
        url: url,
        data: JSON.stringify(relacaoObj),
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        error: function () {
            alert("Falha na operação! Informe os dados a seguir para o administrador: " + JSON.stringify(relacaoObj));
        },
        success: function (result) {
            if (result.d == true) {
                alert("Registro salvo com sucesso!");
            } else {
                alert("Falha ao salvar o registro!");
            }
        }
    });
};

function ValidarCPF(_cpf) {
    var url = "Medico.aspx/GetProfissionalByCPF";

    var relacaoObj = {
        cpf: _cpf
    }

    $.ajax({
        type: "POST",
        url: url,
        data: JSON.stringify(relacaoObj),
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        error: function () {
            //alert("Falha na operação! Informe os dados a seguir para o administrador: " + JSON.stringify(relacaoObj));
        },
        success: function (result) {
            if ($("#MainContent_idHiddenMedico").val() == "" && result.d != "") {
                alert('ATENÇÃO: ' + result.d);
            }
        }
    });

};



