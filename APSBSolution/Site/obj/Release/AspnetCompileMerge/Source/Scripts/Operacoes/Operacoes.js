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
        error: function () {
            alert("Falha na operação! Informe os dados a seguir para o administrador: " + JSON.stringify(relacaoObj));
        },
        success: function (result) {
            //alert("Registro adicionado com sucesso");
            $("#idHiddenOperacao2").val(result.d["ID"]);
            $("#MainContent_tbValorOperacao").val(formatMoney(result.d["cvValor"], ".", ",", "."));
            console.log(ConvertDate2(result.d["cdEmissao"]));
            $("#MainContent_tbDespesaDataNF").val(ConvertDate2(result.d["cdEmissao"]));
            $("#MainContent_tbDespesaObs").val(result.d["observacao"]);
            $("#MainContent_dpSearchDespesas").val(result.d["ccDescricao"]);
            AdicionarMascaras();
        }
    });


    $("#operacaoModal").modal("show");
    AtvDespesa();
};

function SalvarDespesa() {
    var _Usuario = $("#MainContent_HiddenUser").val().substring(0, $("#MainContent_HiddenUser").val().indexOf("@"));
    var _tipo = $("#MainContent_dpSearchDespesas").val();
    var _data = $("#MainContent_tbDespesaDataNF").val();
    var _valor = $("#MainContent_tbValorOperacao").val();
    var _obs = $("#MainContent_tbDespesaObs").val();
    var _idOperacao = $("#idHiddenOperacao2").val();

    if (_tipo == "Outra") {
        _tipo = $("#tbNovadespesa").val();
    }


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
        error: function () {
            alert("Falha na operação! Informe os dados a seguir para o administrador: " + JSON.stringify(relacaoObj));
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
        error: function () {
            alert("Falha na operação! Informe os dados a seguir para o administrador: " + JSON.stringify(relacaoObj));
        },
        success: function (result) {
            //alert("Registro adicionado com sucesso");
            $("#idHiddenOperacao2").val(result.d[0].idReceita);
            $("#MainContent_tbValorOperacao").val(formatMoney(result.d[0].cvValor, ".", ",", "."));

            $("#MainContent_tbReceitaDataNF").val(ConvertDate2(result.d[0].cdEmissao));
            $("#MainContent_tbReceitaDataPgtoNF").val(ConvertDate2(result.d[0].cdPagamento));

            $("#MainContent_dpSearchClinicas").val(result.d[1].ccDescricao);

            $("#MainContent_tbReceitaNF").val(result.d[0].cvNF);
            $("#MainContent_tbReceitaNFValorPG").val(formatMoney(result.d[0].cvValorPago, ".", ",", "."));
            $("#MainContent_tbReceitaDesconto").val(formatMoney(result.d[0].cvDesconto, ".", ",", "."));
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

    var _Usuario = $("#MainContent_HiddenUser").val().substring(0, $("#MainContent_HiddenUser").val().indexOf("@"));
    var _valor = $("#MainContent_tbValorOperacao").val();
    var _tipo = $("#MainContent_dpSearchClinicas").val();
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
        error: function () {
            alert("Falha na operação! Informe os dados a seguir para o administrador: " + JSON.stringify(relacaoObj));
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
        error: function () {
            alert("Falha na operação! Informe os dados a seguir para o administrador: " + JSON.stringify(relacaoObj));
        },
        success: function (result) {
            //console.log(result.d);

            $("#MainContent_chkIssRetido").removeAttr("disabled");
            $("#MainContent_tbReceitaDesconto").removeAttr("readonly");
            $("#MainContent_tbReceitaDesconto").val(formatMoney(result.d["cvDescontos"], ".", ",", "."));

            if (result.d["cvISS"] > 0) {
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

    $("#divObs").addClass("d-none");
    $("#MainContent_tbObsRepasseProfissional").val("");
    $("#hiddenRepasseID").val(id);
    $("#idHiddenOperacao2").val(id);
    if (tipo == "Receita") {
        $("#MainContent_tbDtRepasse").val();
        var idClinica = 0;
        var relacaoObj = {
            idOperacao: id
        };

        $.ajax({
            type: "POST",
            url: "Operacoes.aspx/BuscarDadosRepasse",
            data: JSON.stringify(relacaoObj),
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            error: function () {
                alert("Falha na operação! Informe os dados a seguir para o administrador: " + JSON.stringify(relacaoObj));
            },
            success: function (result) {
                //console.log(result.d);
                $("#MainContent_tbValorNF").val(formatMoney(result.d[0].cvValor, ".", ",", "."));
                $("#MainContent_tbValorPago").val(formatMoney(result.d[0].cvValorPago, ".", ",", "."));
                $("#MainContent_tbValorRepassado").val(formatMoney(result.d[0].cvValorRepassado, ".", ",", "."));
                $("#MainContent_tbValorDisponivel").val(formatMoney(result.d[0].cvValorDisponivel, ".", ",", "."));
                if (result.d[0].cvValorDisponivel < 0) {
                    formatValorDisponivel(1);
                } else {
                    formatValorDisponivel(0);
                };

                $("#tbRepasseBody").empty(); //Limpa  a tabela para carregar novos dados

                if (result.d[1].length > 0) {
                    //alert(result.d[1].length + " registros");
                    for (var i = 0; i < result.d[1].length; i++) {
                        //console.log(result.d[1][i]);
                        var row = "<tr><th scope='row'>" + result.d[1][i].idRepasse + "</th>"
                            + "<td>" + result.d[1][i].ccNome + "</td>"
                            + "<td>" + result.d[1][i].cvTaxaProfissional + "</td>"
                            + "<td style='text-align: right'>" + formatMoney(result.d[1][i].cvValor, ".", ",", ".") + "</td>"
                            + "<td style='text-align: right'>" + formatMoney(result.d[1][i].cvValorLiquido, ".", ",", ".") + "</td>"
                            + "<td>" + String.fromCharCode(result.d[1][i].ccStatus) + "</td>";

                        if (result.d[1][i].Bancos != "") {
                            var Bancos = JSON.parse(result.d[1][i].Bancos);
                            if (Bancos != undefined) {
                                var ib = 0;
                                var banco = Bancos[ib];
                                row = row + "<td>";
                                do {
                                    if (ib > 0) {
                                        row += "&nbsp";
                                    }
                                    row = row + "<img src='../Content/Bancos/" + banco.cvCodBanco + ".png' title='" + banco.ccBanco + "' class='imgButton'>"
                                    ib++;
                                    banco = Bancos[ib];
                                }
                                while (banco != undefined);
                                row = row + "</td>";
                            }
                        }
                        else {
                            row += "<td><img src='../Content/Icons/erro.jpg' title='Nenhum banco cadastrado' class='imgButton'></td>";
                        }


                        if (String.fromCharCode(result.d[1][i].ccStatus) == "A") {
                            row = row + ("<td><input type='image' src='../Content/Icons/cash-outline.svg' title='Pagar' class='imgButton' onclick='return pagar(" + result.d[1][i].idRepasse+")' /> </td>");
                        }
                        else {
                            row += "<td><input type='image' src='../Content/Icons/cash-outline.svg' title='Pagar' class='imgButtonDisabled' disabled /> </td>";
                        };

                        if (result.d[1][i].Observacao != "") {
                            row += "<td><input type='image' src='../Content/Icons/info_yellow.png' title='Informações' class='imgButton' onclick='return getInfo(" + result.d[1][i].idRepasse +")' /> </td>";
                        } else {
                            row += "<td><input type='image' src='../Content/Icons/information-circle-outline.svg' title='Informações' class='imgButtonDisabled'  disabled/> </td>";
                        }

                        row += "<td><input type='image' src='../Content/Icons/trash-outline.svg' class='imgButton' title='Excluir' onclick='return excluir(" + result.d[1][i].idRepasse +")' /> </td></tr> ";

                        $("#tbRepasseBody").append(row);
                    }
                }

                //Carregar dados Dropdown
                //$('#dpSelectProfissional').empty();
                $("#dsRepasseProfissional").empty();

                var i = 0;
                var p = result.d[2][i];
                if (p != undefined) {
                    while (p != undefined) {
                        $("#dsRepasseProfissional").append(new Option(p.ccNome))
                        //$("#dpSelectProfissional").append(new Option(p.ccNome, p.IdProfissional));
                        i++;
                        p = result.d[2][i];
                    }
                }
                else {
                    //$('#dpSelectProfissional')
                    //    .empty()
                    //    .append('<option selected="selected" value="0">Nenhum profissional associado</option>');
                    $("#dsRepasseProfissional").empty();
                }
                //Validar Valores
                var cvValor = result.d[0].cvValorPago;
                if (result.d[0].cbIssRetido != true) {
                    cvValor -= result.d[0].cvValor * 2 / 100;
                }
                if (cvValor < result.d[0].cvValorRepassado) {
                    AtivarErroValor();
                } else {
                    DesativarErroValor();
                };

            }
        });
        $('#repasseMedicoModal').modal('show');
    }
    return false;
};

function AtivarErroValor() {
    $('#imgDanger').collapse('show');
    $('#btCorrigirReceita').collapse('show');
    $(".cvAlert").css("border-style", "solid");
    $(".cvAlert").css("border-color", "red");
};

function DesativarErroValor() {
    $('#imgDanger').collapse('hide');
    $('#btCorrigirReceita').collapse('hide');
    $(".cvAlert").css("border-style", "none");
    $(".cvAlert").css("border-color", "none");
};

function pagar(id) {
    return cmdRepasse("Pagar", id);
};

function excluir(id) {
    return cmdRepasse("Excluir", id);
};

function getInfo(id) {

    var url = "Operacoes.aspx/CommandRepasse";
    var user = $("#MainContent_HiddenUser").val().substring(0, $("#MainContent_HiddenUser").val().indexOf("@"));
    var dt = $("#MainContent_tbDtRepasse").val();

    var obj = {
        Usuario: user
        , comando: "Info"
        , _idRepasse: id
        , data: dt
    };

    $.ajax({
        type: "POST",
        url: url,
        data: JSON.stringify(obj),
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        error: function () {
            alert("Falha na operação! Informe os dados a seguir para o administrador: " + JSON.stringify(relacaoObj));
        },
        success: function (result) {
            console.log(result.d);
            $("#divObs").removeClass("d-none");
            $("#MainContent_tbObsRepasseProfissional").val(result.d[1]);
        }
    });

    return false;
};

function cmdRepasse(cmd, id) {
    var user = $("#MainContent_HiddenUser").val().substring(0, $("#MainContent_HiddenUser").val().indexOf("@"));
    var dt = $("#MainContent_tbDtRepasse").val();

    var obj = {
        Usuario: user
        , comando: cmd
        , _idRepasse: id
        , data: dt
    };
    Call("CommandRepasse", obj);
    return false;
};

function Call(metodo, obj) {
    var url = "Operacoes.aspx/" + metodo;
    $.ajax({
        type: "POST",
        url: url,
        data: JSON.stringify(obj),
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        error: function () {
            alert("Falha na operação! Informe os dados a seguir para o administrador: " + JSON.stringify(obj));
        },
        success: function (result) {
            $("#hiddenRepasseAlterado").val("1");
            AbrirRepasseModal("Receita", $("#hiddenRepasseID").val());
        }
    });
};

function CarregarClinicasDP() {

    $.ajax({
        type: "POST",
        url: "Operacoes.aspx/ListarClinicasDP",
        data: null,
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: function (result) {
            //alert("Registro adicionado com sucesso");
            //console.log(result.d);
            for (var i = 0; i < result.d.length; i++) {
                $('#dsClinicasDP').append("<option value='" + result.d[i] + "'>");
            }

        }
    });

};

function CarregarDespesasDP() {

    $.ajax({
        type: "POST",
        url: "Operacoes.aspx/ListarDespesasDP",
        data: null,
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: function (result) {
            //alert("Registro adicionado com sucesso");
            //console.log(result.d);
            for (var i = 0; i < result.d.length; i++) {
                $('#dsDespesasDP').append("<option value='" + result.d[i] + "'>");
            }

            $('#dsDespesasDP').append("<option value='Outra'>");

        }
    });

};

function CarregarDadosClinica() {
    var clinica = $("#MainContent_dpSearchClinicas").val();
    var obj = {
        Apelido: clinica
    };

    $.ajax({
        type: "POST",
        url: "Operacoes.aspx/BuscarClinicaByApelido",
        data: JSON.stringify(obj),
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: function (result) {
            console.log(result.d);
            $("#MainContent_tbReceitaDesconto").val(result.d.cvDescontos);
            if (result.d.cvISS > 0) {
                $("#MainContent_chkIssRetido").prop("checked", true);
            }
            else {
                $("#MainContent_chkIssRetido").prop("checked", false);
            }

            $('#spinner').removeClass('spinner-border');
            $("#divOps").removeClass("d-none")
        }
    });
};

function Get_ProfissionalIDByReceita(idReceita, nomeProfissional) {
    var obj = {
        id: idReceita
        , nome: nomeProfissional
        , idProfissional: 0
    };

    $.ajax({
        type: "POST",
        url: "Operacoes.aspx/BuscarProfissionalIDByReceita",
        data: JSON.stringify(obj),
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: function (result) {
            //console.log(result.d);
            obj.idProfissional = result.d;
        }
    });

};

function AdicionarRepasse() {
    //string Usuario, string idProfissional, string cvValor, string idReceita

    var id = $("#hiddenRepasseID").val();
    //var _idProfissional = $("#dpSelectProfissional").val();
    var _nomeProfissional = $("#dpSelectProfissional2").val();
    var _cvValor = $("#MainContent_tbValorDisponivel").val();
    var _idReceita = $("#hiddenRepasseID").val()
    var _data = $("#MainContent_tbDtRepasse").val();
    var user = $("#MainContent_HiddenUser").val().substring(0, $("#MainContent_HiddenUser").val().indexOf("@"));

    var objProfissional = {
        id: _idReceita,
        nome: _nomeProfissional,
        idProfissional: 0
    };

    $.ajax({
        type: "POST",
        url: "Operacoes.aspx/BuscarProfissionalIDByReceita",
        data: JSON.stringify(objProfissional),
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: function (result) {
            SalvarRepasse(user, result.d, _cvValor, _idReceita, _data);
        }
    });
};

function SalvarRepasse(user, id, _cvValor, _idReceita, _data) {
    var relacaoObj = {
        Usuario: user,
        idProfissional: id,
        cvValor: _cvValor,
        idReceita: _idReceita,
        data: _data
    };

    $.ajax({
        type: "POST",
        url: "Operacoes.aspx/AdicionarRepasse",
        data: JSON.stringify(relacaoObj),
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        error: function () {
            alert("Falha na operação! Informe os dados a seguir para o administrador: " + JSON.stringify(relacaoObj));
        },
        success: function (result) {
            $("#hiddenRepasseAlterado").val("1");
            AbrirRepasseModal("Receita", _idReceita);
        }
    });
};

function CalcularValorPago() {
    var valorTotal = $("#MainContent_tbValorOperacao").val().replace(".", "").replace(",", ".");
    var valorDesconto = $("#MainContent_tbReceitaDesconto").val().replace(".", "").replace(",", ".");
    var valorISS = 0;
    if ($("#MainContent_chkIssRetido").is(":checked")) {
        valorISS = 2
    }
    if (valorDesconto != "") {
        var valorPago = valorTotal - (valorTotal * (Number(valorDesconto) + Number(valorISS)) / 100);
        $("#MainContent_tbReceitaNFValorPG").val(valorPago.toFixed(2));
    }
};

function CalcularDesconto() {
    var valorTotal = $("#MainContent_tbValorOperacao").val().replace(".", "").replace(",", ".");
    var valorPago = $("#MainContent_tbReceitaNFValorPG").val().replace(".", "").replace(",", ".");
    var valorISS = 0;
    if ($("#MainContent_chkIssRetido").is(":checked")) {
        valorISS = 2
    }
    if (valorPago != "") {
        var valorDesconto = 100 - ((valorPago / valorTotal * 100) + valorISS);
        $("#MainContent_tbReceitaDesconto").val(valorDesconto.toFixed(2));
    }
};

function UPD_ReceitaByRepasses() {
    var relacaoObj = {
        Usuario: $("#MainContent_HiddenUser").val().substring(0, $("#MainContent_HiddenUser").val().indexOf("@")),
        idReceita: $("#idHiddenOperacao2").val()
    };

    $.ajax({
        type: "POST",
        url: "Operacoes.aspx/UPD_ReceitaByRepasses",
        data: JSON.stringify(relacaoObj),
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        error: function () {
            alert("Falha na operação! Informe os dados a seguir para o administrador: " + JSON.stringify(relacaoObj));
        },
        success: function (result) {
            $("#hiddenRepasseAlterado").val("1");
            alert("Valor da receita atualizado!");
        }
        , error: function () {
            alert("Falha ao atualizar o valor da receita!")
        }
    });
};