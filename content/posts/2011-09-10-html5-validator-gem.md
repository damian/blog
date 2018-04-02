+++
date = "2011-09-10"
layout = "post"
title = "HTML5 Validator Gem"

+++

We all know the benefits of adhering to web standards, but I'm sure you'll agree it's a laborious process manually checking the validity of each page within a site or web app using the online W3C validation service or a browser extension.

In an effort to scratch my own itch, I built a gem called [html5_validator](https://rubygems.org/gems/html5_validator). It's geared to run **as part of an RSpec test suite**, so if your serious about being standards compliant, you shouldn't mind your tests failing if you've got some grubby HTML kicking about.

It can be installed using the following command.

{{< highlight ruby >}}
gem install html5_validator
{{< / highlight >}}

What's cool is that if your page isn't compliant resulting in a failing spec, **the offending HTML is printed out as part of the failing test**. See below an example of how this can be used in a controller test:

{{< highlight ruby >}}

describe PostsController do
  render_views

  it "should be valid html5" do
    get :new
    response.body.should be_valid_html5
  end

end

{{< / highlight >}}

### How does this work?

I wrote a wrapper around an online HTML5 validation service called [validator.nu](http://validator.nu/). When run as part of an RSpec suite, the rendered HTML is posted to their web service which responds with some JSON containing the results of the validation check.

I opted to use validator.nu over the official W3C validator because it supports JSON (the W3C only supports SOAP), so it's easy to work with in Ruby.

### More info

You can find the code on my [Github repository](https://github.com/damian/html5_validator) along with a few more examples.

As always questions and comments are very welcome. Forks and pull requests even more so.
