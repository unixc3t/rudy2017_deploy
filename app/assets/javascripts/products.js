$(function () {
  $('a.delete-product').click(function (event) {
    $.ajax($(event.currentTarget).attr('href'), {
      method: 'DELETE', success: function () {
        window.location.href = window.location.href;
      }
    });
    return false;
  });

  $('a.remove-image').click(function(event){
    let $target = $(event.currentTarget);
    let $block = $target.closest('.nested-fields');
    $block.find('._destroy').val("1");
    $block.hide();
    return false;
  })

});