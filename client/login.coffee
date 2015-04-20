Template.loginForm.events({
  'submit #login-form': (e, t) ->
    e.preventDefault()
    Session.set('loginErrorMessage', false)
    email = t.find('#login-email').value
    password = t.find('#login-password').value
    Meteor.loginWithPassword(email, password, (err) ->
      if err?
        Session.set('loginErrorMessage', 'Connexion impossible: ' + err.reason)
      else
        if (Router.current().route._path == '/login')
          Router.go('/dashboard')
      return false
    )
  'click #sign-up-button': () ->
    Router.go('/sign-up')
    return false
})

Template.signUp.events({
  'submit #sign-up-form': (e, t) ->
    e.preventDefault()
    Session.set('signUpErrorMessage', false)
    Session.set('signUpSuccessMessage', false)
    email = t.find('#login-email').value
    password = t.find('#login-password').value
    Accounts.createUser({email, password}, (err) ->
      if err?
        Session.set('signUpErrorMessage', 'Inscription impossible: ' + err.reason)
      else
        Session.set('signUpSuccessMessage', 'Inscription réussie.')
        Meteor.setTimeout(() ->
          Session.set('signUpSuccessMessage', false)
          Router.go('/dashboard')
        , 500)
    )
    return false

  'click #login-button': () ->
    Router.go('/login')
    return false
})

Template.signUp.helpers(
  errorMessage: () ->
    return Session.get('signUpErrorMessage')

  signUpSuccessMessage: () ->
    return Session.get('signUpSuccessMessage')
)

Template.loginForm.helpers(
  errorMessage: () ->
    return Session.get('loginErrorMessage')

  currentUserMessage = () ->
    if Meteor.user()
      return 'Connecté en temps que: ' + Meteor.user().emails[0].address
    else
      return false
)
