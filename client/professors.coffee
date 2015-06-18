Template.professors.helpers(
  professors: ()->
    return Meteor.users.find({"profile.statue":"professor"}).map (p,index)->
      p.index = index+1
      p
)
Template.addProfessor.events({
  'keypress input': (e,t) ->
    if e.keyCode == 13
      lastname= t.find("#lastname").value
      firstname= t.find("#firstname").value
      mail= t.find("#mail").value
      Accounts.createUser({email: mail, password:'InitialPassword', profile:{statue: 'professor', firstname:firstname, lastname:lastname}}, (err)->
      if err?
        Session.set('signUpErrorMessage', 'Impossible d\'ajouter le professeur : '+err.reason)
        console.log(err.reason)
      else
        Session.set('signUpSuccessMessage','Ajout Réussit.')
        console.log("réussit")
      $('#lastname').val('')
      $('#firstname').val('')
      $('#mail').val('')
      )
      return false
})
