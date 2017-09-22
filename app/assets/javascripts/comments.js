$(function () {

  $('form#new_comment').on('ajax:success', function (event, response, status) {
    let $form = $(event.currentTarget);
    if (response.errors) {
      $('.comment-errors').html('');
      for (let field in response.errors) {
        let $el = $('<li></li>');
        let msg = field + ":";
        for (let i = 0; i < response.errors[field].length; i++) {
          msg += response.errors[field][i];
        }
        $el.text(msg);
        $el.appendTo($('.comment-errors'))
      }
    } else {
      let $el = $('<li></li>');
      $el.text(response.nick + ':' + response.text);
      $el.appendTo($("#commnets-list"));
      $form.find('[name="comment[text]"]').val('');
      $form.find('[name="comment[nick]"]').val(response.nick);
    }
  })

  /*  $('form#new_comment').submit(function (event) {
      let $form = $(event.currentTarget);

      let url = $form.attr('action');
      let method = $form.attr('method');
      $.ajax(url, {
        method: method,
        success: function (response) {
          if (response.errors) {
            $('.comment-errors').html('');
            for (let field in response.errors) {
              let $el = $('<li></li>');
              let msg = field + ":";
              for (let i = 0; i < response.errors[field].length; i++) {
                msg += response.errors[field][i];
              }
              $el.text(msg);
              $el.appendTo($('.comment-errors'))
            }
          } else {
            let $el = $('<li></li>');
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