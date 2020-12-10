$(document).ready(function () {
    $(".btn-editar").click(function () {
        var index = $(this).data("id");

        if ($(this).data("tipo") == "categoria") {
            var idElemento = $(this).data("id");
            var ccIdPai = $(this).data("pai");
            var categoria = $(this).data("categoria");

            EditarCategoria(idElemento, ccIdPai, categoria);
            console.log(idElemento);
        }
        else {
            var idElemento = $(this).data("id");
            var IdCategoria = $(this).data("pai");
            var tipo = $(this).data("categoria");
            EditarTipo(idElemento, IdCategoria, tipo);
            console.log(idElemento);
        }

        return false;
    });

    $(".close").click(function () {
        LimparCampos();
    })

    $("#MainContent_dpCategoriaPai option[value='0']").remove();

})

function EditarCategoria(id, idPai, categoria) {
    $("#idCategoria").val(id);
    $("#MainContent_tbNovaCategoria").val(categoria);
    $("#MainContent_dpCategoriaPaiNova").val(idPai);

    $("#categoriaModal").modal("show");
}
function EditarTipo(id, idCategoria, tipo) {
    $("#idTipo").val(id);
    $("#MainContent_tbNovoTipo").val(tipo);
    $("#MainContent_dpCategoriaPai").val(idCategoria);

    $("#tipoModal").modal("show");
}

function LimparCampos() {
    $("#idCategoria").val("");
    $("#idTipo").val("");
    $("#MainContent_tbNovaCategoria").val("");
    $("#MainContent_tbNovoTipo").val("");
    $("#MainContent_dpCategoriaPai").val(0);
    $("#MainContent_dpCategoriaPaiNova").val(0);
}