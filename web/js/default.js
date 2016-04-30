var certas = 0;
var erradas = 0;
var count = $('fieldset').length - 2;

$(function(){
    $.ajax({
        url: "/models/estados.json",
    }).done(function(data) {
        for (var i = 0; i <= count; i++) {
            respostas(i, getRandomInt(0,count), data);
            shuffle(i);
        }
    });
    $('form')[0].reset();
    $('#msform').fadeIn();
    $('input[type=radio]').attr('disabled', false);

    $('.submit').click(function(e){
        var p = this.name.match(/\d+/)[0];
        var check = $('#pergunta'+p+'check').val();
        var resposta = $('#pergunta'+p+'resposta').val();
        var alternativa = $('input[name=pergunta'+p+']:checked').val();

        if(alternativa != undefined){
            $.ajax({
                url: "/validation/"+check+"/"+resposta+"/"+alternativa,
            }).success(function(data){
                $('input[name=pergunta'+p+']:checked').before('<i class="fa fa-check fa-lg success"></i>');
                certas++;
            }).fail(function() {
                $('input[name=pergunta'+p+']:checked').before('<i class="fa fa-ban fa-lg error"></i>');
                erradas++;
            }).always(function(){
                $('.respostas'+p+' input[type=radio]').attr('disabled',true);
                $('#pergunta'+p+' .controls').css('visibility', 'visible');
                $('.certas span').text(certas);
                $('.erradas span').text(erradas);
            });
        }
    });
});
function respostas(p, rand, data) {
    var complemento = $('#pergunta'+p+'complemento').val().split(':');
    var resposta = $('#pergunta'+p+'resposta').val();
    var replace = data[rand][complemento[0]];

    $('#pergunta'+p+'check').val(data[rand]['id']);

    var title = $('#pergunta'+p+' .fs-title').text();
    if(complemento.length > 1) {
        title = title.replace('@'+complemento[0], '<img src="'+replace+'"/><br>');
        $('#pergunta'+p+' .fs-title').html(title);
    } else {
        title = title.replace('@'+complemento[0], replace);
        $('#pergunta'+p+' .fs-title').text(title);
    }
    var respostas = [];
    i = 1;
    while (i <= 4) {
        if($.inArray(rand, respostas) == -1){
            $('#pergunta'+p+'a'+i).val(data[rand][resposta]);
            $('label[for=pergunta'+p+'a'+i+']').text(data[rand][resposta]);
            respostas.push(rand);
            i++;
        }
        rand = getRandomInt(0, 4);
    }
}
function getRandomInt(min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
}
function shuffle(p) {
    var parent = $(".respostas"+p);
    var divs = parent.children();
    while (divs.length) {
        parent.append(divs.splice(Math.floor(Math.random() * divs.length), 1)[0]);
    }
}
