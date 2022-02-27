# Rescript AVA

[ReScript](https://rescript-lang.org/) bindings for the [AVA](https://github.com/avajs/ava) test framework.

## Usage

### Installation

```sh
npm install --save-dev ava rescript-ava
```
or 
```
yarn add --dev ava rescript-ava
```

Then add `rescript-ava` to `bs-dev-dependencies` in your `bsconfig.json`:

```diff
{
  ...
+ "bs-dev-dependencies": ["rescript-ava"]
}
```

Add `__tests__` to `sources` in your `bsconfig.json`:

```diff
"sources": [
  {
    "dir": "src"
  },
+ {
+   "dir": "__tests__",
+   "type": "dev"
+ }
]
```

Add `test` script and ava configuration in your `package.json`:

```diff
{
  "name": "awesome-package",
  "scripts": {
+   "test": "ava"
  },
  "devDependencies": {
    "rescript-ava": "^1.0.0"
  },
+ "ava": {
+   "files": [
+     "__tests__/**/*_test.mjs",
+     "__tests__/**/*_test.bs.js"
+   ]
+ }
}
```

### Create your first test

Add a test file in the `__tests__` directory and use the suffix `*_test.res`. When compiled they will be put in a `__tests__` directory with a `*_test.bs.js` suffix, ready to be picked up when you run ava. If you're not already familiar with [Ava](https://github.com/avajs/ava), see [the Ava documentation](https://github.com/avajs/ava#documentation).


```rescript
// __tests__/Example_test.res

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

### Running your tests

```sh
npm test
```

Or with npx:

```sh
npx ava
```

Run with the --watch flag to enable AVA's [watch mode](https://github.com/avajs/ava/blob/main/docs/recipes/watch-mode.md):

```sh
npx ava --watch
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

[MIT](https://choosealicense.com/licenses/mit/)
