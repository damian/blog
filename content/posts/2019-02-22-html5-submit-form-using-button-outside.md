+++
title = "HTML5 form attribute"
date = "2019-02-22"
+++

I've been doing web development for over a decade now and every
now and again I learn something new that surpises me. The [HTML5 form
attribute](https://caniuse.com/#feat=form-attribute) whilst being very simple,
is one of those things.

In a nutshell it enables a **form control outside the form to act as if it's
inside** by tying them together with an ID and a corresponding form attribute.

I've put together a quick example below to show how this can be particularly
useful when it comes to submitting a form from somewhere else on the page
without the need of any JavaScript. Suppose we have a generic wizard component
and we want to split up the UI in such a way that the wizard navigation step
actions are separate from the form contained inside of each step. By creating an
input with the same ID as the form, once clicked it actually submits the form
for us - how cool is that!

<iframe src="https://codesandbox.io/embed/00j2nnmz8w?fontsize=14&view=preview" style="width:100%; height:500px; border:0; border-radius: 4px; overflow:hidden;" sandbox="allow-modals allow-forms allow-popups allow-scripts allow-same-origin"></iframe>