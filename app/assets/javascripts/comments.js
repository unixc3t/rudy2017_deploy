$(function () {

  window.PusherClient = new Pusher('7240c197276039427b1c', {
    cluster: 'us2',
    encrypted: true
  });


  let channel = PusherClient.subscribe('broadcast');
  channel.bind('comments.new', function (comment) {

    let $comments_list = $('#comments-list');
    let current_user_id = $comments_list.data('current_user_id');
    let product_id = $comments_list.data('product_id');
    if ($comments_list.length) {

      if (product_id !== comment.product_id) {
        return;
      }

      let el = $('<li data-comment_id="' + comment.id + '"></li>');
      el.text(comment.nick + ':' + comment.text);
      if (current_user_id === comment.user_id) {
        let rm_link = $('<a class="btn btn-warning" data-remote="true" rel="nofollow" data-method="delete" href="/products/' + product_id + '/comments/' + comment.id + '">Remove</a>');
        el.append(rm_link);
      }

      el.appendTo($comments_list);
    }
  });

  channel.bind('comments.destroy', function (comment) {
    let $comments_list = $('#comments-list');
    let product_id = $comments_list.data('product_id');
    if ($comments_list.length) {

      if (product_id !== comment.product_id) {
        return;
      }

      $comments_list.find('li[data-comment_id="' + comment.id + '"]').remove();
    }
  });
  /* window.WsClient = new WebSocket('ws://localhost:8080');
   WsClient.onmessage = function (response) {
     let response_data = JSON.parse(response.data);

     let $comments_list = $('#comments-list');
     let current_user_id = $comments_list.data('current_user_id');
     let product_id = $comments_list.data('product_id');
     console.log(response_data.action);

     if ((response_data.action === 'comments.new') && $comments_list.length) {

       if (product_id !== response_data.data.product_id) {
         return;
       }

       let el = $('<li data-comment_id="'+response_data.data.id+'"></li>');
       el.text(response_data.data.nick + ':' + response_data.data.text);
       if (current_user_id === response_data.data.user_id) {
         let rm_link = $('<a class="btn btn-warning" data-remote="true" rel="nofollow" data-method="delete" href="/products/' + product_id + '/comments/' + response_data.data.id + '">Remove</a>');
         el.append(rm_link);
       }

       el.appendTo($comments_list);
     } else if ((response_data.action === 'comments.destroy') && $comments_list.length) {

       console.log(response_data);
       if (product_id !== response_data.data.product_id) {
         return;
       }

       $comments_list.find('li[data-comment_id="' + response_data.data.id + '"]').remove();
     }

   };*/


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
    }
    /*else {
         // var $el = $('<li></li>');
         // $el.text(response.nick + ':' + response.text);
         // $el.appendTo($("#commnets-list"));
         var zz = $(event.currentTarget);
         zz.find('[name="comment[text]"]').val('');
         zz.find('[name="comment[nick]"]').val(response.nick);
       }*/
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