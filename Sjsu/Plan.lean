import Mathlib.Data.Finset.Basic
import Sjsu.Types
import Sjsu.Courses
import Sjsu.Semesters

def current_plan : Plan := {
  name := "current",
  taken := {
    { course := biol_10, sem := fall_2025 }
  }
}

