+++
title = "HTML5 form attribute"
date = "2019-02-22"
+++

I've been doing web development for over a decade now and every now and again I
learn something new that surpises me. The [HTML5 form
attribute](https://caniuse.com/#feat=form-attribute) whilst being simple, is
one of those things.

It enables a **form control outside the form to act as if it's inside** by
tying them together with an ID and a corresponding form attribute.

I've put together a quick example below to show how this can be particularly
useful when it comes to submitting a form from somewhere else on the page
without the need of any JavaScript. Suppose we have a generic wizard component
and we want to split up the UI in such a way that the wizard navigation step
actions are separate from the form contained inside of each step. By creating an
input with the same ID as the form, once clicked it actually submits the form
for us - how cool is that!

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Static Template</title>
    <link rel="stylesheet" href="./app.css" />
  </head>
  <body>
    <div class="wizard">
      <a href="/step-2">Back</a> <button form="wizard-form">Next step</button>
    </div>
    <form id="wizard-form" method="POST" action="/">
      <fieldset>
        <legend>Billing address</legend>
        <input type="text" name="name" placeholder="Name" /> <br />
        ... <br />
        <button disabled="disabled">Submit inside</button>
      </fieldset>
    </form>

    <script>
      const wizardForm = document.getElementById("wizard-form");

      wizardForm.addEventListener("submit", function(e) {
        e.preventDefault();
        wizardForm.elements[3].innerText = "Submitted!";
      });
    </script>
  </body>
</html>
```