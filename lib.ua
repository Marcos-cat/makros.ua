# A set of named distiguishable constants.
# 
# Generates:
# - Constants for each variant which are increasing integers from zero
# - `Display` function which converts a variant into a string form
# - `Variants` array which is the name of each variant as a string
Enum! ←^ (
  ⊜□⊸≠@ °{$"[_]"}
  ⍤"Enums must contain at least one variant">0⊸⧻
  ⍤"Enum variants must all be unique"⊸≍⊸◴
  /$"_\n_"{
    ⊃(
      $"Variants ← _"repr
    | $"Display ← ⊏⊙Variants"
    | /◇⊂⍚$"_ ← _\n":°⊏
    )
  }
)

# ---test
# ---Seasons
#  Enum![Spring Summer Fall Winter]
# ---
# °"Spring" Seasons~Display Seasons~Spring
# °"Fall" Seasons~Display Seasons~Fall
# ◌°.⊸◴[Seasons~Fall Seasons~Summer Seasons~Winter Seasons~Spring]
# ---

# A boxed struct with functions to retrieve fields.
# 
# Generates:
# - Field accessors for each field
# - `New` function which pops all fields off the stack and into a box array
# - `AsMap` function which converts an instance into a string-accessed `map`
# - `Fields` array which is the name of each field as a string
Struct! ←^ (
  ⊜□⊸≠@ °{$"{_}"}
  ⍤"Structs must contain at least one field">0⊸⧻
  ⍤"Struct fields must all be unique"⊸≍⊸◴
  /$"_\n_"{
    ⊃(
      $"New ← {_}"↯⊙@⊙⧻
    | $"Fields ← _"repr
    | $"AsMap ← map Fields"
    | /◇⊂⍚$"_ ← °□⊡_\n":°⊏
    )
  }
)

# ---test
# ---Person
#  Struct!{FirstName LastName Age}
#  PassYear ← ⍜Age(+1)
#  FullName ← $"_ _"⊃FirstName LastName
# ---
# Me ← Person~New "jan" "Makoso" 15
# °16 Person~Age Person~PassYear Me
# °"jan Makoso" Person~FullName Me
# ---
