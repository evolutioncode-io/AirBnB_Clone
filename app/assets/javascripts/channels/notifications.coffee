$(() ->
  App.notifications = App.cable.subscriptions.create {channel: "NotificationsChannel", id: $('#user_id').val() },
    received: (data) ->
      # Called when there's incoming data on the websocket for this channel
      $('#number_of_unread').html(data.unread)
      $('#notifications').prepend(data.message)
      $('#navbar_num_of_unread').html(data.unread)
)
