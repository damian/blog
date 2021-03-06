+++
title = "iPhone style checkbox using only CSS3"
date = "2011-07-25"
+++

I'm not normally one for CSS experiments, but after reading a few chapters of [Hardboiled Webdesign](http://hardboiledwebdesign.com/) on the plane journey back from Mexico, I had the urge to try out some CSS transitions.

I didn't want to go [AT-AT Walker](http://anthonycalzadilla.com/css3-ATAT/) overboard(even though it's pure awesome), so I decided to create an iPhone checkbox using **only CSS**. It turned out to be pretty easy, check out the demo and code below.

*[Check out the demo here!](http://dl.dropbox.com/u/391082/checkbox-ios.html)*

### HTML

I've tried to keep the markup pretty lean. Similar to what's generated via [Formtastic](https://github.com/justinfrench/formtastic) or [SimpleForm](https://github.com/plataformatec/simple_form).

{{< highlight html >}}
<div class="checkbox">
  <input id="check" name="1" type="checkbox" value="1" />
  <label for="check">Check-me</label>
</div>
{{< / highlight >}}

### CSS

This is where the magic happens! The main thing to note is that we're not really using the checkbox at all. We're leveraging the fact that it's toggled when we click it's label(which has the necessary for attribute). That way the iOS checkbox image can be applied to the label, which in turn is wrapped in a div with a specific height, width and an overflow of hidden. Using the `:checked` pseudo selector, we transition the position of the background image on the label, just like on an iPhone!

{{< highlight css >}}
body {
  font-family: "Lucida Grande", Verdana, Arial, sans-serif, Helvetica;
}

.checkbox {
  display: block;
  width: 94px;
  height: 27px;
  overflow: hidden;
  border-radius: 3px;
}	

input[type=checkbox] {
  display: none;
}

input[type=checkbox] + label {
  text-indent: -9999px;
  display: block;
  width: 150px;
  height: 27px;
  line-height: 27px;
  background: transparent url(sprite2.png) no-repeat -56px 0;
  -webkit-transition: background-position 0.3s ease-in-out;
  -moz-transition: background-position 0.3s ease-in-out;
}

input[type=checkbox]:checked + label {
  -webkit-transition: background-position 0.3s ease-in-out;
  -moz-transition: background-position 0.3s ease-in-out;
  background-position: -3px 0;
}
{{< / highlight >}}
