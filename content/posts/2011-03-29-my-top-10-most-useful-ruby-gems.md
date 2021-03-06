+++
title = "My top 10 most useful Ruby Gems"
date = "2011-03-29"
+++

In no particular order, here are my top 10 most useful Ruby Gems as of March 2011.

## Devise

<a href="https://github.com/plataformatec/devise">Devise</a> is a fully featured authentication solution that works perfect straight out of the box. With it comes a whole host of niceties like password recovery, token authentication etc. Tweaking Devise isn&#8217;t a problem, as it&#8217;s a Rails engine, so everything can be overriden. If your looking to authenticate via OAuth or <span class="caps">LDAP</span>, there&#8217;s a good chance an extension has already been written ontop of Devise for this as well. Two thumbs up!

## CanCan

If your app needs authorization(who can do what) then look no further. <a href="https://github.com/ryanb/cancan">CanCan</a> is both simple and flexible to work with. The fact that all permissions logic is defined in a single ability class means managing who can do what is easy. Comes with a bunch of handy helper methods for views, controllers etc so you can get really fine grained access control with little effort.

## Kaminari

What&#8217;s shaping up to be the successor of Will Paginate, <a href="https://github.com/amatsuda/kaminari">Kaminari</a> is a clean solution to handle pagination. Like Devise, it&#8217;s one of those new fangled Rails 3 engines so it can be fully customised if you don&#8217;t like the markup it provides out of the box.

## <span class="caps">HAML</span>/Slim

I&#8217;ve been working more with <a href="http://haml-lang.com/"><span class="caps">HAML</span></a> lately, but my partner in crime <a href="http://twitter.com/elandesign">Paul</a>, picked up on <a href="http://slim-lang.com/">Slim</a> and it seems to have more going for it than the rest. Better performance, lean syntax so no percentage signs all over the place, string interpolation etc. If your used to <span class="caps">ERB</span>, it&#8217;s worth a punt giving either of these gems a try, I promise you won&#8217;t look back. Want to try it out in a project already coded up in <span class="caps">ERB</span>, convert your views to <span class="caps">HAML</span> to with <a href="http://screencasts.org/episodes/using-haml-with-rails-3">this Rake task</a>.

## Carrierwave

Digging this bad boy at the moment &#8211; <a href="https://github.com/jnicklas/carrierwave">Carrierwave</a> is a versatile file upload solution which keeps all of that mess logic away from your models. Support for Amazon S3 and other cloud based services is provided through a gem called Fog, so setting this up is painless.

## Metasearch

Stumbled across this lil beauty when upgrading a Rails app from 2.3.10 to 3.0.5 as a replacement for Searchlogic. Bar some tweaks here and there to the views, <a href="https://github.com/ernie/meta_search">Metasearch</a> has been a fine stand-in. So much so I regard it as the successor to Searchlogic.

## Formtastic

Building semantic forms is a doddle with <a href="https://github.com/justinfrench/formtastic">Formtastic</a> and its simple <span class="caps">DSL</span>. Can&#8217;t think of any projects where I don&#8217;t want to use this. Staple.

## Friendly ID

If your after pretty URLs, then this is should be the gem your using. <a href="https://github.com/norman/friendly_id">Friendly ID</a> Provides integration with legacy Rails projects as there&#8217;s a rake task built in to bulk generate slugs. You can also roll your own slug creation method into it if you want more control.

## Thinking Sphinx

We use <a href="http://freelancing-god.github.com/ts/en/">Thinking Sphinx</a> at <span class="caps">CEF</span> to index and search a catalogue of over 1,300,000 products, and it&#8217;s lightning fast. That numbers not a typo.

## Settingslogic

I&#8217;ve only warmed to <a href="https://github.com/binarylogic/settingslogic">Settingslogic</a> recently, but having a central place to store credentials, <span class="caps">API</span> keys and constants across multiple environments(development, staging, production etc) is very handy. Make sure to add this file to your .gitignore if your doing open-source work on Github and don&#8217;t want to commit your sensitive info.
<h3>Honorable Mentions</h3>

* <a href="https://github.com/rubyist/aasm"><span class="caps">AASM</span></a>
* <a href="http://nokogiri.org/">Nokogiri</a>
* <a href="https://github.com/capistrano/capistrano">Capistrano</a>

Obviously Rails is on this list too!

Are there any must have gems in your toolbox that aren&#8217;t in this list? I want to hear about them!
