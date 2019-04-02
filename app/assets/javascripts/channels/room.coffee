jQuery(document).on 'turbolinks:load', ->
  
  messages = $('#messages')


  App.room = App.cable.subscriptions.create {channel: "RoomChannel",id: messages.data('context')},
  connected: ->


  disconnected: ->


  received: (data) ->

    $('#messages').append data['message']
    
    
    notification = new Notification( data['message'])

  speak: (message) ->

    Notification.requestPermission()
    
    @perform 'speak', message: message
    
    
$(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
  if event.keyCode is 13 
    App.room.speak event.target.value
    event.target.value = ''
    event.preventDefault()