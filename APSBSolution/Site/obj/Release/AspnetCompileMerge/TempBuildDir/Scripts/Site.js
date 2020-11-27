$(document).ready(function () {
    $('.number').mask('0000000000000000');
    $('.date').mask('00/00/0000');
    $('.time').mask('00:00:00');
    $('.date_time').mask('00/00/0000 00:00:00');
    $('.cep').mask('00000-000');
    $('.phone').mask('00000-0000');
    $('.phone_with_ddd').mask('(00) 00000-0000');
    $('.phone_with_ddd2').mask('(00) 0000-0000');
    $('.phone_us').mask('(000) 000-0000');
    $('.mixed').mask('AAA 000-S0S');
    $('.cpf').mask('000.000.000-00', { reverse: true });
    $('.cnpj').mask('00.000.000/0000-00', { reverse: true });
    $('.money').mask('000.000.000.000.000,00', { reverse: true });
    $('.money2').mask("#.##0,00", { reverse: true });
    $(".titulo").mask("0000 0000 00 00", { reverse: true });
    $('.ip_address').mask('0ZZ.0ZZ.0ZZ.0ZZ', {
        translation: {
            'Z': {
                pattern: /[0-9]/, optional: true
            }
        }
    });
    $('.ip_address').mask('099.099.099.099');
    $('.percent').mask('##0,00%', { reverse: true });
    $('.clear-if-not-match').mask("00/00/0000", { clearIfNotMatch: true });
    $('.placeholder').mask("00/00/0000", { placeholder: "__/__/____" });
    $('.fallback').mask("00r00r0000", {
        translation: {
            'r': {
                pattern: /[\/]/,
                fallback: '/'
            },
            placeholder: "__/__/____"
        }
    });
    $('.selectonfocus').mask("00/00/0000", { selectOnFocus: true });


});

function SalvarFiltro() {
    $('.dataTables_filter input').change(function () {
        localStorage[location.pathname.split('/').slice(-1)[0]] = $('.dataTables_filter input').val();
    });
};

function CarregarFiltro() {
    var page = location.pathname.split('/').slice(-1)[0]
    if (localStorage[page] != undefined) {
        var filter = localStorage[page];
        if (filter != "") {
            $('.dataTables_filter input').val(filter);
            $('.dataTables_filter input').keyup();
        };
    }
};

function RemoverMascaras() {
    $(".cep").unmask();
    $(".cpf").unmask();
    $(".cnpj").unmask();
    $(".phone_with_ddd").unmask();
    $(".phone_with_ddd2").unmask();
    $('.money').unmask();
    $('.money2').unmask();
    $('.percent').unmask();
    $('.titulo').unmask();
};

function AdicionarMascaras() {
    $('.cep').mask('00000-000');
    $('.cpf').mask('000.000.000-00', { reverse: true });
    $('.cnpj').mask('00.000.000/0000-00', { reverse: true });
    $('.phone_with_ddd').mask('(00) 00000-0000');
    $('.phone_with_ddd2').mask('(00) 0000-0000');
    $('.titulo').mask('0000 0000 00 00');
    $('.money').mask('000.000.000.000.000,00', { reverse: true });
    $('.money2').mask("#.##0,00", { reverse: true });
    $('.percent').mask('##0,00%', { reverse: true });
};

function ResetForm() {
    $('#default').each(function () {
        this.reset();
    });
};

function ConvertDate(value) {
    var pattern = /Date\(([^)]+)\)/;
    var results = pattern.exec(value);
    var dt = new Date(parseFloat(results[1]));
    if (dt.getFullYear() > 0) {
        return (dt.getDate() + "/" + dt.getMonth()) + "/" + dt.getFullYear();
    }
    else
        return "";
};

function ConvertDate2(value) {
    var pattern = /Date\(([^)]+)\)/;
    if (value != null) {
        var results = pattern.exec(value);
        var dt = new Date(parseFloat(results[1]));
        var z = "0";
        var month = dt.getMonth() + 1;
        var day = dt.getDate() + 1;

        if (month < 10) {
            month = z.concat(month);
        }
        if (day < 10) {
            day = z.concat(day);
        };

        if (dt.getFullYear() > 0) {
            return (dt.getFullYear() + "-" + month) + "-" + day;
        }
        else
            return "";
    }
    else
        return "";
};
