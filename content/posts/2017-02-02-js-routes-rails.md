+++
title = "Exposing Rails routes in JavaScript"
date = "2017-02-02"
+++

When building any REST based applications in Rails, it's common to create a `routes.js` or `paths.js` file containing URL helpers so your client side JavaScript components can render links or construct AJAX requests for the correct endpoint. For example:

{{< highlight javascript >}}
// routes.js
routes.buildUserProfileUrl("damian")
=> "/u/damian"

routes.buildConferenceAboutUrl("over-the-air")
=> "/over-the-air/about"

routes.buildBookmarkSessionUrl("over-the-air", "keynote")
=> "/over-the-air/speaker_sessions/keynote/bookmarks.json"
{{< / highlight >}}

I've never been too fond of this approach for a few reasons:

1. It's a cheap imitation of the logic that currently resides on the server
2. It's easy for it to get out of synch with server side route changes
3. It impacts your end users page performance as your application grows and you add more routes

Of course these URLs could be passed down in the JSON that used to populate the component, but that's always seemed pointless and wasteful to me as it means you end up duplicating data which ought to be only declared once. For example when exposing a collection of resources your having to send more data over the wire:

{{< highlight json >}}
{
  "speakers":[
    {
      "name": "Damian Nicholson",
      "profile": "https://www.conferize.com/u/damian"
    },
    {
      "name": "DHH",
      "profile": "https://www.conferize.com/u/dhh"
    }
  ]
}
{{< / highlight >}}

## JSRoutesRails

Late last year, I spent a couple of hours writing a new gem called [js-routes-rails](https://github.com/damian/js-routes-rails) which solves the first two problems I outlined above - poor duplication and synchronisation with the server.

It achieves this by declaring which of your routes you wanted exposed in your `config/routes.rb` with an `export: true` property:

{{< highlight ruby >}}
# config/routes.rb
resources :articles, export: true
resources :comments
resources :publishers, export: true do
  resources :magazines do
    resources :photos
  end
end
match "/about", to: "static#index", via: :get, export: true
{{< / highlight >}}

Note how this API works with both single routes and those declared as a block. Any child routes declared within the block syntax will also be exported.

At this point all you have to do is run the Rake task provided to generate a JavaScript library containing all of the routes you declared to be exported so they can be consumed in your client side code.

{{< highlight bash >}}
$ bundle exec rake js_routes_rails:export
{{< / highlight >}}

{{< highlight javascript >}}
JsRoutesRails.new_articles_path()
=> '/articles/new'

JsRoutesRails.edit_articles_path({ id: 23 })
=> '/articles/23/edit'

JsRoutesRails.edit_magazines_path({ publishers_id: 5, id: 9 })
=> '/publishers/5/magazines/9/edit'
{{< / highlight >}}

More documentation and configuration options can be found [on GitHub](https://github.com/damian/js-routes-rails).
