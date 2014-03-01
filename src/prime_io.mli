(* Copyright (C) 2014  Petter Urkedal <paurkedal@gmail.com>
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

(** Helpers for standard library channels. *)

val with_file_in : (in_channel -> 'a) -> string -> 'a
(** [with_file_in f fp] is [f ic] where [ic] is a channel opened for input
    from the file at [fp].  [ic] is closed when [f] returns or raises an
    exception. *)

val with_file_out : (out_channel -> 'a) -> string -> 'a
(** [with_file_out f fp] calls [f oc] where [oc] is a channel opened for
    output to [fp].  [oc] is closed when [f] returns or raises an exception.
    In the latter case the file is also removed. *)
