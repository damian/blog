+++
title = "Ruby Gem: Cineworld"
date = "2011-04-29"
+++

I released my first ruby gem, [cineworld](https://rubygems.org/gems/cineworld) in to the wild a couple weeks ago. I'll be honest most of the heavy lifting was done by [httparty](https://github.com/jnunemaker/httparty), but it was a learning experience nonetheless. Hat tip to [jeweler](https://github.com/technicalpickles/jeweler) also.

Unsurprisingly it's a simple wrapper around the [Cineworld API](https://www.cineworld.co.uk/developer), which is able to pull back cinema listings, film showings and performances from Cineworld venues around the country. Check it out on [github](https://github.com/damian/cineworld) or start using it now by following the instructions below.

### Installation

{{< highlight ruby >}}
gem install cineworld
{{< / highlight >}}

### Examples

{{< highlight ruby >}}
# Initialise with your API key
cineworld = Cineworld::API.new('API_KEY')

# Get all cinemas that have programmed performances
puts cineworld.cinemas

# Get all films that have programmed performances
puts cineworld.films

# Get all dates that have programmed performances
puts cineworld.dates

# Get all performances that are programmed for a particular cinema, film and date
puts cineworld.performances
{{< / highlight >}}

Let me know in the comments if you find it useful, or if you want to contribute a patch, please do so on [GitHub](https://github.com/damian/cineworld).
