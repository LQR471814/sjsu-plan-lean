-- logical predicate types:
-- 1. courses (bool flag)
-- 2. course areas (in a particular set)
-- 3. institution where units were taken (set)
-- 4. lower/upper div (set)
-- 5. years

-- plan: (monad)
-- 1. list of taken courses + year they were taken

inductive Institution where
  | sjsu
  | community_college
  | non_cc_transfer

inductive Division where
  | upper
  | lower

structure Course where
  name : String
  units : Nat

structure Year where
  number : Nat
  unit_capacity : Nat

structure CourseRegistration where
  course : Course
  year : Year

structure Plan where
  taken : List CourseRegistration
  total_units : Nat
