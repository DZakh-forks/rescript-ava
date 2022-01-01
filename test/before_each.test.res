let state = ref(0)

Ava.beforeEach(_ => {
  state := state.contents + 1
})

Ava.test("[range] Should be within range 1", t => {
  t->Ava.true_(state.contents > 0, ~message="'state.contents' should be greater than 0", ())
  t->Ava.false_(state.contents > 4, ~message="'state.contents' should be less than 5", ())
})

Ava.test("[range] Should be within range 2", t => {
  t->Ava.true_(state.contents > 0, ~message="'state.contents' should be greater than 0", ())
  t->Ava.false_(state.contents > 4, ~message="'state.contents' should be less than 5", ())
})

Ava.test("[range] Should be within range 3", t => {
  t->Ava.true_(state.contents > 0, ~message="'state.contents' should be greater than 0", ())
  t->Ava.false_(state.contents > 4, ~message="'state.contents' should be less than 5", ())
})

Ava.test("[range] Should be within range 4", t => {
  t->Ava.true_(state.contents > 0, ~message="'state.contents' should be greater than 0", ())
  t->Ava.false_(state.contents > 4, ~message="'state.contents' should be less than 5", ())
})
