Ava.serial("[blocking] Should greet", t => {
  t->Ava.pass(~message="Hello world!", ())
})

Ava.serial("[blocking] Should answer question", t => {
  let answer = 42
  t->Ava.is(answer, 42, ~message="Should be 42", ())
})
