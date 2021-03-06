+++
title = "Abusing JavaScript Frameworks"
date = "2009-12-03"
+++

Tools like [jQuery](http://jquery.com/) and <a href="http://mootools.net/">MooTools</a> make traversing and manipulating the DOM incredibly easy. So easy that you can get carried away with it sometimes. I have fallen down this trap more than once in my career as a web developer.

Here's an excerpt from an article I stumbled across entitled <a href="http://pinoytech.org/blog/post/Add-Icons-to-External-Links-with-Mootools-and-CSS">Add Icons to External Links with Mootools and CSS</a>.

{{< highlight javascript >}}
window.addEvent('domready',function() {
  $$('a').each(function(link) {
    if (link.hostname != window.location.host) {
      link.addClass('external');
    }
  });
});
{{< / highlight >}}

Pretty basic stuff - iterating through all the anchors on the page and adding a class if the current link goes to an external site.

Whether this is apparent to the author I don't know, but the same effect can be achieved using *only CSS*.

{{< highlight css >}}
a[href^='http://'] { /* styling */ }
{{< / highlight >}}

*Note:* the solution I pointed out here isn't anything new. <a href="http://www.w3.org/TR/CSS21/selector.html#attribute-selectors">CSS attribute selectors</a> have been around since CSS2.1, and so are are supported in all major browsers bar <a href="http://www.bringdownie6.com/">one</a>(no prizes for those who get this right).

Whilst this example is low impact, I've come to the conclusion that the underlying principle is one which creeps up on a lot designers and developers who get the JS fever.

> JavaScript libraries are an easy fall back for front-end problems which can't be solved quickly.

My personal opinion to problems I can't solve is that the use of JavaScript libraries should be a <em>last resort</em>.

Sometimes people are too lazy to tackle front-end problems head on. In my experience it's worth the effort researching a possible solution, as it makes you think about the problem and  define it more clearly. Most of the time you find yourself in one of the following situations, none of which are bad.

* You've thought about it a bit and realise it's very similar to a problem you've faced in the past.
* You find an alternative, in which case you've learnt something new.
* There isn't an alternative, in which case you've picked up some new knowledge along the way and realised that your solution was optimal. Pat yourself on the back.
