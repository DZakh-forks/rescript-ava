type t<'ok, 'err> = Js.Promise.t<result<'ok, 'err>>

type make<'ok, 'err> = ((~resolve: 'ok => unit, ~reject: 'err => unit) => unit) => t<'ok, 'err>

type unit_<'ok, 'err> = result<'ok, 'err> => t<'ok, 'err>

type flatMap<'ok, 'err, 'next> = (t<'ok, 'err>, 'ok => t<'next, 'err>) => t<'next, 'err>

type map<'ok, 'err, 'next> = (t<'ok, 'err>, 'ok => 'next) => t<'next, 'err>

type join<'ok, 'err> = t<t<'ok, 'err>, 'err> => t<'ok, 'err>

let unit: unit_<'ok, 'err> = Js.Promise.resolve

let then_ = (x, fn) => Js.Promise.then_(fn, x)

let resolve = x => x->Ok->unit
let reject = x => x->Error->unit

let make: make<'ok, 'err> = fn =>
  Js.Promise.make((~resolve, ~reject) => {
    reject->ignore

    fn(~resolve=x => resolve(. Ok(x)), ~reject={x => resolve(. Error(x))})
  })

let flatMap: flatMap<'ok, 'err, 'next> = (x, fn) => {
  x->then_(arg =>
    switch arg {
    | Ok(ok) => fn(ok)
    | Error(err) => Error(err)->unit
    }
  )
}

let map: map<'ok, 'err, 'next> = (x, fn) => x->flatMap(x => fn(x)->resolve)

let join: join<'ok, 'err> = x => x->flatMap(x => x)

let finally = (x, fn) =>
  x->then_(x => {
    fn(x)

    Js.Promise.resolve()
  })

let tap = (x, fn) =>
  x->then_(x => {
    fn(x)
    Js.Promise.resolve(x)
  })

let tapOk = (x, fn) =>
  x->tap(x =>
    switch x {
    | Error(_) => ()
    | Ok(ok) => fn(ok)
    }
  )

let tapError = (x, fn) =>
  x->tap(x =>
    switch x {
    | Error(err) => fn(err)
    | Ok(_) => ()
    }
  )
