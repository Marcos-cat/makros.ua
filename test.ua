~ "./lib.ua" ~ Enum! Match! Struct! Struct‼

# Experimental!

---test
---Person
  Struct!{FirstName("John") LastName Age(35)}
  PassYear ← ⍜Age(+1)
  FullName ← $"_ _"⊃FirstName LastName
---

⍤⤙≍ {"John" "Smith" 35} Person~Default "Smith"
Me ← Person~New "jan" "Makoso" 15
⍤⤙≍ 16 Person~Age Person~PassYear Me
⍤⤙≍ "jan Makoso" Person~FullName Me
---

---test
Struct‼Pixel[R G B]

⍤⤙≍ [0.8 0.3 0.5] Pixel 0.8 0.3 0.5
---

---test
---Px
  Struct![Red Green Blue]
---
Size ← ↙2 △ Lena
⍤⤙≍ Size △ Px~Red Lena
⍤⤙≍ ⊂3Size △ [°Px~New] Lena
---

---test
---Line
  Struct![Pt₁ Pt₂ : 1]
---

L ← Line~New 1_2 3_4
⍤⤙≍ [1_2 3_4] L
⍤⤙≍ [1_2 2_3] Line~Pt₁ [L +1L]
⍤⤙≍ [3_4 4_5] Line~Pt₂ [L +1L]

Ls ← Line~New [0_0 3_4 9_10] [1_1 3_5 10_9]
⍤⤙≍ 3_2_2 △Ls
E ← Line~Pt₂ ↯2 Ls
⍤⤙≍ 2_3_2 △E
---

---test
---Quadratic ~ Solve
  Struct![a b c]
  Solve ← ÷⊃(×2a|+⊃(¯b|⊟⊸¯√-⊃(×4×⊃a c|ⁿ2 b)))
---

Eq ← Quadratic~New 4 ¯8 3
⍤⤙≍ [4 ¯8 3] Eq
⍤⤙≍ [1/2 3/2] Solve Eq
---

---test
---Seasons
  Enum![Spring Summer Fall Winter]
  Next ← ◿⧻Variants +1
---
⍤⤙≍ □"Spring" Seasons~Display Seasons~Spring
⍤⤙≍ □"Fall" Seasons~Display Seasons~Fall
⍤⤙≍ ⊸◴[Seasons~Fall Seasons~Summer Seasons~Winter Seasons~Spring]

⍤⤙≍{"Fall" "Spring"} Seasons~Display [Seasons~Fall Seasons~Spring]
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

⍤⤙≍ "Cold" Color~Temperature Color~Blue
⍤⤙≍ "Warm" Color~Temperature Color~Yellow
---
