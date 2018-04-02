+++
title = "Reduce all the things"
date = "2017-10-19"
+++

I have long believed Ruby's [inject](https://apidock.com/ruby/Enumerable/inject) to be under appreciated as it's super flexible. It's great for things like:

* String concatenation for example composing snippets of HTML
* building a new Array(potentially shorter length than the one being enumerated over)
* building a new Hash(based on it's keys)

Fortunately, we have this same utility available to us now in ES6 JavaScript too just with a different name - [reduce](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/Reduce) and I'm finding myself using it more than ever for the same reasons. The fact it's a [pure function](https://en.wikipedia.org/wiki/Pure_function), meaning it has no side effects ties in nicely with the React and Redux approach to UI development. Below are a few examples of how I've used this recently.

## Example 1 - building HTML classnames

{{< highlight javascript >}}
// Function to generate a string separated class names
const classNames = () => {
  const classes = [...arguments];
  return classes.reduce((classString, val) => {
    if (typeof val === 'string' && val.length > 0) {
      return `${classString} ${val.trim()}`;
    }
    return classString;
  }, '');
}

const Avatar = ({ src, alt, ...props }) => {
  const { className, ...other } = props;

  return (
    <img
      src={src}
      alt={alt}
      className={classNames('avatar', className)}
      {...other}
    />
  );
};

<Avatar
  src="https://avatars1.githubusercontent.com/u/34645?v=2&s=100"
  alt="Damian Nicholson avatar"
  className="rounded"
/>
// <img
//   src="https://avatars1.githubusercontent.com/u/34645?v=2&s=100"
//   alt="Damian Nicholson avatar"
//   class="avatar rounded"
// />
{{< / highlight >}}

## Example 2 - removing an item from a normalized collection

Note how in the example below we're only having to do one loop in order to remove 'Damian' from both collections.

{{< highlight javascript >}}
const myFamily = {
  members: {
    'abc': { id: 'abc', name: "Damian" },
    'def': { id: 'def', name: "Olivia" },
    'ghi': { id: 'ghi', name: "Amanda" },
  },
  order: ['ghi', 'def', 'abc'],
};

// Suppose I want to remove Damian from this object
const newFamily = myFamily.order.reduce((accum, id) => {
  if (id !== 'abc') {
    accum.members[id] = myFamily.members[id];
    accum.order = [...accum.order, id];
  }

  return accum;
}, { members: {}, order: [] });
{{< / highlight >}}

## Example 3 - reduce reducers

Taken directly from Andrew Clark's([@acdlite](https://twitter.com/acdlite)) [reduce-reducers](https://github.com/acdlite/reduce-reducers) repository to chain your Redux reducers from left to right.

{{< highlight javascript >}}
const reduceReducers = (...reducers) {
  return (previous, current) =>
    reducers.reduce((p, r) => {
      return r(p, current);
    }, previous);
}
{{< / highlight >}}
