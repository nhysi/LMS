UI.registerHelper "isAdmin", (p) ->
  Meteor.users.find({_id:Meteor.userId(),"profile.statue":"Admin"}).count()
UI.registerHelper "isProfessor", (p) ->
  Meteor.users.find({_id:Meteor.userId(),"profile.statue":"Professor"}).count()
UI.registerHelper "isStudent", (p) ->
  Meteor.users.find({_id:Meteor.userId(),"profile.statue":"Student"}).count()




