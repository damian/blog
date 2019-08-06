+++
title = "Creating a layout like Pinterest with React and the partition problem"
date = "2018-07-14"
+++

![](https://s3-eu-west-1.amazonaws.com/www.img.damiannicholson.com/Screen_Shot_2018-07-13_at_23.11.55.png)

Creating a layout like [Pinterest](https://www.pinterest.co.uk/) is impossible
without JavaScript. [Masonry.js](https://masonry.desandro.com/) does a decent
job, though I've found it doesn't have the desired effect when it comes to
laying out a grid containing any tall images. The sleek tiled effect quickly
breaks down([Codesandbox example](https://x7k7y98mrp.codesandbox.io/)).

![](https://s3-eu-west-1.amazonaws.com/www.img.damiannicholson.com/x7k7y98mrp.codesandbox.io__1.png)

Similarly, if there is a mix of images of varying heights, then the alignment of
the images in the last row is staggered, when it ought to vary as little as
possible.

![](https://s3-eu-west-1.amazonaws.com/www.img.damiannicholson.com/x7k7y98mrp.codesandbox.io__2.png)

### The partition problem

One means of getting around this is by using the greedy algorithm to the
[partition
problem](https://en.wikipedia.org/wiki/Partition_problem#The_greedy_algorithm).

> In number theory and computer science, the partition problem, or number
> partitioning, is the task of deciding whether a given multiset S of positive
> integers can be partitioned into two subsets S1 and S2 such that the sum of
> the numbers in S1 equals the sum of the numbers in S2.

In other words, we can sort the images by their heights after they've loaded in
the DOM, and partition them in to a number of sets of columns in which we want
to display them. We then use the algorithm to place each image in the column
with the smallest sum. This approach isn't guaranteed to produce the best
partitions all of the time, but it's performant and scales up nicely. I've
implemented this in React([Codesandbox
example](https://x260l8963z.codesandbox.io/)) and the results speak for
themselves. So much more compact!

![](https://s3-eu-west-1.amazonaws.com/www.img.damiannicholson.com/x260l8963z.codesandbox.io_.png)

![](https://s3-eu-west-1.amazonaws.com/www.img.damiannicholson.com/x260l8963z.codesandbox.io__1.png)
