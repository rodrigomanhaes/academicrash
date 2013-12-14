$(function() {
    $('.turma_check').on('change', function(e) {
        var $checkbox = $(this)
        var info = $checkbox.data('tableinfo');
        $tbody = $('#plano tbody');
        $.each(info.coordenadas, function(i, coordenada) {
             $td = $tbody.find('tr:nth-of-type(' +
                  coordenada.linha + ') td:nth-of-type(' +
                  coordenada.coluna + ')');
             $td.text($checkbox.prop('checked') ? info.conteudo : '');
        });
    });
});