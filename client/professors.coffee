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
      # Meteor.call("createNewProfessor", param) => Lorsque sur serveur de prod avec envois mail
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
Template.professors.events({
  'click #edit': (e,t) ->
    console.log(@_id)
    Session.set("target",@_id)
  'keypress input':(e,t) ->
    if e.keyCode == 13 && e.currentTarget.value isnt ""
      lastname = t.find("#editLastname").value
      firstname = t.find("#editFirstname").value
      mail = t.find("#editMail").value
      #if mail != @mail
        #Accounts.sendVerificationEmail(@_id)
      Meteor.users.update({_id:Session.get("target")},{$set:{"profile.lastname":lastname,"profile.firstname":firstname,email:mail}})
      Session.set("target",0)
})
Template.professors.editing = ->
  Session.get("target") == @_id
