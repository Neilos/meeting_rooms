// For more information see: http://emberjs.com/guides/routing/

App.Router.map(function() {
  this.resource('calendars', function(){
  });
});

App.CalendarsRoute = Ember.Route.extend({
  model: function() {
    return this.store.find('calendar');
  }
});
