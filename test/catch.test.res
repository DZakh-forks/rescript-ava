exception AnError(string)

Ava.testAsync("should catch failures", t => {
  Js.Promise.reject(AnError("Things not good"))->Js.Promise.then_(_ => {
    t->Ava.fail(~message="Should not enter 'then' clause", ())
    Js.Promise.resolve()
  }, _)->Js.Promise.catch(_ => {
    t->Ava.pass(~message="The promise did reject", ())->Js.Promise.resolve
  }, _)
})

Ava.testAsync("should catch failures (again)", t => {
  Promise.reject(AnError("Things not good"))
  ->Promise.tapOk(_ => {
    t->Ava.fail(~message="Should not enter 'then' clause", ())
  })
  ->Promise.tapError(_ => {
    t->Ava.pass(~message="The promise did reject", ())
  })
})

Ava.testAsync("should catch failures (one more time)", t => {
  Promise.reject(AnError("Things not good"))->Promise.tap(x => {
    switch x {
    | Ok(_) => t->Ava.fail(~message="Should not be 'Ok(_)'", ())
    | Error(_) => t->Ava.pass(~message="Is an 'Error(_)'", ())
    }
  })
})
