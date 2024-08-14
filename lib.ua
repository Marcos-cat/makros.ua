E ↚ ⍤⊙0

NotUnique ← /$"_, _"⍚$"`_`"⟜(=0⧻)▽¬⊸◰

# A set of named distinguishable constants.
Enum! ←^ (
  ⊜□⊸≠@ °{$"[_]"}

  # Track caller!
  ⟜⊃(
    ⍤"Enums must contain at least one variant">0⧻
  | ⍤$"Enum variants must all be unique: _" NotUnique
  )
  /$"_\n_"{
    ⊃(
      $"Variants ← _"repr
    | $"Display ← setinv(⊏⊙Variants|⊗⊙Variants ⍥□≠3⊸type)"
    | /◇⊂⍚$"_ ← _\n":°⊏
    )
  }
)

Boxed ↚ 1
Ranked ↚ 2

StructImpl ↚ (
  ⊜□⊸≠@ ⍣(⊙([Ranked ∘] ⋕▽⊸≠@ )°{$"[_:_]"}|⊙0 °{$"[_]"}|⊙Boxed °{$"{_}"})

  ⟜⊃(
    ⍤"Structs must contain at least one field">0⧻
  | ⍤$"Struct fields must all be unique: _"NotUnique
  )

  /$"_\n_"{
    ⊃(
      $"RankMagic ↚ _⍉" ⨬(⋅""|$"setinv(⍜☇≡⍉_|⍜☇≡°⍉_)".+1⊢⇌)=Ranked⊸⋅⊢
    | $"New ← RankMagic _ # ? _"⊃(
        ⨬$"[_]"$"{_}"=Boxed⊢:↯⊙@⊙⧻
      | /$"_ _"
      )
    | $"Fields ← _"repr
    | $"Map ← map Fields"
    | /◇⊂ ⍚$"_ ← _ (⊡_) °RankMagic\n" ⊙:: ⊓°⊏(¤⨬"""°□"=Boxed⊢)
    )
  }
)

# An array with functions to retrieve named fields.
Struct! ←^ (StructImpl) # Track caller!
# An array with functions to retrieve named fields.
Struct‼ ←^ $"---_\n _ \n ---"⊙(StructImpl)°⊂ # Track caller!

# A rust-style pattern match, similar to ⍣ `try`
Match! ←^ (
  ⍣⍚⍣°$"_->_"°$"_=>_"(E"All branches must contain `pattern -> code`".)
  ⍚(
    ⍚$"°(_)" ⊜□⊸≠@+
    ⍣°{∘}($"⍣(_)"/$"_|_")
  )
  $"⍣(_)()"/$"_|_"⍚$"case(_) (_)":
)⊙◌
