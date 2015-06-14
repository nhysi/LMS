Template.classroom.events({
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

Template.classroom.helpers(
  students: ()->
    return Meteor.users.find({"profile.statue":'student'},{sort:{"profile.lastname":1,"profile.firstname":1}})
)
