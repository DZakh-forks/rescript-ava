# Rescript AVA

This is a set of [ReScript](https://rescript-lang.org/) bindings to the [AVA](https://github.com/avajs/ava) test framework.

## Installation

Using Yarn or NPM:

```bash
yarn add --dev ava rescript-ava
npm install --save-dev ava rescript-ava
```

## Usage

```rescript

Ava.test("should run a test", t => {
  let answer = 3.14

  t->Ava.is(answer, 3.14, ~message="Should be a tasty dessert", ())
})

// or

open Ava

test("should run a test", t => {
  let answer = 3.14

  t->is(answer, 3.14, ~message="Should be a tasty dessert", ())
})

```

All assertions follow a `t` first, `...args`, optional `~message`, `unit` format as demonstrated above.

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

[MIT](https://choosealicense.com/licenses/mit/)
