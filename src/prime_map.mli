(* Copyright (C) 2013  Petter Urkedal <paurkedal@gmail.com>
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

(** Amendment to [Map]. *)

module type OrderedType = Map.OrderedType

module type S = sig
  include Map.S

  val pop : key -> 'a t -> 'a * 'a t
  (** [pop k m] returns [(find k m, remove k m)] raising [Not_found] if [k]
      has no mapping in [m]. *)

  val fold2t : (key -> 'a -> 'b -> 'c -> 'c) -> 'a t -> 'b t -> 'c -> 'c
  (** [fold2t f m0 m1] returns the composition [f kₙ vₙ wₙ ∘ ⋯ ∘ f k₁ v₁ w₁]
      where [k₁, …, kₙ] are the coinciding indices of [m0] and [m1], and [v₁,
      …, vₙ] and [w₁, …, wₙ] are the correspoding values from [m0] and [m1],
      respectively. *)

  val map2t : ('a -> 'b -> 'c) -> 'a t -> 'b t -> 'c t
  (** [map2t f m0 m1] returns a map which contains a mapping from [k] to [f x0
      x1] for each [k], [x0], and [x1] such that [m0] maps [k] to [x0] and
      [m1] maps [k] to [x1]. *)

  val mapi2t : (key -> 'a -> 'b -> 'c) -> 'a t -> 'b t -> 'c t
  (** [mapi2t f m0 m1] returns a map which contains a mapping from [k] to [f k
      x0 x1] for each [k], [x0], and [x1] such that [m0] maps [k] to [x0] and
      [m1] maps [k] to [x1]. *)

  val left_union : 'a t -> 'a t -> 'a t
  (** [left_union m0 m1] is the map whose domain is the union of the domains
      of [m0] and [m1] and whose values agree with [m0] where present and [m1]
      elsewhere. *)

  val left_inter : 'a t -> 'b t -> 'a t
  (** @deprecated Use [mapi2t fst]. *)

  val compl : 'a t -> 'a t -> 'a t
  (** [compl mN mP] is the complement of [mN] relative to [mP]. *)
end

module Make (K : OrderedType) : S with type key = K.t
