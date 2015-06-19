if Meteor.users.find({_id:Meteor.userId(),"profile.statue":"Admin"}).count()
  console.log("admin")
  Session.set("statue","Admin")
  navRoutes = [
    new NavRoute('dashboard', 'fa-dashboard', {label: "Panneau de gestion"}) 
    new NavRoute('schools','fa-university',{label:"Ecoles"})
    new NavRoute('course','fa-graduation-cap',{label:"Parcours"})
    new NavRoute('professors','fa-user',{label:"Professeurs"})


    new NavRoute('sign-up', '', {isMainNav: false, template: 'signUp', layoutTemplate: 'loginLayout'})
    new NavRoute('login', '', {isMainNav: false, template: 'loginModal', layoutTemplate: 'loginLayout', label: 'Login'})
    new NavRoute('', '', {isMainNav: false, template: 'home', layoutTemplate: 'loginLayout', label: 'Home'})
  ]
else if Meteor.users.find({_id:Meteor.userId(),"profile.statue":"Professor"}).count() == 0
  navRoutes = [
    new NavRoute('dashboard', 'fa-dashboard', {label: "Panneau de gestion"})
    new NavRoute('index', '', {isMainNav: false, redirect: 'dashboard'})
    new NavRoute('schools','fa-university',{label:"Ecoles"})
    new NavRoute('classroom', 'fa-users', {label: "Classes"})
    new NavRoute('course','fa-graduation-cap',{label:"Parcours"})
    new NavRoute('learn','fa-puzzle-piece',{label:"Parcours étudiant"})


    new NavRoute('sign-up', '', {isMainNav: false, template: 'signUp', layoutTemplate: 'loginLayout'})
    new NavRoute('login', '', {isMainNav: false, template: 'loginModal', layoutTemplate: 'loginLayout', label: 'Login'})
    new NavRoute('', '', {isMainNav: false, template: 'home', layoutTemplate: 'loginLayout', label: 'Home'})
  ]
else if Meteor.users.find({_id:Meteor.userId(),"profile.statue":"Student"}).count()
  navRoutes = [
    new NavRoute('learn','fa-puzzle-piece',{label:"Parcours étudiant"})


    new NavRoute('sign-up', '', {isMainNav: false, template: 'signUp', layoutTemplate: 'loginLayout'})
    new NavRoute('login', '', {isMainNav: false, template: 'loginModal', layoutTemplate: 'loginLayout', label: 'Login'})
    new NavRoute('', '', {isMainNav: false, template: 'home', layoutTemplate: 'loginLayout', label: 'Home'})
  ]
else
  console.log("rien")
  navRoutes= [
    new NavRoute('sign-up', '', {isMainNav: false, template: 'signUp', layoutTemplate: 'loginLayout'})
    new NavRoute('login', '', {isMainNav: false, template: 'loginModal', layoutTemplate: 'loginLayout', label: 'Login'})
    new NavRoute('', '', {isMainNav: false, template: 'home', layoutTemplate: 'loginLayout', label: 'Home'})
  ]

navRouteList = new NavRouteList(navRoutes)

Session.set('navRoots', navRouteList.rootNavRoutes)
