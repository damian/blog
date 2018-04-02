+++
date = "2017-03-26"
layout = "post"
title = "Batch file renaming in Bash"

+++

Batch file renaming is a common job for a developer. In the past, I've used a Mac application called [NameMangler](http://manytricks.com/namemangler/) or Finder itself to do the heavy lifting for me. Those tools work well when the files being transformed live within the same directory, but it quickly becomes more difficult when you want to be able to work across multiple, potentially nested directory structures.

![Basic batch file renaming using Finder](http://www.img.damiannicholson.com/batch-file-rename.png)

On the past few occasions, I've used Bash to great effect, though for some reason I **NEVER REMEMBER** how to correctly pipe the file transformation on to the `find` command, so I'm documenting it here for future reference.

Below is an example of a task that I had to carry out just the other day -- renaming all files with the `.textile` extension to `.md`. It really is trivial.

{{< highlight bash >}}
find . -type f -name '*.textile' | while read f; do mv "$f" "${f/.textile/.md}"; done
{{< / highlight >}}
