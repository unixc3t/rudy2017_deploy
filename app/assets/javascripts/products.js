$(function () {
  $('a.delete-product').click(function (event) {
    $.ajax($(event.currentTarget).attr('href'), {
      method: 'DELETE', success: function () {
        window.location.href = window.location.href;
      }
    });
    return false;
  })
});