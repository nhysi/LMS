Meteor.startup(()->
  @SchoolsList = new Meteor.Collection("schools")
)
if(Meteor.isClient)
  Meteor.subscribe("schools")
