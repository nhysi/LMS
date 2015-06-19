Template.courseManagement.events({
  'click td': (e) ->
    Session.set("target",@_id._str)
})
Template.courseManagement.helpers({
  activities: () ->
    Activities.find()
 #current: () ->
  # if Session.get("target")
  #   Activities.find({"_id._str":Session.get("target")})
}) 
Template.courseManagement.include = ->
    Parcours.find({_id:Session.get("selected"),activities : { $elemMatch: {activitie_id:@_id} }})
 
Template.courseManagement.current = ->
  Session.get("target") == @_id._str

Template.myCourse.helpers({
  parcours : () ->
    Parcours.find({})
})
Template.myCourse.selected = ->
  Session.get("selected") == @_id
Template.myCourse.events({
  'click #check': () ->
    Session.set("selected",@_id)
})
