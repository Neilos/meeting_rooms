// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require d3
//= require bootstrap
//= require handlebars
//= require ember
//= require ember-data
//= require infinite-scroll
//= require_self
//= require store
//= require router
//= require_tree ./routes
//= require_tree ./controllers
//= require_tree ./models
//= require_tree ./templates
//= require_tree ./views
//= require_tree .

// for more details see: http://emberjs.com/guides/application/
App = Ember.Application.create({
  LOG_TRANSITIONS: true,
  rootElement: '#ember-app'
});

// add some fixture data
App.CalendarAdapter = DS.FixtureAdapter.extend({
  namespace: 'calendars'
});


