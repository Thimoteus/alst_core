type rad = Rad(float)

let pi = 3.14159265358979

let sign = x => x == 0. ? 0. : x /. Math.abs(x)
let modulo = (x, y) => y == 0. ? 0. : x -. Math.floor(x /. y) *. y

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
  let make = v => Deg(v)
  let unwrap = (Deg(v)) => v
  let toRad = (Deg(v)) => Rad.Rad(v *. pi /. 180.)
  let normalize_long = (Deg(v)) => Deg(v -. Math.floor(sign(v) *. v /. 360.) *. 360.)
}
