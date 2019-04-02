(function() {
  App.room = App.cable.subscriptions.create("RoomChannel", {
    connected: function() {},
    disconnected: function() {},
    received: function(data) {
      return alert(data["title"], {
        body: data["body"]
      });
    },
    speak: function(message) {
      return this.perform('speak', {
        message: message
      });
    }
  });

}).call(this);
