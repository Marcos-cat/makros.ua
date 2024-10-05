Fmt ← $$ $"_"

M! ←^ (
  °{∘}
  ⇌⊚⊸∈$ \"_
  ∧⍜⊙↻⊂@\\
  ⍜▽⋅@_⊸=@?
  Fmt
)

B!  ←^ M!$"? ← _" ⍥⋅@_⊸≍M!∘ °{∘}
BP! ←^ M!$"? ↚ _" ⍥⋅@_⊸≍M!∘ °{∘}

Lines  ← /$"_\n_"
Fork   ← M!(⊃(?)())/$"_|_"
Lines! ←^ M!(/$"_\n_" {?}) Fork ⊙◌

Assert! ←^ Fork ⊂⍚M!(⍤?) ⊙(□↯⊙@⊙/↥⍤"All asserts must have two outputs"/↧=2∩⊢⊸⇌⍉)
Try‼ ←^ (
  :°{⊙∘} ⊙(⊂⊃(↯⊙@./-|↯⊙@⊙⊢)⊡1)
  M!⍣(?|⍤?0 ?)
)

Enum! ←^ (
  # Track caller!
  °{∘}
  Try‼"Invalid Enum syntax"°M![?]
  ⊜□⊸≠@ 
  Assert!(
    "Enum must have at least one variant" >0⧻
  | $"Enum variants must all be different: _" ⊃(/$"_, _"◴|≍0⧻) ▽¬⊸◰
  )

  Lines!(
    B!Variants repr
  | Lines ⍚B!∘ : °⊏
  | B!Display M!(⊏⊙Variants)
  )

  ⊸&p
)

Enum![One Two]

