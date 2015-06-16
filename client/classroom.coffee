Template.classList.helpers(
  class : ()->
    return Classes.find({},{sort:{school:1,name:1}})
)
Template.addClass.events({
  'keypress input' : (e,t) ->
    if e.keyCode == 13
      name=t.find('#addName').value
      school=t.find('#addSchool').value
      school=SchoolsList.find({_id:school}).fetch()[0].name
      if(school)
        Classes.insert({name:name,school:school})
        $('#addName').val('')
        $('#addSchool option[value=\'empty\']').prop('selected',true)

})
Template.showClass.helpers(
  schools : ()->
    return SchoolsList.find({})
  checked : ()->
    name = Classes.find({_id:Session.get("target")}).fetch()[0].school
    return @name == name
)
Template.showClass.events({
  'click #edit': (e, t) ->
    console.log(@_id)
    Session.set("target",@_id)
  'keypress input': (e,t)->
    if e.keyCode == 13 && e.currentTarget.value isnt ""
      name = $('#editName').val()
      school = $('#editSchool').val()
      school=SchoolsList.find({_id:school}).fetch()[0].name
      console.log(name)
      Classes.update({_id:this._id},{ $set: name: name, school: school})
      Session.set("target",0)
})
Template.showClass.editing = ->
  Session.get("target") == @_id
Template.addClass.helpers(
  schools : ()->
    return SchoolsList.find({})
)
Template.currentClass.events({
  'keypress input': (e, t) ->
    if e.keyCode == 13
      lastname = t.find('#lastname').value
      firstname = t.find('#firstname').value
      username = t.find('#name').value
      password = t.find('#pass').value
      $('#lastname').attr('for','inputError')
      Accounts.createUser({username: username, password: password, profile: {statue: 'student', firstname:firstname, lastname:lastname}}, (err) ->
        if err?
          Session.set('signUpErrorMessage', 'Impossible d\'ajouter l\'élève: '+ err.reason)
          console.log(err.reason)
        else
          Session.set('signUpSuccessMessage', 'Ajout réussit.')
          console.log('ajouté')
          Meteor.setTimeout(( ->
            Session.set('signUpSuccessMessage', false)
          ),500)
          $('#lastname').val('')
          $('#firstname').val('')
          $('#name').val('')
          $('#pass').val('')
      )
      return false
})

Template.currentClass.helpers(
  students: ()->
    return Meteor.users.find({"profile.statue":'student'},{sort:{"profile.lastname":1,"profile.firstname":1}})
)
