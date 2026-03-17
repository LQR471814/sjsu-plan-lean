import Mathlib.Data.Finset.Basic
import Mathlib.Data.Set.Basic
import Mathlib.Data.Set.Finite.Basic
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Sjsu.Types
import Sjsu.Courses
import Sjsu.Categories

def cat_units (cat : Set Course) (p : Plan) [DecidablePred (· ∈ cat)] :=
  let reg_courses : Finset Course := unwrap_reg_courses p.taken
  let present : Finset Course := Finset.filter (· ∈ cat) reg_courses
  Finset.sum present (·.units)

def has_req_courses (r : Finset Course) (p : Plan) :=
  r ∩ unwrap_reg_courses p.taken = r

def gen_req_met (p : Plan) :=
  cat_units Set.univ p ≥ 120 ∧
  cat_units ge_1a p >= 3 ∧
  cat_units ge_1b p >= 3 ∧
  cat_units ge_1c p >= 3 ∧
  cat_units ge_2 p >= 3 ∧
  cat_units ge_3a p >= 3 ∧
  cat_units ge_3b p >= 3 ∧
  cat_units ge_4 p >= 6 ∧
  cat_units ge_5a p >= 3 ∧
  cat_units ge_5b p >= 3 ∧
  cat_units ge_5c p >= 1 ∧
  cat_units ge_6 p >= 3 ∧
  (cat_units ge_ud_2 p >= 3 ∨ cat_units ge_ud_5 p >= 3) ∧
  cat_units ge_ud_3 p >= 3 ∧
  cat_units ge_ud_4 p >= 3 ∧
  cat_units us1 p > 0 ∧
  cat_units us2 p > 0 ∧
  cat_units us3 p > 0 ∧
  (cat_units us1 p + cat_units us2 p + cat_units us3 p) >= 6 ∧
  cat_units wid > 0 ∧
  has_req_courses { engl_1a } p

def cmpe_req_courses : Finset Course := {
  biol_10,
  engl_1b,
  ise_130,
  math_30,
  math_31,
  math_32,
  math_42,
  math_33la,
  phys_50,
  phys_51,
  cmpe_30,
  cmpe_50,
  engr_10,
  ee_97,
  ee_98,
  cmpe_102,
  cmpe_110,
  cmpe_124,
  cmpe_125,
  cmpe_126,
  cmpe_127,
  cmpe_130,
  cmpe_131,
  cmpe_140,
  cmpe_142,
  cmpe_146,
  cmpe_148,
  cmpe_152,
  cmpe_195a,
  cmpe_195b,
  engr_195a,
  engr_195b
}

def cmpe_req_met (p : Plan) :=
  has_req_courses cmpe_req_courses p ∧
  cat_units upper_div p ≥ 12

