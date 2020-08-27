# react ⚛︎

The best overcomplicated JavaScript framework out there.

## Hooks

React Hooks are this new way to handle state changes (which are now called _side effects_ - or just _effects_) on React components. Class-based components are now dead and every React developer now thinks it hurts. God kills a kitten every time you start a new React component with `export class`...

So, Hooks. This is basically a weirdo replacement for lifecycle methods `componentDidMount`, `componentDidUpdate`, and `componentWillUnmount`:

```js
import { useState } from "react";

const TogglePage = () => {
  const [isOn, setState] = useState(false);

  return (
    <p>
      <button onClick={(ev) => setState(!isOn)}>Toggle</button>
      Current state: {isOn ? "On" : "Off"}
    </p>
  );
};
```

In the example above, we are using `useState()` to create a local state container with an initial value of `false` (Hooks doesn't dictate the type of data that goes in it - it's up to you). It returns a tuple with two items: the first one is the state itself, and the second one is a function that updates the state container's internal state.

The cool part is: whenever you update the state container, your functional component is re-rendered.

**Notes**

- Hooks are executed on every fucking render - both on mount and updates, so it's pretty easy to create memory leaks with it. Be careful, motherfucker!
- You can also return a function from it, which is then called when the component unmounts. These are called _clean-up functions_
- You can pass an array as second argument of `useState()` to control when it should run, so whenever the hook is about to execute, it will compare the array with the last version of it. If it differs, your hook is executed again
  - You can have multiple items on this array - and whenever any of these items change, the hook (and the clean-up function) will execute again
  - If you pass an empty array the hook will be executed once, during mount - and if there's a clean-up function, it'll be executed once, during unmount (two empty arrays will never differ)