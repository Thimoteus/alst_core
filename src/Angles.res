type rad = Rad(float)

let pi = 3.14159265358979

let sign = (x: float): float => x == 0. ? 0. : x /. Math.abs(x)
let modulo = (x: float, y: float): float => y == 0. ? 0. : x -. Math.floor(x /. y) *. y

module Rad = {
  type t = Rad(float)
  let \"*." = (a, Rad(v)) => Rad(a * v)
  let sin = (Rad(v)) => Math.sin(v)
  let cos = (Rad(v)) => Math.cos(v)
}

module Deg = {
  @genType
  type t = Deg(float)
  @genType
  let make = (v: float): t => Deg(v)
  let unwrap = (Deg(v): t): float => v
  let toRad = (Deg(v): t): Rad.t => Rad.Rad(v *. pi /. 180.)
  let normalize_long = (Deg(v): t): t => Deg(v -. Math.floor(sign(v) *. v /. 360.) *. 360.)
}
