Meteor.startup(()->
  @SchoolsList = new Meteor.Collection("schools")
  @Classes = new Meteor.Collection("classes")
  @Activities = new Meteor.Collection("activities")
)
if(Meteor.isClient)
  Meteor.subscribe("schools")
  Meteor.subscribe("classes")
  Meteor.subscribe("activities")
