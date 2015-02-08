(* Copyright (C) 2013--2015  Petter Urkedal <paurkedal@gmail.com>
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

open OUnit

let suite = "prime" >::: [
  "test_array" >:: Test_array.run;
  "test_cache_metric" >:: Test_cache_metric.run;
  "test_enumlist" >:: Test_enumlist.run;
  "test_enummap" >:: Test_enummap.run;
  "test_enumset" >:: Test_enumset.run;
  "test_int" >:: Test_int.run;
  "test_list" >:: Test_list.run;
  "test_map" >:: Test_map.run;
  "test_retraction" >:: Test_retraction.run;
  "test_string" >:: Test_string.run;
  "test_wallet" >:: Test_wallet.run;
]

let _ =
  Random.self_init ();
  run_test_tt_main suite
