type ava

@module("ava")
external ava: ava = "default"

@ocaml.doc("Test context, shared with hooks.")
type context

type t = {
  context: context,
  title: string,
  passed: bool,
}

@ocaml.doc("Call to declare a test, or chain to declare hooks or test modifiers") @module("ava")
external test: (string, t => unit) => unit = "default"

@ocaml.doc("Call to declare a test, or chain to declare hooks or test modifiers") @module("ava")
external testAsync: (string, t => Js.Promise.t<'a>) => unit = "default"

@send
external after: (ava, t, unit) => unit = "after"

@send
external afterWithTitle: (ava, string, t => unit) => unit = "after"

@send
external afterEach: (ava, t => unit) => unit = "afterEach"

@send
external afterEachWithTitle: (ava, string, t => unit) => unit = "afterEach"

@send
external before: (ava, t => unit) => unit = "before"

@send
external beforeWithTitle: (ava, string, t => unit) => unit = "before"

@send
external beforeEach: (ava, t => unit) => unit = "beforeEach"

@send
external beforeEachWithTitle: (ava, string, t => unit) => unit = "beforeEach"

// TODO: cb

@send
external failing: (ava, string, t => unit) => unit = "failing"

@send
external only: (ava, string, t => unit) => unit = "only"

@send
external serial: (ava, string, t => unit) => unit = "serial"

@send
external skip: (ava, string, t => unit) => unit = "skip"

@send
external todo: (ava, string) => unit = "todo"

type meta = {
  file: string,
  snapshotDirectory: string,
}

@ocaml.doc("Meta data associated with the current process.") @module("ava")
external meta: meta = "meta"

@ocaml.doc("Log one or more values.") @send @variadic
external log: (t, array<'a>) => unit = "log"

@ocaml.doc(
  "Plan how many assertion there are in the test. The test will fail if the actual assertion count doesn't match the number of planned assertions. See [assertion planning](https://github.com/avajs/ava#assertion-planning)."
)
@send
external plan: (t, int) => unit = "plan"

@ocaml.doc("Declare a function to be run after the test has ended.") @send
external teardown: (t, unit => unit) => unit = "teardown"

@ocaml.doc(
  "Set a timeout for the test, in milliseconds. The test will fail if the timeout is exceeded. The timeout is reset each time an assertion is made."
)
@send
external timeout: (t, ~ms: int, ~message: string=?, unit) => unit = "timeout"

@ocaml.doc(
  "Assert that `actual` is [truthy](https://developer.mozilla.org/en-US/docs/Glossary/Truthy). Comes with power-assert."
)
@send
external assert_: (t, 'a, ~message: string=?, unit) => unit = "assert"

let assert_ = assert_

@ocaml.doc(
  "Assert that `actual` is [deeply equal](https://github.com/concordancejs/concordance#comparison-details) to `expected`."
)
@send
external deepEqual: (t, 'a, 'a, ~message: string=?, unit) => unit = "deepEqual"

/**
 *
 * NOT IMPLEMENTED
 *
 * @send
 * external like: (t, 'a, 'a, ~message: string=?, unit) => unit = "like"
 */

@ocaml.doc("Fail the test.") @send
external fail: (t, ~message: string=?, unit) => unit = "fail"

@ocaml.doc("Assert that `actual` is strictly false.") @send
external false_: (t, bool, ~message: string=?, unit) => unit = "false"

@ocaml.doc(
  "Assert that `actual` is [falsy](https://developer.mozilla.org/en-US/docs/Glossary/Falsy)."
)
@send
external falsy: (t, 'a, ~message: string=?, unit) => unit = "falsy"

@ocaml.doc(
  "* Assert that `actual` is [the same value](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/is) as `expected`."
)
@send
external is: (t, 'a, 'a, ~message: string=?, unit) => unit = "is"

@ocaml.doc(
  "Assert that `actual` is not [the same value](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/is) as `expected`."
)
@send
external not: (t, 'a, 'a, ~message: string=?, unit) => unit = "not"

@ocaml.doc(
  "Assert that `actual` is not [deeply equal](https://github.com/concordancejs/concordance#comparison-details) to `expected`."
)
@send
external notDeepEqual: (t, 'a, 'a, ~message: string=?, unit) => unit = "notDeepEqual"

@ocaml.doc("Assert that `string` does not match the regular expression.") @send
external notRegex: (t, string, Js.Re.t, ~message: string=?, unit) => unit = "notRegex"

// TODO:

@ocaml.doc("Assert that the function does not throw.") @send
external notThrows: (t, unit => 'a, ~message: string=?, unit) => unit = "notThrows"

@ocaml.doc(
  "Assert that the async function does not throw, or that the promise does not reject. Must be awaited."
)
@send
external notThrowsAsync: (
  t,
  unit => Js.Promise.t<'a>,
  ~message: string=?,
  unit,
) => Js.Promise.t<unit> = "notThrowsAsync"

@ocaml.doc("Count a passing assertion.") @send
external pass: (t, ~message: string=?, unit) => unit = "pass"

@ocaml.doc("Assert that `string` matches the regular expression.") @send
external regex: (t, string, Js.Re.t, ~message: string=?, unit) => unit = "regex"

@ocaml.doc(
  " Assert that `expected` is [deeply equal](https://github.com/concordancejs/concordance#comparison-details) to a previously recorded [snapshot](https://github.com/concordancejs/concordance#serialization-details), or if necessary record a new snapshot."
)
@send
external snapshot: (t, 'expected, ~message: string=?, unit) => unit = "snapshot"

type throwsExpectation = unit
@ocaml.doc(
  "Assert that the function throws [an error](https://www.npmjs.com/package/is-error). If so, returns the error value."
)
@send
external throws: (
  t,
  unit => 'a,
  // TODO:
  ~expectation: throwsExpectation=?,
  ~message: string=?,
  unit,
) => option<Js.Exn.t> = "throws"

@ocaml.doc("Assert that the async function throws [an error](https://www.npmjs.com/package/is-error), or the promise rejects
  with one. If so, returns a promise for the error value, which must be awaited.")
@send
external throwsAsync: (
  t,
  unit => Js.Promise.t<'a>,
  // TODO:
  ~expectation: throwsExpectation=?,
  ~message: string=?,
  unit,
) => Js.Promise.t<option<Js.Exn.t>> = "throwsAsync"

@ocaml.doc("Assert that `actual` is strictly true.") @send
external true_: (t, bool, ~message: string=?, unit) => unit = "true"

@ocaml.doc(
  "Assert that `actual` is [truthy](https://developer.mozilla.org/en-US/docs/Glossary/Truthy)."
)
@send
external truthy: (t, 'actual, ~message: string=?, unit) => unit = "truthy"

// TODO: try_

@ocaml.doc(
  "Call to declare a hook that is run once, after all tests have passed, or chain to declare modifiers."
)
let after = after(ava)

@ocaml.doc(
  "Call to declare a hook that is run once, after all tests have passed, or chain to declare modifiers."
)
let afterWithTitle = afterWithTitle(ava)

@ocaml.doc(
  "Call to declare a hook that is run after each passing test, or chain to declare modifiers."
)
let afterEach = afterEach(ava)
@ocaml.doc(
  "Call to declare a hook that is run after each passing test, or chain to declare modifiers."
)
let afterEachWithTitle = afterEachWithTitle(ava)

@ocaml.doc(
  "Call to declare a hook that is run once, before all tests, or chain to declare modifiers."
)
let before = before(ava)
@ocaml.doc(
  "Call to declare a hook that is run once, before all tests, or chain to declare modifiers."
)
let beforeWithTitle = beforeWithTitle(ava)

@ocaml.doc("Call to declare a hook that is run before each test, or chain to declare modifiers.")
let beforeEach = beforeEach(ava)

@ocaml.doc("Call to declare a hook that is run before each test, or chain to declare modifiers.")
let beforeEachWithTitle = beforeEachWithTitle(ava)

@ocaml.doc("Call to declare a test that is expected to fail, or chain to declare modifiers.")
let failing = failing(ava)

@ocaml.doc(
  "Call to declare a test that is run exclusively, along with other tests declared with `.only()`."
)
let only = only(ava)

@ocaml.doc("Call to declare a serial test, or chain to declare serial hooks or test modifiers.")
let serial = serial(ava)

@ocaml.doc("Skip this test.")
let skip = skip(ava)

@ocaml.doc("Declare a test that should be implemented later.")
let todo = todo(ava)
