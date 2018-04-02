+++
title = "Google map api with ym4r"
date = "2010-11-02"
+++

In development, the application was working fine. And because the <a href="http://ym4r.rubyforge.org/">ym4r plugin</a> has yet to implement the Google maps api version 3, I made sure to include the appropriate api key for the domain in the config.

In production however, the page was failing. Fortunately <a href="http://hoptoadapp.com">Hoptoad</a> alerted me of the following error - `Ym4r::GmPlugin::AmbiguousGMapsAPIKeyException`.

It turns out that ym4r was having difficulty choosing a specific host in my gmaps_api_key.yml file, as I had multiple set up for the various domains the site is hosted on. To rectify this I ended up changing the declaration at the top of my layout file, which loads the google maps api into the page, from

{{< highlight ruby >}}
<%= GMap.header %>
{{< / highlight >}}

to

{{< highlight ruby >}}
<%= GMap.header(:with_vml => false, :host => request.host) %>
{{< / highlight >}}
