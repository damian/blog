+++
title = "From Jekyll to Hugo"
date = "2018-04-12"
+++

![Hugo logo](https://s3-eu-west-1.amazonaws.com/www.img.damiannicholson.com/Image_ik2u51eaxB.png)

After a few years of blogging using [Jekyll](https://jekyllrb.com/) it began to
lose its lustre. I think that's had a knock on effect in my desire to create new
content so I started looking for something new. It didn't take long before
finding [Hugo](https://gohugo.io) which piqued my interest because it's written
in [Go](https://golang.org), a programming language which boasts the following
attributes:

- strongly typed
- goroutines(concurrent functions)
- concise
- built in HTML templating support
- incredibly portable so all depenencies and code can be packaged as a binary
- excellent documentation

Because of all these things, Go seems a perfect match for creating site
generator, and as soon as I copied across my Markdown based posts in to the
directory that Hugo had set up, barring a few content tweaks my expectations
were surpassed! Site builds now take fractions of a second and I'm certainly not
going to miss having to install and set up Ruby, Bundler and Ruby Gems on any
new machines in the future.

![](https://s3-eu-west-1.amazonaws.com/www.img.damiannicholson.com/full-logo-light.png)

I also used this as an opportunity to revisit the hosting of my blog, which
previously sat in Amazon S3 behind Cloudfront using the [s3_website
gem](https://github.com/laurilehmijoki/s3_website). I'd heard good things about
[Netlify](https://www.netlify.com) and within minutes I was set up and off to
the races. Publishing an update to my live blog is as simple as running `git
push origin master` in to my GitHub repository and Netlify takes care of the
rest - happy days!
