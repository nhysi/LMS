navRoutes = [
  new NavRoute('dashboard', 'fa-dashboard', {label: "Panneau de gestion"})
  new NavRoute('index', '', {isMainNav: false, redirect: 'dashboard'})
  new NavRoute('schools','fa-university',{label:"Ecoles"})
  new NavRoute('classroom', 'fa-users', {label: "Classes"})
  new NavRoute('course','fa-graduation-cap',{label:"Parcours"})
  new NavRoute('learn','',{label:"Parcours étudiant"})
  new NavRoute('activities','fa-puzzle-piece',{label:"Activités"})
  new NavRoute('professors','fa-user',{label:"Professeurs"})


  new NavRoute('charts', 'fa-bar-chart-o')
  new NavRoute('chart1', '', {parentName: 'charts'})
  new NavRoute('chart2', 'fa-bar-chart-o', {parentName: 'charts'})
  new NavRoute('tables', 'fa-table')
  new NavRoute('forms', 'fa-edit')
  new NavRoute('ui-elements', 'fa-wrench', {label: "UI Elements"})
  new NavRoute('buttons', '', {parentName: 'ui-elements'})
  new NavRoute('typography', '', {parentName: 'ui-elements'})
  new NavRoute('grid', '', {parentName: 'ui-elements'})
  new NavRoute('notifications', '', {parentName: 'ui-elements'})
  new NavRoute('panels-and-wells', '', {parentName: 'ui-elements', label: 'Panels and Wells'})
  new NavRoute('pages', 'fa-files-o', {label: "Sample Pages"})
  new NavRoute('blank', '', {parentName: 'pages', label: "Blank Page"})
  new NavRoute('sign-up-ref', '', {redirect: 'sign-up', parentName: 'pages', layoutTemplate: 'loginLayout', label: 'Sign Up'})
  new NavRoute('sign-up', '', {isMainNav: false, template: 'signUp', layoutTemplate: 'loginLayout'})
  new NavRoute('login', '', {isMainNav: false, template: 'loginModal', layoutTemplate: 'loginLayout', label: 'Login'})
  new NavRoute('', '', {isMainNav: false, template: 'home', layoutTemplate: 'loginLayout', label: 'Home'})
]
 

navRouteList = new NavRouteList(navRoutes)

Session.set('navRoots', navRouteList.rootNavRoutes)
