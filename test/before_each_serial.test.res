let state = ref(0)

Ava.beforeEach(_ => {
  state := state.contents + 1
})

Ava.serial("Should be 1", t => {
  t->Ava.is(state.contents, 1, ~message="'state.contents' should be 1", ())
})

Ava.serial("Should still be 1", t => {
  t->Ava.is(state.contents, 2, ~message="'state.contents' should be 2", ())
})
