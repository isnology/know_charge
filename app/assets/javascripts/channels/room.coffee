window.App.Channels ||= {}
window.App.Channels.Room ||= {}

App.Channels.Room.subscribe = (roomName) ->
  App.cable.subscriptions.create {channel: "RoomChannel", room: roomName},
    connected: ->
# Called when the subscription is ready for use on the server

    disconnected: ->
# Called when the subscription has been terminated by the server

    received: (data) ->
      unless data.message.blank?
        me = $('body').data('id-name')                        # get my id from form body data attribute
        pos = data.message.search('id="justify"')             # find a known position in message
        tag = data.message.charAt(pos + 20)                   # get the id from the message class
        if (me == tag)                                        # change the class to reflect who's message
          new_class = 'class="m-right"'
        else
          new_class = 'class="m-left"'
        old_class = data.message.substring(pos + 13, pos + 22) # extract the original class (for replacement)
        $('#messages-table').append data.message.replace(old_class, new_class)  # add new amended message to table
        scroll_bottom()

$(document).on 'turbolinks:load', ->
  return unless $(".messages.index").length > 0
  App.Channels.Room.subscribe($('body').data('room-name'))
  enter_message()
  submit_message()
  scroll_bottom()

enter_message = ->
  $('#msgtextarea').on 'keydown', (event) ->
    if (event.keyCode is 13 && event.shiftKey)
      $('#btnsubmit').click()
      event.target.value = ""
      event.preventDefault()

submit_message = ->
  $('#sendmsg').on 'submit', (event) ->
    event.preventDefault()
    $('#sendmsg').bind 'ajax:beforeSend', (event, xhr, status) ->
      $('#msgtextarea').val ''
      return

scroll_bottom = () ->
  $('#messages-win').scrollTop($('#messages-win')[0].scrollHeight)