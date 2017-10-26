// https://www.sitepoint.com/create-a-chat-app-with-rails-5-actioncable-and-devise/
// http://www.thegreatcodeadventure.com/rails-5-action-cable-with-multiple-chatroom-subscriptions/
// Future Jase, if ever you forget how the hell this stuff works, look at those sites. They're the tutorials you followed.
$(document).on('turbolinks:load', function() {
  submitNewMessage();
  let messages = $('#messages')

  // instantiate a new subscription to your back end.
  // each time you create a new room, it'll have a different chat-id.
  // Once your chat server receives a new message, it'll put it onscreen
  // the only thing this does is put messages on screen.
  App.global_chat = App.cable.subscriptions.create({
    channel: 'ChatRoomsChannel',
    chat_room_id: messages.attr('data-chat-room-id')}, {
    received: function(data) {
      return messages.append(data.message);
    }
  });

  // this is where the message is sent to the back end.
  function submitNewMessage(){
    $('#message-content').keydown(function(event) {
      if (event.keyCode === 13) {
        let msg = event.target.value
        let chatroomId = messages.attr('data-chat-room-id')
        App.global_chat.send({body: msg, chat_room_id: chatroomId})
        $('message-content').val(" ")
        return false;
      }
    });
  }
});
