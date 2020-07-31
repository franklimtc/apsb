function AbrirDesRec(tipo, id) {
    if (tipo == "Receita") {
        EditReceita(id);
    } else {
        EditDespesa(id);
    };
    return false;
};

function EditDespesa(id) {
    //int idDespesa, string tipo
    var relacaoObj = {
        idDespesa: id,
        tipo: "Despesa"
    };

    $.ajax({
        type: "POST",
        url: "Operacoes.aspx/CarregarDespesa",
        data: JSON.stringify(relacaoObj),
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        },
        success: function (result) {
            //alert("Registro adicionado com sucesso");
            $("#idHiddenOperacao2").val(result.d["ID"]);
            $("#MainContent_tbValorOperacao").val(formatMoney(result.d["cvValor"], ".", ",", "."));
            console.log(ConvertDate2(result.d["cdEmissao"]));
            $("#MainContent_tbDespesaDataNF").val(ConvertDate2(result.d["cdEmissao"]));
            $("#MainContent_tbDespesaObs").val(result.d["observacao"]);
            var sel = result.d["ccDescricao"];

            $("#MainContent_dpTipoDespesa option").filter(function () {
                return this.text == sel;
            }).attr('selected', true);

            AdicionarMascaras();
        }
    });


    $("#operacaoModal").modal("show");
    AtvDespesa();
};

function SalvarDespesa() {
    var _Usuario = $("#MainContent_HiddenUser").val().substring(0, $("#MainContent_HiddenUser").val().indexOf("@"));
    var _tipo = $("#MainContent_dpTipoDespesa").val();
    var _data = $("#MainContent_tbDespesaDataNF").val();
    var _valor = $("#MainContent_tbValorOperacao").val();
    var _obs = $("#MainContent_tbDespesaObs").val();
    var _idOperacao = $("#idHiddenOperacao2").val();

    var relacaoObj = {
        Usuario: _Usuario,
        tipo: _tipo,
        data: _data,
        valor: _valor,
        obs: _obs,
        idOperacao: _idOperacao
    };

    $.ajax({
        type: "POST",
        url: "Operacoes.aspx/SalvarDespesa",
        data: JSON.stringify(relacaoObj),
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        },
        success: function (result) {
            //alert("Registro adicionado com sucesso");
            console.log(result.d);
            if (_idOperacao == "") {
                console.log("Adicionar");
            }
            else {
                console.log("Atualizar");
            };
            $("#operacaoModal").modal("hide");
            location.reload();

        }
    });
    return false;

};

function EditReceita(id) {
    var relacaoObj = {
        idReceita: id,
        tipo: "Receita"
    };

    $.ajax({
        type: "POST",
        url: "Operacoes.aspx/CarregarReceita",
        data: JSON.stringify(relacaoObj),
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        },
        success: function (result) {
            //alert("Registro adicionado com sucesso");
            $("#idHiddenOperacao2").val(result.d[0].idReceita);
            $("#MainContent_tbValorOperacao").val(formatMoney(result.d[0].cvValor, ".", ",", "."));

            $("#MainContent_tbReceitaDataNF").val(ConvertDate2(result.d[0].cdEmissao));
            $("#MainContent_tbReceitaDataPgtoNF").val(ConvertDate2(result.d[0].cdPagamento));

            $("#MainContent_dpTipoReceita option").filter(function () {
                return this.text == result.d[1].ccDescricao;
            }).attr('selected', true);

            $("#MainContent_tbReceitaNF").val(result.d[0].cvNF);
            $("#MainContent_tbReceitaNFValorPG").val(formatMoney(result.d[0].cvValorPago, ".", ",", "."));
            $("#MainContent_tbReceitaDesconto").val(result.d[0].cvDesconto);
            $("#MainContent_chkIssRetido").removeAttr("disabled");

            if (result.d[0].cbIssRetido == true) {
                $("#MainContent_chkIssRetido").attr("checked", true);
            } else {
                $("#MainContent_chkIssRetido").attr("checked", false);
            };

            $("#MainContent_tbReceitaObs").val(result.d[0].Observacao);

            $("#MainContent_tbReceitaDataNF").removeAttr("disabled");
            $("#MainContent_tbReceitaDataPgtoNF").removeAttr("disabled");
            $("#MainContent_tbReceitaNF").removeAttr("disabled");
            $("#MainContent_tbReceitaNFValorPG").removeAttr("disabled");

            //console.log(result.d);
        }
    });



    $("#operacaoModal").modal("show");
    AtvReceita();
};

