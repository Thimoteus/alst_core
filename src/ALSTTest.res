@module("node:test") external test: (string, unit => unit) => unit = "test"
@module("node:assert/strict") external strictEqual: ('a, 'a, string) => unit = "strictEqual"
@module("node:assert/strict") external ok: (bool, string) => unit = "ok"

open ALST

test("known ALST values", () => {
  let date = Date.fromTime(946_728_000_000.0)
  let (h, m, s) = alst(date, Angles.Deg.make(0.))
  strictEqual(h, 18., "hours should be 18")
  strictEqual(m, 41., "minutes should be 41")
  strictEqual(s, 49., "seconds should be 49")
})

test("values should be positive", () => {
  let date = Date.fromTime(1_775_828_593_872.)
  let long = Angles.Deg.make(-122.4194)
  let (h, m, s) = alst(date, long)
  ok(h > 0., "hours should be positive")
  ok(m > 0., "minutes should be positive")
  ok(s > 0., "seconds should be positive")
})
