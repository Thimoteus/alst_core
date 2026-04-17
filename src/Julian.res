type t = Julian(float)

let j2000: t = Julian(2_451_545.0)

let fromDate = (d: Date.t): t => {
  let t = d->Date.getTime
  Julian(t /. 86_400_000.0 +. 2_440_587.5)
}

let unwrap = (Julian(d): t): float => d

let \"+" = (Julian(a), Julian(b)) => Julian(a + b)
let \"+." = (a, Julian(b)) => Julian(a +. b)
let \"-" = (Julian(a), Julian(b)) => Julian(a - b)
let \"-." = (a, Julian(b)) => Julian(a -. b)
let \"*" = (Julian(a), Julian(b)) => Julian(a * b)
let \"*." = (a, Julian(b)) => Julian(a *. b)
let \"/" = (Julian(a), Julian(b)) => Julian(a /. b)
let \"/." = (Julian(a), b) => Julian(a /. b)
let \"**" = (Julian(a), b) => Julian(a ** b)
let \"%" = (Julian(a), b) => Julian(a % b)
