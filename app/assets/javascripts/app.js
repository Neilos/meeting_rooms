// Define the Infinite Scroll route actions
// separately so it's easier to see what
// other actions the IndexRoute ends up using
App.InfiniteScrollRouteActions = {
  getMore: function(){
    var controller = this.get('controller'),
        nextPage   = controller.get('page') + 1,
        perPage    = controller.get('perPage'),
        that       = this,
        items      = [];

    // simulate latency
    Ember.run.later( function() {
      items = that.send('fetchPage', nextPage, perPage);
    }, 500);
    
  },

  fetchPage: function(page, perPage){
    var items = Em.A([]);
    var firstIndex = (page-1) * perPage;
    var lastIndex  = page * perPage;

    for (var i = firstIndex; i < lastIndex; i++) {
      items.pushObject({name:''+i});
    }
    this.get('controller').send('gotMore', items, page);
  }
};

App.IndexRoute = Ember.Route.extend({
  model: function(){
    var items = Em.A([]);
    for (var i = 0; i < 15; i++) {
      items.pushObject({name: ''+i});
    }
    return items;
  },
  actions: $.extend({}, App.InfiniteScrollRouteActions, 
  {
    // put other non infinite-scroll related actions here.
  })
});

App.IndexController = Ember.ArrayController.extend(
  InfiniteScroll.ControllerMixin,
  {
    page: 1,
    perPage: 10
  }
);

App.IndexView = Ember.View.extend(
  InfiniteScroll.ViewMixin, 
  {
    didInsertElement: function(){
      this.setupInfiniteScrollListener();
    },
    willDestroyElement: function(){
      this.teardownInfiniteScrollListener();
    }
  }
);