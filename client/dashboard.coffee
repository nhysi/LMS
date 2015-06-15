Template.dashboard.helpers(
  school: () ->
    return SchoolsList.find({}).count()
  class: () ->
    return 0
  course: () ->
    return 0
  active: () ->
    return Meteor.users.find({"profile.statue":"student"}).count()
)
