@module("node:test") external test: (string, unit => unit) => unit = "test"
@module("node:assert/strict") external equal: ('a, 'a) => unit = "equal"

test("known ALST values", () => {
  let date = Date.fromTime(946_728_000_000.0)
  let (h, m, s) = ALST.alst(date, Angles.Deg.make(0.))
  equal(h, 18.)
  equal(m, 41.)
  equal(s, 49.)
})
