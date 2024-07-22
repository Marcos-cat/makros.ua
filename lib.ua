E ↚ ⍤⊙0

# A set of named distinguishable constants.
Enum! ←^ (
  ⊜□⊸≠@ °{$"[_]"}
  ⍤"Enums must contain at least one variant">0⊸⧻
  ⍤"Enum variants must all be unique"⊸≍⊸◴
  /$"_\n_"{
    ⊃(
      $"Variants ← _"repr
    | $"Display ← setinv(⊏⊙Variants|⊗⊙Variants ⍥□≠3⊸type)"
    | /◇⊂⍚$"_ ← _\n":°⊏
    )
  }
)

# An array with functions to retrieve named fields.
Struct! ←^ (
  ⊜□⊸≠@ ⍣(⊙0 °{$"[_]"}|⊙1 °{$"{_}"})
  ⍤"Structs must contain at least one field">0⊸⧻
  ⍤"Struct fields must all be unique"⊸≍⊸◴
  /$"_\n_"{
    ⊃(
      $"New ← _ # ? _"⊃(⨬$"[_]"$"{_}":↯⊙@⊙⧻)/$"_ _"
    | $"Fields ← _"repr
    | $"AsMap ← map Fields"
    | /◇⊂ ⍚$"_ ← _⊡_\n" ⊙:: ⊓°⊏(¤⨬"""°□")
    )
  }
)

# A rust-style pattern match, similar to ⍣ `try`
Match! ←^ (
  ⍣⍚⍣°$"_->_"°$"_=>_"(E"All branches must contain `pattern -> code`".)
  ⍚(
    ⍚$"°(_)" ⊜□⊸≠@+
    ⍣°{∘}($"⍣(_)"/$"_|_")
  )
  $"⍣(_)()"/$"_|_"⍚$"case(_) (_)":
)⊙◌
