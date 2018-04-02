+++
title = "Ruby Date format gotcha"
date = "2010-12-12"
+++

Here's a little gotcha that I came across when parsing Date strings for insertion into a mysql date field.

{{< highlight ruby >}}

puts Date.parse('12/10/2010')
puts Date.parse('12/1/2010')

{{< / highlight >}}

In Ruby 1.8.7 you'll get the following output:

{{< highlight ruby >}}

2010-12-10
2010-12-01

{{< / highlight >}}

Though in Ruby 1.9.2 you'll get this:

{{< highlight ruby >}}

2010-10-12
2010-01-12

{{< / highlight >}}

A little Ruby date format gotcha to look out for, as it took me a little time to hunt this sucker down.
