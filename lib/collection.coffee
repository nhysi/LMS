Meteor.startup(()->
  @SchoolsList = new Meteor.Collection("schools")
  @Classes = new Meteor.Collection("classes")
)
if(Meteor.isClient)
  Meteor.subscribe("schools")
  Meteor.subscribe("classes")
