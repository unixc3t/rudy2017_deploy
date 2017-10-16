$(function () {
  $('a.delete-product').click(function (event) {
    $.ajax($(event.currentTarget).attr('href'), {
      method: 'DELETE', success: function () {
        window.location.href = window.location.href;
      }
    });
    return false;
  });

  $('a.remove-image').click(function (event) {
    let $target = $(event.currentTarget);
    let $block = $target.closest('.nested-fields');
    $block.find('._destroy').val("1");
    $block.hide();
    return false;
  });


  $(".add-more-image").click(function (event) {
    let $block = $('<div class="nested-fields"></div>');
    let $res = $block.append($($('.nested-fields')[0]).html());
    let datetemp=null;
    let count = 0;
    _.each($res.find('input'),function (elem) {

      let $elem = $(elem);
      let old_name = $elem.attr("name");
      let new_name =old_name.split('][');
      if (datetemp ===null && count !==1) {
        datetemp =Date.now();
      }

      new_name[1]=datetemp;
      new_name = new_name.join('][');
      console.log(new_name);
      $elem.attr("name",new_name);
      if(count ===1) {
        count = 0;
      }else{
        count++;
      }
    });
    $($res).insertAfter($(".nested-fields"));
    return false;
  });
});