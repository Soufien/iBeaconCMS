$('#item_name').on('change', function(){
    if ($(this).val() == 'Template1' ) {
        $('.TemplatePhoto').removeClass('hide');
        $('.TemplateArticle').addClass('hide');
    }

    if ($(this).val() == 'Template2' ) {
        $('.TemplateArticle').removeClass('hide');
        $('.TemplatePhoto').addClass('hide');
    }

    if ($(this).val() == 'Template3' ) {
        $('.TemplateArticle').addClass('hide');
        $('.TemplatePhoto').addClass('hide');
    }
})