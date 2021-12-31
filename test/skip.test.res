Ava.skip("should skip", t => {
  t->Ava.fail(~message="Test is broken", ())
})

Ava.skip("should skip another", t => {
  t->Ava.fail(~message="Test is broken, too", ())
})
