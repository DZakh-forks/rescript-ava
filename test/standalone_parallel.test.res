let sleep = duration =>
  Promise.make((~resolve, ~reject) => {
    let _ = reject

    Js.Global.setTimeout(resolve, duration)->ignore
  })

let state = ref(0)

Ava.testAsync("[async] Should run a test asynchronously", t => {
  let answer = 42
  t->Ava.is(answer, 42, ~message="Should answer the question", ())

  Promise.resolve()
})

Ava.testAsync("[async] Should run a second test at the same time", t => {
  let answer = 3.14
  t->Ava.is(answer, 3.14, ~message="Should be a tasty dessert", ())

  Promise.resolve()
})
