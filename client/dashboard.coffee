Template.dashboard.helpers(
  school: () ->
    return Meteor.users.find({"profile.statue":"student"}).count()
  class: () ->
    return 0
  course: () ->
    return 0
  active: () ->
    return 0
)
