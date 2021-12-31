open Ava

test("Test assertions", t => {
  let x = {"hello": "world"}
  let y = x
  let z = {"hello": "world"}

  t->is(42, 42, ~message="Numbers are equal", ())
  t->Ava.not(42, 43, ~message="Numbers are not equal", ())

  t->is(x, x, ~message="object is object", ())
  t->is(x, y, ~message="object is object", ())
  t->Ava.not(x, z, ~message="object is not object with same values", ())
  t->deepEqual(x, z, ~message="Object is deep equal", ())

  t->truthy(true, ~message="boolean is ok", ())
  t->false_(false, ~message="boolean is not ok", ())
})
