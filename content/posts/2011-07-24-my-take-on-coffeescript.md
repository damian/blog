+++
title = "My take on CoffeeScript"
date = "2011-07-24"
+++

So [CoffeeScript](http://jashkenas.github.com/coffee-script/) has been on my radar for some time now, and unfortunately it hasn't piqued my interest as much as other Ruby developers I know. Only recently did I eventually realise as to why this was the case - **it doesn't solve a problem**.

I'll rephrase that last bit. In my opinion it doesn't solve enough of a problem to warrant learning a new language and the resulting loss in productivity that will ensue from that transition. An issue which is compounded the more developers there are on a project(most will not know CoffeeScript).

As far as I'm concerned CoffeeScript is **syntactic sugar**, plain and simple. Sure the JavaScript that it compiles down to is of a higher quality than most of us can write, resulting in more performant code. But I figure this gain in negligable. If it were ever to boil down to this being an issue, then I'm almost certain there are other parts of the codebase which could be given a little **more care and attention**(making less HTTP requests is an example) that could make up for this.

There's also the fact that debugging will be more difficult - as any errors in the browser will correspond to the compiled version, not the CoffeeScript.

To conclude, I'm not sold on CoffeeScript just yet as **I don't think the benefits outweigh the drawbacks** of introducing a new language on the stack.
