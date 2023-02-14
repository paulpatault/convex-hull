(* This file is generated by Why3's Coq driver *)
(* Beware! Only edit allowed sections below    *)
Require Import BuiltIn.
Require BuiltIn.
Require HighOrd.
Require int.Int.
Require real.Real.
Require real.RealInfix.
Require map.Map.

Parameter us_FORMULA_TO_BE_COMPLETED__: Prop.

Parameter us_TERM_TO_BE_COMPLETED__: forall {a:Type} {a_WT:WhyType a}, a.

Parameter us_VARIANT_TO_BE_COMPLETED__: Numbers.BinNums.Z.

(* Why3 assumption *)
Inductive pt :=
  | pt'mk : Reals.Rdefinitions.R -> Reals.Rdefinitions.R -> pt.
Axiom pt_WhyType : WhyType pt.
Existing Instance pt_WhyType.

(* Why3 assumption *)
Definition y (v:pt) : Reals.Rdefinitions.R :=
  match v with
  | pt'mk x x1 => x1
  end.

(* Why3 assumption *)
Definition x (v:pt) : Reals.Rdefinitions.R :=
  match v with
  | pt'mk x1 x2 => x1
  end.

Axiom array : forall (a:Type), Type.
Parameter array_WhyType :
  forall (a:Type) {a_WT:WhyType a}, WhyType (array a).
Existing Instance array_WhyType.

Parameter elts:
  forall {a:Type} {a_WT:WhyType a}, array a -> Numbers.BinNums.Z -> a.

Parameter length:
  forall {a:Type} {a_WT:WhyType a}, array a -> Numbers.BinNums.Z.

Axiom array'invariant :
  forall {a:Type} {a_WT:WhyType a},
  forall (self:array a), (0%Z <= (length self))%Z.

(* Why3 assumption *)
Definition mixfix_lbrb {a:Type} {a_WT:WhyType a} (a1:array a)
    (i:Numbers.BinNums.Z) : a :=
  elts a1 i.

Parameter mixfix_lblsmnrb:
  forall {a:Type} {a_WT:WhyType a}, array a -> Numbers.BinNums.Z -> a ->
  array a.

Axiom mixfix_lblsmnrb'spec :
  forall {a:Type} {a_WT:WhyType a},
  forall (a1:array a) (i:Numbers.BinNums.Z) (v:a),
  ((length (mixfix_lblsmnrb a1 i v)) = (length a1)) /\
  ((elts (mixfix_lblsmnrb a1 i v)) = (map.Map.set (elts a1) i v)).

Parameter make:
  forall {a:Type} {a_WT:WhyType a}, Numbers.BinNums.Z -> a -> array a.

Axiom make_spec :
  forall {a:Type} {a_WT:WhyType a},
  forall (n:Numbers.BinNums.Z) (v:a), (0%Z <= n)%Z ->
  (forall (i:Numbers.BinNums.Z), (0%Z <= i)%Z /\ (i < n)%Z ->
   ((mixfix_lbrb (make n v) i) = v)) /\
  ((length (make n v)) = n).

(* Why3 assumption *)
Definition pt_set := array pt.

(* Why3 assumption *)
Definition is_index (i:Numbers.BinNums.Z) (s:array pt) : Prop :=
  (0%Z <= i)%Z /\ (i < (length s))%Z.

(* Why3 assumption *)
Definition is_lower_pt (p1:pt) (p2:pt) : Prop :=
  ((y p1) < (y p2))%R \/ ((y p1) = (y p2)) /\ ((x p1) <= (x p2))%R.

(* Why3 assumption *)
Inductive ref (a:Type) :=
  | ref'mk : a -> ref a.
Axiom ref_WhyType : forall (a:Type) {a_WT:WhyType a}, WhyType (ref a).
Existing Instance ref_WhyType.
Arguments ref'mk {a}.

(* Why3 assumption *)
Definition contents {a:Type} {a_WT:WhyType a} (v:ref a) : a :=
  match v with
  | ref'mk x1 => x1
  end.

(* Why3 assumption *)
Definition crossproduct (p1:pt) (p2:pt) (p3:pt) : Reals.Rdefinitions.R :=
  ((((x p2) - (x p1))%R * ((y p3) - (y p1))%R)%R -
   (((x p3) - (x p1))%R * ((y p2) - (y p1))%R)%R)%R.

(* Why3 assumption *)
Definition colinear (p1:pt) (p2:pt) (p3:pt) : Prop :=
  ((crossproduct p1 p2 p3) = 0%R).

(* Why3 assumption *)
Definition ccw (p1:pt) (p2:pt) (p3:pt) : Prop :=
  (0%R < (crossproduct p1 p2 p3))%R.

Axiom knuth1 : forall (p1:pt) (p2:pt) (p3:pt), ccw p1 p2 p3 -> ccw p2 p3 p1.

Axiom knuth2 :
  forall (p1:pt) (p2:pt) (p3:pt), ccw p1 p2 p3 -> ~ ccw p2 p1 p3.

Axiom knuth3 :
  forall (p1:pt) (p2:pt) (p3:pt), ~ colinear p1 p2 p3 ->
  ccw p1 p2 p3 \/ ccw p1 p3 p2.

Axiom knuth4 :
  forall (p1:pt) (p2:pt) (p3:pt) (q:pt), ccw q p1 p2 -> ccw q p2 p3 ->
  ccw q p3 p1 -> ccw p1 p2 p3.

Axiom cramer :
  forall (p1:pt) (p2:pt) (p3:pt) (q1:pt) (q2:pt),
  ((((crossproduct q1 q2 p3) * (crossproduct q2 p1 p2))%R +
    ((crossproduct q1 q2 p1) * (crossproduct q2 p2 p3))%R)%R
   = ((crossproduct q1 q2 p2) * (crossproduct q2 p1 p3))%R).

Axiom knuth5_aux :
  forall (p1:pt) (p2:pt) (p3:pt) (q1:pt) (q2:pt),
  ccw q1 q2 p1 /\ ccw q2 p2 p3 /\ ccw q1 q2 p3 /\ ccw q2 p1 p2 ->
  (0%R < ((crossproduct q1 q2 p2) * (crossproduct q2 p1 p3))%R)%R /\
  ((0%R < (crossproduct q1 q2 p2))%R -> (0%R < (crossproduct q2 p1 p3))%R).

Axiom knuth5 :
  forall (p1:pt) (p2:pt) (p3:pt) (q1:pt) (q2:pt),
  ccw q1 q2 p1 /\ ccw q1 q2 p2 /\ ccw q1 q2 p3 ->
  ccw q2 p1 p2 /\ ccw q2 p2 p3 -> ccw q2 p1 p3.

(* Why3 assumption *)
Definition all_on_left (s:array pt) (i:Numbers.BinNums.Z)
    (j:Numbers.BinNums.Z) : Prop :=
  forall (k:Numbers.BinNums.Z), is_index k s -> ~ (k = i) -> ~ (k = j) ->
  ccw (mixfix_lbrb s i) (mixfix_lbrb s j) (mixfix_lbrb s k).

Parameter sub:
  forall {xi:Type} {xi_WT:WhyType xi}, array xi -> Numbers.BinNums.Z ->
  Numbers.BinNums.Z -> array xi.

Axiom sub'spec :
  forall {xi:Type} {xi_WT:WhyType xi},
  forall (a:array xi) (ofs:Numbers.BinNums.Z) (len:Numbers.BinNums.Z),
  (0%Z <= ofs)%Z /\ (0%Z <= len)%Z /\ ((ofs + len)%Z <= (length a))%Z ->
  ((length (sub a ofs len)) = len) /\
  (forall (i:Numbers.BinNums.Z), (0%Z <= i)%Z /\ (i < len)%Z ->
   ((mixfix_lbrb (sub a ofs len) i) = (mixfix_lbrb a (ofs + i)%Z))).

Parameter s: array pt.

Parameter i: Numbers.BinNums.Z.

Parameter j: Numbers.BinNums.Z.

Axiom Requires : is_index i s.

Axiom Requires1 : is_index j s.

Axiom H : (0%Z <= (((length s) - 1%Z)%Z + 1%Z)%Z)%Z.

Parameter k: Numbers.BinNums.Z.

Axiom H1 : (0%Z <= k)%Z.

Axiom H2 : (k <= ((length s) - 1%Z)%Z)%Z.

Axiom LoopInvariant :
  forall (l:Numbers.BinNums.Z), (0%Z <= l)%Z /\ (l < k)%Z -> ~ (l = i) ->
  ~ (l = j) -> ccw (mixfix_lbrb s i) (mixfix_lbrb s j) (mixfix_lbrb s l).

Axiom LoopInvariant1 : (0%Z < k)%Z -> is_index (k - 1%Z)%Z s.

Parameter ccw'result'unused'unused: Init.Datatypes.bool.

Axiom ccw'result'unused'unused'def :
  (ccw (mixfix_lbrb s i) (mixfix_lbrb s j) (mixfix_lbrb s k) ->
   (ccw'result'unused'unused = Init.Datatypes.true)) /\
  (~ ccw (mixfix_lbrb s i) (mixfix_lbrb s j) (mixfix_lbrb s k) ->
   (ccw'result'unused'unused = Init.Datatypes.false)).

Axiom H3 : ~ ccw (mixfix_lbrb s i) (mixfix_lbrb s j) (mixfix_lbrb s k).

(* Why3 goal *)
Theorem check_all_on_left'vc : ~ all_on_left s i j.
Proof.


Qed.

