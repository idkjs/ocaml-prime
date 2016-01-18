(* Copyright (C) 2016  Petter A. Urkedal <paurkedal@gmail.com>
 *
 * This library is free software; you can redistribute it and/or modify it
 * under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or (at your
 * option) any later version, with the OCaml static compilation exception.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public
 * License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library.  If not, see <http://www.gnu.org/licenses/>.
 *)

let e = exp 1.0

let pi = 4.0 *. atan 1.0

let sign x =
  if x < 0.0 then -1.0 else
  if x > 0.0 then  1.0 else 0.0

let round x = if x >= 0.0 then ceil (x -. 0.5) else floor (x +. 0.5)

(* We have 53 bits, but there may be significant noise in the last bits after
 * repeated reciprocals. *)
let default_max_denom = 1 lsl 30

let to_fraction ?(max_denom = default_max_denom) x =
  let rec loop n' n'' d' d'' x =
    let c, a = modf x in
    let n = int_of_float a * n' + n'' in
    let d = int_of_float a * d' + d'' in
    if d < 0 || d > max_denom then (n', d') else
    loop n n' d d' (1.0 /. c) in
  if x >= 0.0 then
    loop 1 0 0 1 x
  else
    let n, d = loop 1 0 0 1 (-. x) in
    (-n, d)
