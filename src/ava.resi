type context

type t = {context: context, title: string, passed: bool}

let test: (string, t => unit) => unit
let testAsync: (string, t => Js.Promise.t<'a>) => unit

type meta = {file: string, snapshotDirectory: string}

let meta: meta

let log: (t, array<'a>) => unit
let plan: (t, int) => unit
let teardown: (t, unit => unit) => unit
let timeout: (t, ~ms: int, ~message: string=?, unit) => unit

let assert_: (t, 'a, ~message: string=?, unit) => unit

let deepEqual: (t, 'a, 'a, ~message: string=?, unit) => unit

let fail: (t, ~message: string=?, unit) => unit

let false_: (t, bool, ~message: string=?, unit) => unit
let falsy: (t, 'a, ~message: string=?, unit) => unit

let is: (t, 'expected, 'expected, ~message: string=?, unit) => unit

let not: (t, 'a, 'a, ~message: string=?, unit) => unit
let notDeepEqual: (t, 'a, 'a, ~message: string=?, unit) => unit

let regex: (t, string, Js.Re.t, ~message: string=?, unit) => unit
let notRegex: (t, string, Js.Re.t, ~message: string=?, unit) => unit

let pass: (t, ~message: string=?, unit) => unit

let snapshot: (t, 'expected, ~message: string=?, unit) => unit

let true_: (t, bool, ~message: string=?, unit) => unit
let truthy: (t, 'actual, ~message: string=?, unit) => unit

let after: (t, unit) => unit
let afterWithTitle: (string, t => unit) => unit

let afterEach: (t => unit) => unit
let afterEachWithTitle: (string, t => unit) => unit

let before: (t => unit) => unit
let beforeWithTitle: (string, t => unit) => unit

let beforeEach: (t => unit) => unit
let beforeEachWithTitle: (string, t => unit) => unit

let failing: (string, t => unit) => unit
let only: (string, t => unit) => unit
let serial: (string, t => unit) => unit
let skip: (string, t => unit) => unit
let todo: string => unit
