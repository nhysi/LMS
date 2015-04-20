Template.courseManagement.events({
  'click td': (e) ->
    console.log(e.currentTarget.parentNode.id)
})
