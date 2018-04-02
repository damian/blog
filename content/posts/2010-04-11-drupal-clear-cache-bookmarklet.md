+++
title = "Drupal Clear Cache Bookmarklet"
date = "2010-04-11"
+++

Because I haven't got round to playing with <a href="http://drupal.org/project/drush">Drush</a> yet, I decided to throw together a bookmarklet to clear Drupal's cache.

You can check it out on <a href="http://gist.github.com/362910">gist</a> or alternatively you can click and drag the following link to your toolbar.

<a href="javascript:window.location = document.location.protocol + '//' + document.location.host + '/admin_menu/flush-cache?destination=' + document.location.pathname.substring(1);">Clear cache</a>

*Note:* The snippet is dependent on using <a href="http://drupal.org/project/admin_menu">Admin Menu</a>.
