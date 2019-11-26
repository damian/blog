+++
date = "2014-03-17"
layout = "post"
title = "CoffeeScript round two"

+++

<img width="594px" src="https://farm4.staticflickr.com/3017/2555556885_6a1b81a97f_z.jpg" alt="Coffee cupt" />

[Photo credit](http://www.flickr.com/photos/lwy/2555556885/)

My [original take on CoffeeScript](/2011/07/24/my-take-on-coffeescript.html) wasn't exactly favourable. For those who aren't interested in reading that article the crux of my argument is this:

> CoffeeScript doesn't solve enough of a problem to warrant it's use

Well I'm happy to say that my opinion on this matter has changed. I now firmly believe CoffeeScript _does solve_ a number of important problems to warrant its use. The rationale for my change of heart is outlined below.

## Brevity and clarity

I like most developers value and enjoy working with code which is both clear and concise. CoffeeScript facilitates in achieving these goals by enabling us to focus in on the logic, not the superfluous syntax.

## Abstractions are good

Especially those that help you get around the nuances of the compiled language. Personally the transition to writing fluent CoffeeScript felt swift, as the features and benefits of the language became apparent as I struggled. This is akin to what happens when you test drive, things become hard when your approaching the problem incorrectly. A quick trip to the [CoffeeScript homepage](http://coffeescript.org/) and I was away again.

## Confidence

Checking for type and equivalence _all the time_ cuts down on random runtime errors. I have more confidence in my code and test suite as a result of this.

## Consolidation

I like knowing that there is one way of doing things. Think of all the different approaches to inheritance in JavaScript or ensuring your in the correct context(named function, that / this confusion, call, `$.proxy`). This is all taken care of in the core library, so I like to make use of it wherever I can.

## Great support

We're now at a point where compilation is so quick and easy that it's became transparent. It's been baked in to Rails since version 3.1 and CoffeeScript is supported in every other decent build / asset management tool including both [Grunt](http://gruntjs.com/) and [gulp](http://gulpjs.com/).

## Conclusion

Although the subject of CoffeeScript polarises people, I do think _some level of abstraction is natural and required_ as more complex applications are being built on the client. So while CoffeeScript might not be the perfect solution, I do feel it has some merits(far more than my originally thought) and so is worth taking another look at. If not just to try to and prove me wrong. Any takers?
