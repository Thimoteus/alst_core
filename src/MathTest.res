@module("node:test") external test: (string, unit => unit) => unit = "test"
@module("node:assert/strict") external equal: ('a, 'a) => unit = "equal"

test("various values", () => {
  let date = Date.fromTime(946728000000.0)
  let (h, m, s) = ALST.alst(date, Angles.Deg.make(0.))
  equal(h, 18.)
  equal(m, 41.)
  equal(s, 49.)
})
