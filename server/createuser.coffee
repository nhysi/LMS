Meteor.methods createNewProfessor: (email,firstname,lastname) ->
  userId = Accounts.createUser(
    email: email
    profile:{statue:'professor',firstname:firstname,lastname:lastname}
    password: 'initialPassword')
  Accounts.sendEnrollmentEmail userId
