+++
title = "jQuery inconsistencies"
date = "2011-12-05"
+++

Yesterday I discovered what **I thought to be a bug in jQuery**. See the snippet below which highlights the issue I ran in to.

{{< highlight javascript >}}
var textInputs = $('input:text'); // OK

var submitInputs = $('input:submit'); // OK

var checkboxInputs = $('input:checkbox'); // OK

var searchInputs = $('input:search'); // Syntax error, unrecognized expression: search
{{< / highlight >}}

This error is also thrown when trying to select any of the newer inputs introduced in HTML5 in a similar pseudo selector fashion.

Naturally I started looking through the [docs](http://api.jquery.com/) but couldn't find a mention anywhere regarding the new HTML5 inputs. Something which I found suprising considering how prevalent the use of HTML5 is now.

After some digging on Google, I unearthed [an old ticket](http://bugs.jquery.com/ticket/9132) on jQuery's bug tracker asking to support the above pseudo selector notation in order to maintain consistency across its API. However the **idea was shot down** due to the way older browsers handle inputs they can't interpret(they fallback to text fields) which is a fair argument.

What I don't understand is how the same selector wrote in a slightly different way **is supported**.

{{< highlight javascript >}}
var searchInputs= $('input[type=search]'); // OK
{{< / highlight >}}

There are three things I want out of an API:

-   Well tested
-   Well documented
-   Consistent

Now come on guys get onboard with the latter, either make this happen or deprecate pseudo selector support entirely.

**DISCLAIMER:** I still love jQuery.
