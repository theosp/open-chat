Meteor.subscribe "messages", 10

Session.set "user_name", "Guest-#{Math.floor(Math.random()*9000) + 1000}"

Messages.before.insert (userId, doc) ->
  doc.author = Session.get("user_name")

Template.message_input.events {
  "click button": () ->
    message = $("#btn-input").val()

    if message.lenght != 0
      Messages.insert {content: message}
      message = $("#btn-input").val("")
}

Template.messages.helpers({
  messages: () ->
    Messages.find({}, {sort: {created: 1}})
})

Template.set_nickname.helpers({
  nickname: () ->
    Session.get "user_name"
})

Template.set_nickname.events {
  "click button": () ->
    Session.set "user_name", $("#nickname-input").val()
}
