+++
title = "React noop anti-pattern"
date = "2018-03-06"
+++

When building reusable UI components, it's common that you want to be able to do
something in response to a user action. Perhaps you want to persist the current
tab the user has selected so the next time they load the page, the UI is in the
same state as where they last left it. The standard React pattern is to pass in
callback to the parent component, which is invoked at right time in the event
lifecycle.

{{< highlight jsx >}}
const AccountPage = () => {
  const handleTabClick = (index) => {
    // Some AJAX here
  };

  return (
    <Tabs onChange={handleTabClick}>
      <Tab>...</Tab>
      <Tab>...</Tab>
      ...
    </Tabs>
  );
}
{{< / highlight >}}

Digging in to the underlying implementation of the `Tabs` stateful component
generally reveals some code that looks like this. Notice the part where the
optional callback is invoked if one is declared.

{{< highlight javascript >}}
  handleClick = (e, index) => {
    e.preventDefault();

    this.setState({
      tabSelected: index,
    });

    if (this.props.onChange) {
      this.props.onChange(index);
    }
  }
{{< / highlight >}}

I'm not overly fond of this approach for a few reasons:

1. It increases the number of branches through your code.
2. It increases the complexity slightly at a time where the code is more than likely
   taking a step up in complexity already. The example above only has one path
   through it, but in the future there could be scenarios whereby we want to
   prevent the current tab being switched from, or perhaps the target tab is
   disabled until some criteria is met. Across each scenario we'd want to invoke
   the passed in callback, but at different points.
3. It decreases readability.
4. This pattern quickly proliferates across a UI component library.

For these reasons **I prefer the following `noop` anti-pattern**, which allows us to
remove the if statement and keep the control flow clean and simple!

{{< highlight javascript >}}
const noop = () => {};

class Tabs extends React.Component {
  static defaultProps = {
    onChange: noop,
  };

  handleClick = (e, index) => {
    e.preventDefault();

    this.setState({
      tabSelected: index,
    });

    this.props.onChange(index);
  }
  ...
}
{{< / highlight >}}
