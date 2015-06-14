Template.professors.helpers(
  professors: ()->
    return Meteor.users.find({})
    return Meteor.users.find({"profile.statue":"professor"})
)
