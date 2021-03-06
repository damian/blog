+++
title = "Why I Use Haml"
date = "2011-04-19"
+++

If you'd asked me six months ago my stance on alternative templating engines, you would have heard me say something along the lines of 'I can't see the point in them. Why do I need to learn another DSL when I'm perfectly comfortable writing ERB.' To be fair, I bet a lot of developers still feel the same way.

If you were to ask me that question now however, my answer would be completely different. That's right, I'm a convert. My off the cuff views on templating frameworks have turned full circle.

How did this happen? Let me explain.

About a month ago I was scanning through my feeds when I came cross [yet another blog post](http://ramden.com/blog/2011/03/31/haml-and-sass-where-have-you-been-before/) outlining the benefits of [Haml](http://haml-lang.com/). For a long time I couldn't quite understand why so many [luminaries](http://blog.obiefernandez.com/content/2008/01/are-you-using-h.html) I admired in the Rails world were opting to **only use Haml** on their projects.

I decided enough was enough, and I had to give Haml a try. Though rather than starting a fresh project, I decided I wanted to give it a try out on this here blog(my test bed for most new stuff I want to try out). I thought this was an ideal approach as it's a real world Rails app in production, so I had a benchmark of what the finished product should be like. It also meant that I could merge my Haml feature branch in to master, should I prefer it in the long run(which is what I ended up doing).

### Converting Erb to Haml

Fortunately, the task of converting my ERB views to Haml was straight forward as I found a handy [rake script](http://screencasts.org/episodes/using-haml-with-rails-3) to take care of this. I honestly thought this step would have taken longer, but I was up an running with Haml in a couple of minutes.

### Erb vs Haml

Once I started digging in the code, it immediately became apparent to me as to why Haml has received so much attention over the past year or two. Simply because **HAML RAWKS** and here's my attempt to explain why.

### Haml is very lean and concise

So lean that most of my template files were reduced by at least a third in size. In some cases more like 50 − 60%. And the original markup was already lean to begin with. Check out my main layout file - it used to be 70 lines long, now it's half that(I've taken out the includes for brevity).

{{< highlight haml >}}
%body#body{:class => body_classes}
  .container_12
    %header
      %h1
        %a{:href => root_path }><
          damiannicholson
          %span.strapline web developer // diet coke drinker // master mitigator
    #main.grid_7.alpha
      = yield
    %aside#right.grid_4.push_1.omega
      = render :partial => 'other/bio'
      = yield :sidebar_right
  %footer
    = render :partial => "streams/stream", :collection => @stream, :as => :stream
    #footer-bottom
      .container_12
        %p
          Site built and designed by Damian Nicholson. Powered by Ruby on Rails. //
          %a#scrollto{:href => "#body"} Top
{{< / highlight >}}

### Expressive and easy to digest

This is a byproduct of Haml being so lean in my opinion - it's easy to get a good overview of a template in a glance, even if your not familiar with the project. Far easier to absorb than its ERB counterpart which can quite easily become tag soup, especially in larger files like layouts.

### Less typing

Which means that you can spend more time building stuff that matters - my only niggle is that it I'm always shifting for the percentage key(would be nice if this could be mapped to something else like [Slim](https://github.com/stonean/slim(which) is also awesome btw).

### Easy to spot code smell

Because Haml is concise, it's easy to spot code that's doing too much. Therefore moving this logic in to helpers seems to be a natural side effect of the framework itself. I can only see this as a good thing, as it makes refactoring easier.

### Works even better in a team environment

Personal HTML style and formatting practices become obsolete as everyone has to adhere to the same standard. That way everyone writes code which is maintainable.

### Performant

Production mode is all about performance as the outputted HTML is stripped of formatting or indenting by default. I like this.

### Conclusion

> Stop using the slow, repetitive, and annoying templates that you don't even know how much you hate yet.

This was taken directly from the Haml homepage, and I can certainly relate to the message that's being conveyed. If anything I hope this post encourages a few readers to take a look at [Haml](http://haml-lang.com/), and how it's been a great addition to my development toolkit.
