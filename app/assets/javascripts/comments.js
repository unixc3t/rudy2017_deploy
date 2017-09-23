$(function () {

  $('form#new_comment').on('ajax:success', function (event, response, status) {
    if (response.errors) {
      $('.comment-errors').html('');
      for (var field in response.errors) {
        var $el = $('<li></li>');
        var msg = field + ":";
        for (var i = 0; i < response.errors[field].length; i++) {
          msg += response.errors[field][i];
        }
        $el.text(msg);
        $el.appendTo($('.comment-errors'));
      }
    } else {
      var $el = $('<li></li>');
      $el.text(response.nick + ':' + response.text);
      $el.appendTo($("#commnets-list"));
      var zz = $(event.currentTarget);
      zz.find('[name="comment[text]"]').val('');
      zz.find('[name="comment[nick]"]').val(response.nick);
    }
  })

  /*  $('form#new_comment').submit(function (event) {
      var $form = $(event.currentTarget);

      var url = $form.attr('action');
      var method = $form.attr('method');
      $.ajax(url, {
        method: method,
        success: function (response) {
          if (response.errors) {
            $('.comment-errors').html('');
            for (var field in response.errors) {
              var $el = $('<li></li>');
              var msg = field + ":";
              for (var i = 0; i < response.errors[field].length; i++) {
                msg += response.errors[field][i];
              }
              $el.text(msg);
              $el.appendTo($('.comment-errors'))
            }
          } else {
            var $el = $('<li></li>');
            $el.text(response.nick + ':' + response.text);
            $el.appendTo($("#commnets-list"));
            $form.find('[name="comment[text]"]').val('');
            $form.find('[name="comment[nick]"]').val(response.nick);
          }

        },
        data: {
          comment: {
            nick: $form.find('[name="comment[nick]"]').val(),
            text: $form.find('[name="comment[text]"]').val()
          }
        }
      });
      return false;
    });*/
});