Messages.before.insert (userId, doc) ->
  doc.created = Date.now()

Meteor.publish "messages", (log_size) ->
  log_size = Math.min(parseInt(log_size, 10), 100)

  return Messages.find({}, {sort: {created: -1}, limit: log_size})
