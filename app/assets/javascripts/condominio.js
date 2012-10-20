
jQuery(function() {
    $("#btn-novo-mural").click(function() {
        $(".box-novo-mural").slideDown();
        return false;
    });

    $('.alert a.close').click(function(){
      var i = $(this);
      $.get("/aviso", { u: i.data('user'), a: i.data('id') } );
    });
});