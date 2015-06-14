Template.schools.events({
  'keypress input': (e,t)->
    if e.keyCode == 13
      name = t.find('#name').value
      address = t.find('#adresse').value

      SchoolsList.insert({name:name,address:address})
      $('#name').val('')
      $('#adresse').val('')
      return false
  'click #edit': (e, t) ->
    console.log(this._id)
    Session.set("target",this._id)
  'keypress input': (e,t) ->
    if e.keyCode == 13 && e.currentTarget.value isnt ""
      name = $('#ename').val()
      address = $('#eadresse').val()
      SchoolsList.update {_id: this._id}, { $set: name: name,address:address}
      Session.set("target",0)
})
Template.school.editing = ->
  Session.get("target") == @_id
Template.schools.helpers(
  schools: () ->
    return SchoolsList.find()
)
