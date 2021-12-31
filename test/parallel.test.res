let sleep = duration =>
  Promise.make((~resolve, ~reject) => {
    let _ = reject

    Js.Global.setTimeout(resolve, duration)->ignore
  })

let state = ref(0)

Ava.testAsync("[async] Parallel 1", t => {
  sleep(10)->Promise.finally(_ => {
    t->Ava.is(state.contents, 1, ~message="[async] Parallel 2 should have incremented by now", ())

    state := state.contents + 1

    t->Ava.is(state.contents, 2, ~message="[async] Parallel 1 should increment", ())
  })
})

Ava.testAsync("[async] Parallel 2", t => {
  Promise.resolve()->Promise.finally(_ => {
    t->Ava.is(state.contents, 0, ~message="[async] Parallel 2 should be the first to increment", ())

    state := state.contents + 1

    t->Ava.is(state.contents, 1, ~message="[async] Parallel 2 should increment", ())
  })
})

Ava.testAsync("[async] Parallel 3", t => {
  sleep(20)->Promise.finally(_ => {
    t->Ava.is(
      state.contents,
      2,
      ~message="[async] Parallel 1 and 2 should should have incremented by now",
      (),
    )

    state := state.contents + 1

    t->Ava.is(state.contents, 3, ~message="[async] Parallel 3 should increment last", ())
  })
})
