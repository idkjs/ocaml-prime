(* Copyright (C) 2015  Petter Urkedal <paurkedal@gmail.com>
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

(** Pure random access list.
    A balanced binary tree with a list-like interface, yielding logarithmic
    amortized complexity for arbitrary element access, insert, and removal. *)

type 'a t

val is_empty : 'a t -> bool

val length : 'a t -> int

val empty : 'a t

val singleton : 'a -> 'a t

val get : int -> 'a t -> 'a

val first_e : 'a t -> 'a

val last_e : 'a t -> 'a

val pop_first_e : 'a t -> 'a * 'a t

val pop_last_e : 'a t -> 'a * 'a t

val push_first : 'a -> 'a t -> 'a t

val push_last : 'a -> 'a t -> 'a t

val insert : int -> 'a -> 'a t -> 'a t

val delete : int -> 'a t -> 'a t

val glue : 'a -> 'a t -> 'a t -> 'a t

val cat : 'a t -> 'a t -> 'a t

val elements : 'a t -> 'a list

val search : ('a -> 'b option) -> 'a t -> 'b option

val iter : ('a -> unit) -> 'a t -> unit

val fold : ('a -> 'b -> 'b) -> 'a t -> 'b -> 'b

val for_all : ('a -> bool) -> 'a t -> bool

val exists : ('a -> bool) -> 'a t -> bool

val filter : ('a -> bool) -> 'a t -> 'a t

val compare : ('a -> 'b -> int) -> 'a t -> 'b t -> int

val equal : ('a -> 'b -> bool) -> 'a t -> 'b t -> bool
