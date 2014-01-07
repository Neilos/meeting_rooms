App.IndexController = Ember.ArrayController.extend(
  InfiniteScroll.ControllerMixin,
  {
    page: 1,
    perPage: 10
  }
);