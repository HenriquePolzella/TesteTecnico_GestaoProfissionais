function bloquearNumeros(event) {
    var input = event.target;
    input.value = input.value.replace(/[^a-zA-ZÀ-ú\s]/g, ''); 
}

function bloquearLetras(event) {
    var input = event.target;
    input.value = input.value.replace(/\D/g, ''); 
}

function bloquearEspacos(event) {
    event.target.value = event.target.value.replace(/\s+/g, '');
}

function excluirProfissional(id, nome, tipoDocumento, numeroDocumento) {
    var textoModal = `Tem certeza que deseja excluir o profissional ${nome} (${tipoDocumento} ${numeroDocumento})? Essa ação não poderá ser desfeita!`;
    document.getElementById('modalTextoExcluir').innerText = textoModal;
    document.getElementById('profissionalId').value = id;
    $('#modalExcluir').modal('show');
}

function atualizarTipoDocumento() {
    const especialidadeSelect = document.getElementById("especialidadeSelect");
    const tipoDocumentoInput = document.getElementById("tipoDocumento");
    const tipoDocumento = especialidadeSelect.options[especialidadeSelect.selectedIndex].getAttribute("data-tipo");
    tipoDocumentoInput.value = tipoDocumento || "";
}

function atualizarTipoDocumentoEdicao() {
    const especialidadeSelect = document.getElementById("editarEspecialidade");
    const tipoDocumentoInput = document.getElementById("editarTipoDocumento");
    const tipoDocumento = especialidadeSelect.options[especialidadeSelect.selectedIndex].getAttribute("data-tipo");
    tipoDocumentoInput.value = tipoDocumento || "";
}

function CarregaProfissional(id, nome, especialidade, tipoDocumento, numeroDocumento) {
    document.getElementById("editarId").value = id;
    document.getElementById("editarNome").value = nome;
    document.getElementById("editarEspecialidade").value = especialidade;
    atualizarTipoDocumentoEdicao();
    document.getElementById("editarNumeroDocumento").value = numeroDocumento;
    new bootstrap.Modal(document.getElementById("modalEditar")).show();
}

document.addEventListener("DOMContentLoaded", function () {
    const alert = document.querySelector(".alert-dismissible");
    if (alert) {
        setTimeout(() => {
            alert.classList.remove("show");
            alert.classList.add("fade");
        }, 5000); // 5 segundos
    }
});