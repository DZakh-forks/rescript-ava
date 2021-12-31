// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Ava from "../src/ava.mjs";

Ava.test("Test assertions", (function (t) {
        var x = {
          hello: "world"
        };
        var z = {
          hello: "world"
        };
        Ava.is(t, 42, 42, "Numbers are equal", undefined);
        Ava.not(t, 42, 43, "Numbers are not equal", undefined);
        Ava.is(t, x, x, "object is object", undefined);
        Ava.is(t, x, x, "object is object", undefined);
        Ava.not(t, x, z, "object is not object with same values", undefined);
        Ava.deepEqual(t, x, z, "Object is deep equal", undefined);
        Ava.truthy(t, true, "boolean is ok", undefined);
        return Ava.false_(t, false, "boolean is not ok", undefined);
      }));

export {
  
}
/*  Not a pure module */
