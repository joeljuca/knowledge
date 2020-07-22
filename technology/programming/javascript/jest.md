# jest 🃏

My new preferred testing framework (2020 edition).

## Mock clearing/resetting/restoring WTF

There are three options to _undo_ things in Jest mocks:

- [`m.mockClear()`](https://jestjs.io/docs/en/mock-function-api#mockfnmockclear): remove all mock data (eg: `m.mock.calls` and `m.mock.instances`)
- [`m.mockReset()`](https://jestjs.io/docs/en/mock-function-api#mockfnmockreset): clear the mock (`m.mockClear()`) and removes mocked return values and implementations
- [`m.mockRestore()`](https://jestjs.io/docs/en/mock-function-api#mockfnmockreset): reset the mock (`m.mockReset()`) and restore the original (non-mocked) implementation

## Useful links

- [Mock functions introduction](https://jestjs.io/docs/en/mock-functions)
- [Mock Function API](https://jestjs.io/docs/en/mock-function-api)

> PS: the `m` variable on the examples below is a [mock function](https://jestjs.io/docs/en/mock-functions):
>
> ```js
> const m = jest.fn(() => true);
> ```
