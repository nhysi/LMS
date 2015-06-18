Template.courseManagement.events({
  'click td': (e) ->
    Session.set("target",@_id._str)
})
Template.courseManagement.helpers({
  activities: () ->
    console.log(Activities.find().fetch())
    Activities.find()
  #current: () ->
  # if Session.get("target")
  #   Activities.find({"_id._str":Session.get("target")})
})
Template.courseManagement.current = ->
  Session.get("target") == @_id._str