function SalvarReceita() {
    // Usuario,  valor,  tipo,  dtNF,  nf,  dtPgto,  valorPago,  desconto,  obs,  issRetido,  idReceita

   // Usuario, valor, tipo, dtNF, nf, dtPgto, valorPago, desconto, obs, issRetido, idReceita

    var _Usuario = $("#MainContent_HiddenUser").val().substring(0, $("#MainContent_HiddenUser").val().indexOf("@"));;
    var _valor = $("#MainContent_tbValorOperacao").val();
    var _tipo = $("#MainContent_dpTipoReceita").val();
    var _dtNF = $("#MainContent_tbReceitaDataNF").val();
    var _nf = $("#MainContent_tbReceitaNF").val();
    var _dtPgto = $("#MainContent_tbReceitaDataPgtoNF").val();
    var _valorPago = $("#MainContent_tbReceitaNFValorPG").val();
    var _desconto = $("#MainContent_tbReceitaDesconto").val();
    var _obs = $("#MainContent_tbReceitaObs").val();
    var _issRetido = $("#MainContent_chkIssRetido").is(":checked");
    var _idReceita = $("#idHiddenOperacao2").val();

    var relacaoObj = {
        Usuario: _Usuario
        , valor: _valor
        , tipo: _tipo
        , dtNF: _dtNF
        , nf: _nf
        , dtPgto: _dtPgto
        , valorPago: _valorPago
        , desconto: _desconto
        , obs: _obs
        , issRetido: _issRetido
        , idReceita: _idReceita
    };

    $.ajax({
        type: "POST",
        url: "Operacoes.aspx/SalvarReceita",
        data: JSON.stringify(relacaoObj),
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        },
        success: function (result) {
            $("#operacaoModal").modal("hide");
            location.reload();
        }
    });

};

function DescontosClinica() {
    var id = $("#MainContent_dpTipoReceita").val();
    //console.log(id);

    var relacaoObj = {
        idClinica: $("#MainContent_dpTipoReceita").val()
    };

    $.ajax({
        type: "POST",
        url: "Operacoes.aspx/BuscarClinicaID",
        data: JSON.stringify(relacaoObj),
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            console.log("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        },
        success: function (result) {
            //console.log(result.d);

            $("#MainContent_chkIssRetido").removeAttr("disabled");
            $("#MainContent_tbReceitaDesconto").removeAttr("readonly");
            $("#MainContent_tbReceitaDesconto").val(formatMoney(result.d["cvDescontos"], ".", ",", "."));

            if (result.d["cvDescontos"] != 0) {
                $("#MainContent_chkIssRetido").attr("checked", true);
            } else {
                $("#MainContent_chkIssRetido").attr("checked", false);
            };
            //cvDescontos: 2
            //cvISS: 2
        }
    });

    return false;
};

function AbrirRepasseModal(tipo, id) {
    if (tipo == "Receita") {
        $("#MainContent_tbDtRepasse").val();

        var relacaoObj = {
            idOperacao: id
        };

        $.ajax({
            type: "POST",
            url: "Operacoes.aspx/BuscarDadosRepasse",
            data: JSON.stringify(relacaoObj),
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                console.log("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
            },
            success: function (result) {
                console.log(result.d);
                $("#MainContent_tbValorNF").val(formatMoney(result.d[0].cvValor, ".", ",", "."));
                $("#MainContent_tbValorPago").val(formatMoney(result.d[0].cvValorPago, ".", ",", "."));
                $("#MainContent_tbValorRepassado").val(formatMoney(result.d[0].cvValorRepassado, ".", ",", "."));
                $("#MainContent_tbValorDisponivel").val(formatMoney(result.d[0].cvValorDisponivel, ".", ",", "."));
                if (result.d[0].cvValorDisponivel < 0) {
                    formatValorDisponivel(1);
                } else {
                    formatValorDisponivel(0);
                };
                if (result.d[1].length > 0) {
                    //alert(result.d[1].length + " registros");
                    for (var i = 0; i < result.d[1].length; i++) {
                        console.log(result.d[1][i]);
                        $("#tbRepasseBody").append("<tr><th scope='row'>" + result.d[1][i].idRepasse + "</th>"
                            + "<td>" + result.d[1][i].ccNome + "</td>"
                            + "<td>" + result.d[1][i].cvTaxaProfissional + "</td>"
                            + "<td style='text-align: right'>" + formatMoney(result.d[1][i].cvValor, ".", ",", ".") + "</td>"
                            + "<td style='text-align: right'>" + formatMoney(result.d[1][i].cvValorLiquido, ".", ",", ".") + "</td>"
                            + "<td>" + String.fromCharCode(result.d[1][i].ccStatus) + "</td>"
                            + "<td><input type='image' src='../Content/Icons/cash-outline.svg' class='imgButton' /> </td>"
                            + "<td><input type='image' src='../Content/Icons/information-circle-outline.svg' class='imgButton' /> </td>"
                            + "<td><input type='image' src='../Content/Icons/trash-outline.svg' class='imgButton' /> </td></tr> ");
                    }
                }
            }
        });
        $('#repasseMedicoModal').modal('show');
    }
    return false;
};