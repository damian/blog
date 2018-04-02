+++
title = "Nginx rewrite rule"
date = "2010-11-01"
+++

A snippet of my <a href="http://en.wikipedia.org/wiki/Nginx">nginx</a> config file showing how to rewrite all urls from `www.yourdomain.com` to `yourdomain.com`.

Very simple, but worth knowing if opting for nginx over <a href="http://www.apache.org/">Apache</a>.

{{< highlight lua >}}

server {
  listen 80;
  server_name www.damiannicholson.com;
  rewrite ^(.*) http://damiannicholson.com$1 permanent;
}


server {
  listen 80;
  server_name damiannicholson.com;
  ...
}

{{< / highlight >}}
