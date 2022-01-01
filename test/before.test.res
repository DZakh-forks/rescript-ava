let state = ref(0)

Ava.before(_ => {
  state := 1
})

Ava.test("Should be 1", t => {
  t->Ava.is(state.contents, 1, ~message="'state.contents' should be 1", ())
})

Ava.test("Should still be 1", t => {
  t->Ava.is(state.contents, 1, ~message="'state.contents' should still be 1", ())
})
