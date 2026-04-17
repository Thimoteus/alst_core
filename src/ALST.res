/**
 Formats the Apparent Local Sidereal Time (ALST) for a given date and longitude.
*/
@genType
let alst = (date: Date.t, long: Angles.Deg.t): (float, float, float) => {
  let long = long->Angles.Deg.normalize_long
  let jd_ut = Julian.fromDate(date)
  let jd_tt = Date.fromTime(date->Date.getTime + 32.184 * 1_000.)->Julian.fromDate
  let jd_0 = {
    let newDate = date->Date.getTime->Date.fromTime
    newDate->Date.setUTCHoursMSMs(~hours=0, ~minutes=0, ~seconds=0, ~milliseconds=0)
    newDate->Julian.fromDate
  }
  let (d_tt, gmst) = {
    open! Julian
    let h = 24. *. (jd_ut - jd_0)
    let d_tt = jd_tt - j2000
    let d_ut = jd_0 - j2000
    let t = d_tt /. 36_525.
    let gmst =
      (6.697375 +.
      0.065707485828 *. d_ut +
      1.0027379 *. h +
      0.0854103 *. t +
      0.0000258 *. t ** 2.) % 24.
    (d_tt, gmst)
  }
  let epsilon = Angles.Deg.Deg(23.4393 -. 0.0000004 *. d_tt->Julian.unwrap)
  let l = Angles.Deg.Deg(280.47 + 0.98565 * d_tt->Julian.unwrap)
  let omega = Angles.Deg.Deg(125.04 - 0.052954 * d_tt->Julian.unwrap)
  let delta_psi = {
    open! Angles.Rad
    open! Angles.Deg
    -0.000319 * sin(toRad(omega)) - 0.000024 * sin(2. *. l->toRad)
  }
  let eqeq = delta_psi * Angles.Rad.cos(epsilon->Angles.Deg.toRad)
  let gast = gmst->Julian.unwrap + eqeq
  let alst = gast + long->Angles.Deg.unwrap
  let h = Math.floor(alst)
  let alst = alst - h
  let m = Math.floor(60. * alst)
  let alst = alst - m / 60.
  let s = Math.floor(60. * 60. * alst)
  (h, m, s)
}
