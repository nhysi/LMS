Template.professors.helpers(
  professors: ()->
    return Meteor.users.find({"profile.statue":"professor"}).map (p,index)->
      p.index = index+1
      p
)
