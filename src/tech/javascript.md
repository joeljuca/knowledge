# javascript 💛

My \[former\] prefered language, with whom I have a love-hate relationship.

## jest 🃏

My new preferred testing framework (2020 edition).

### Mock clearing/resetting/restoring WTF

There are three options to _undo_ things in Jest mocks:

- [`m.mockClear()`](https://jestjs.io/docs/en/mock-function-api#mockfnmockclear): remove all mock data (eg: `m.mock.calls` and `m.mock.instances`)
- [`m.mockReset()`](https://jestjs.io/docs/en/mock-function-api#mockfnmockreset): clear the mock (`m.mockClear()`) and removes mocked return values and implementations
- [`m.mockRestore()`](https://jestjs.io/docs/en/mock-function-api#mockfnmockreset): reset the mock (`m.mockReset()`) and restore the original (non-mocked) implementation

### Useful links

- [Mock functions introduction](https://jestjs.io/docs/en/mock-functions)
- [Mock Function API](https://jestjs.io/docs/en/mock-function-api)

> PS: the `m` variable on the examples below is a [mock function](https://jestjs.io/docs/en/mock-functions):
>
> ```js
> const m = jest.fn(() => true);
> ```

## mocha ☕️

Not the fastest unit testing framework but `¯\_(ツ)_/¯`.

### nyan reporter

Add `--reporter=nyan` to your `test` script on `package.json` and your tests will be the most nyaned awesome omg-thats-really-cool ones in the world:

```
$ mocha --reporter=nyan
 15  -_-_-_-_-_-_-_-__,------,
 0   -_-_-_-_-_-_-_-__|  /\_/\
 0   -_-_-_-_-_-_-_-_~|_( ^ .^)
     -_-_-_-_-_-_-_-_ ""  ""

  15 passing (77ms)
```

## react ⚛︎

The best overcomplicated JavaScript framework out there.

### Hooks

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
