+++
title = "Crafting Appropriate URLs with the Token API"
date = "2010-04-14"
+++

So <a href="http://drupal.org/project/pathauto">Pathauto</a> does most of the heavy lifting when it comes to making pretty URLs. There's no questioning that this module is must for all <a href="http://drupal.org/">Drupal</a> projects. However I came across a situation recently where the out of the box functionality that Pathauto provides, just wasn't enough.

I wanted to produce a different URL based on what taxonomy term was selected for a content type. I couldn't find any way of achieving this in the automated alias settings, and after a brief chat about this with my colleagues at <a href="http://www.orangebus.co.uk/">Orange Bus</a>, I was pointed in the direction of the <a href="http://api.lullabot.com/file/contrib/token/token.module">Token API</a>.

A little digging later I managed to find a solution.

{{< highlight php >}}

/**
 * Implementation of hook_token_list().
 */
function MODULENAME_token_list($type = 'all'){
  $tokens['node']['my_token'] = t('DVD or TV Series');
  return $tokens;
}

/**
 * Implementation of hook_token_values().
 */
function MODULENAME_token_values($type, $object = NULL, $options = array()) {
  $values = array();

  if ($type == 'node' && $object->type == 'CONTENT_TYPE_NAME') {
    // Do some conditional checking here
    $values['my_token'] = $node->taxonomy[1] == 2 ? 'apple' : 'orange';
  }
  return $values;
}
{{< / highlight >}}

The first function, creates a new token. We know this because as soon as this code is inserted in our site module, the token is visible in the 'Replacement patterns' fieldset on the Automated Alias Settings page. I then entered this token [my_token]/[title-raw] into the URL pattern field of the content type I wanted to name. The logic behind what this token is being set as happens in the second function, `hook_token_values()`.

What we're doing here is checking for the presence of a particular content type before setting the token value to the result of some conditional logic. In this case we're seeing whether the content type has a particular taxonomy term associated with it. Ultimately though this check could be based on anything, and the logic behind it could be as complex or as simple as needs be.

Pretty simple stuff ey! Anywho if you're aware of any other ways to go about achieving this, I would love to hear it.
