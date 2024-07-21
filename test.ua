~ "./lib.ua" ~ Enum! Match! Struct!

# Experimental!

---test
---Person
  Struct!{FirstName LastName Age}
  PassYear ← ⍜Age(+1)
  FullName ← $"_ _"⊃FirstName LastName
---
Me ← Person~New "jan" "Makoso" 15
⋅⍤◠≍ 16 Person~Age Person~PassYear Me
⋅⍤◠≍ "jan Makoso" Person~FullName Me
---

---test
---Quadratic ~ Solve
  Struct![a b c]
  Solve ← ÷⊃(×2a|+⊃(¯b|⊟⊸¯√-⊃(×4×⊃a c|ⁿ2 b)))
---

Eq ← Quadratic~New 4 ¯8 3
⋅⍤◠≍ [4 ¯8 3] Eq
⋅⍤◠≍ [1/2 3/2] Solve Eq
---

---test
---Seasons
  Enum![Spring Summer Fall Winter]
  Next ← ◿⧻Variants +1
---
⋅⍤◠≍ □"Spring" Seasons~Display Seasons~Spring
⋅⍤◠≍ □"Fall" Seasons~Display Seasons~Fall
⋅⍤◠≍ ⊸◴[Seasons~Fall Seasons~Summer Seasons~Winter Seasons~Spring]

⋅⍤◠≍{"Fall" "Spring"} Seasons~Display [Seasons~Fall Seasons~Spring]
---

---test
---Color
  Enum![Red Orange Yellow Green Blue Purple]

  Temperature ← Match!(
    Red + Orange => "Hot"
  | Yellow -> "Warm"
  | Green => "Cool"
  | Blue + Purple -> "Cold"
  )
---
---
