let await = (prom, fn) => {
  Js.Promise.then_(x => x->fn->Js.Promise.resolve, prom)
}

open Ava

test("Should throw", t => {
  t->throws(() => Js.Exn.raiseError("SyncError"), ~message="Should throw", ())->ignore
})

test("Should not throw", t => {
  t->notThrows(() => (), ~message="Should not throw", ())
})

testAsync("Should throw async", t => {
  t->throwsAsync(() => {
    let res = Js.Promise.resolve()
    let res = res->await(_ => Js.Exn.raiseError("AsyncError"))

    res
  }, ~message="Should throw an 'AsyncError'", ())
})

testAsync("Should not throw async", t => {
  t->notThrowsAsync(() => Js.Promise.resolve(), ~message="Should not throw async", ())
})
