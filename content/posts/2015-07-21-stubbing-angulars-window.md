+++
date = "2015-07-21"
layout = "post"
title = "Stubbing AngularJS $window"

+++

It's [sometimes useful](https://docs.angularjs.org/guide/$location#what-does-it-not-do-) to be able to perform a page redirect using AngularJS low-level [$window API](https://docs.angularjs.org/api/ng/service/$window).

What's not ideal is when this behaviour needs testing and the sucker actually performs a redirect half way through your suite leaving you in limbo -- not cool!

This is where AngularJS liberal use of Dependency Injection(DI) really helps as we can utilise its inbuilt [$provide service](https://docs.angularjs.org/api/auto/service/$provide) to stub out `$window` and overcome the issue.

Below is an example of how I achieved this in Jasmine / CoffeeScript:

{{< highlight coffeescript >}}
ctrl = scope = $window = null

beforeEach ->
  module 'my_module', ($provide) ->
    $provide.constant '$window', { location: { href: "dummy" } }

  inject ($rootScope, $controller, _$window_) ->
    scope = $rootScope.$new()
    $window = _$window_
    ctrl  = $controller 'MyController', $scope: scope

it "should redirect to '/some-other-url'", ->
  expect($window.location.href).toEqual("dummy")
  scope.myMethodWhichRedirects()
  expect($window.location.href).toEqual("some-other-url")
{{< / highlight >}}
