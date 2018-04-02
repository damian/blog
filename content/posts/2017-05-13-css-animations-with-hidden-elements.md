+++
title = "CSS animations with hidden elements"
date = "2017-05-13"
+++

Today I learned that a CSS animation applied to an element hidden through `visibility: hidden;` occurs straight away. This behaviour is different to an element hidden through `display: none` as the animation doesn't fire till it's set back to `display: block`.

The demo below shows this in action - note how the square on the right appears part of the way through it's animation sequence.

<p data-height="500" data-theme-id="light" data-slug-hash="XRqXgm" data-default-tab="result" data-user="damian-1478604314" data-embed-version="2" data-pen-title="Hidden versus none CSS animations" class="codepen">See the Pen <a href="http://codepen.io/damian-1478604314/pen/XRqXgm/">Hidden versus none CSS animations</a> by Damian Nicholson (<a href="http://codepen.io/damian-1478604314">@damian-1478604314</a>) on <a href="http://codepen.io">CodePen</a>.</p>
<script async src="https://production-assets.codepen.io/assets/embed/ei.js"></script>
