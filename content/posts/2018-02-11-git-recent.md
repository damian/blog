+++
title = "Git recent"
date = "2018-02-11"
+++

I've wrote a [couple]({{< relref 2011-03-22-current-git-branch-in-bash-prompt
    >}}) [posts]({{< relref 2017-08-22-git-stash-workflow >}}) on
[git](https://git-scm.com) over the years so I thought I'd share another snippet
sitting in my `.gitconfig` which I find particularly useful when working across
multiple branches, as I tend to forget where I last left off. It's called `git
recent` and lists the last 10 branches I've committed to.

{{< highlight bash >}}
§ git recent
dn-picture-configuration
master
production
production-dn-avatar-fit
...
{{< / highlight >}}

And finally the entry in my `.gitconfig`.

{{< highlight git >}}
[alias]
  ...
  recent = "for-each-ref --sort=-committerdate --count=10 --format='%(refname:short)' refs/heads/"
{{< / highlight >}}
