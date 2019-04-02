(function() {
  jQuery(document).on('turbolinks:load', function() {
    var messages;
    messages = $('#messages');
    return App.room = App.cable.subscriptions.create({
      channel: "RoomChannel",
      id: messages.data('context')
    }, {
      connected: function() {},
      disconnected: function() {},
      received: function(data) {
        $('#messages').append(data['message']);
        return alert('新着メッセージがあります');
      },
      speak: function(message) {
        return this.perform('speak', {
          message: message
        });
      }
    });
  });

  $(document).on('keypress', '[data-behavior~=room_speaker]', function(event) {
    if (event.keyCode === 13) {
      App.room.speak(event.target.value);
      event.target.value = '';
      return event.preventDefault();
    }
  });

}).call(this);
