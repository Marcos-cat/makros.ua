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
# ? Identifier Body
Module ← $$ ---_
         $$ _
         $$ ---
# ? Comment Item
Doc ← $"# _\n_"
Sig ← $"? _" /$"_ _"

Assert! ←^ Fork ⊂⍚M!(⍤?) ⊙(□↯⊙@⊙/↥⍤"All asserts must have two outputs"/↧=2∩⊢⊸⇌⍉)
Try‼ ←^ (
  :°{⊙∘} ⊙(⊂⊃(↯⊙@./-|↯⊙@⊙⊢)⊡1)
  M!⍣(?|⍤?0 ?)
)

EnumImpl ← (
  Try‼"Invalid Enum syntax"°M![?]
  ⊜□⊸≠@ 
  Assert!(
    "Enum must have at least one variant" >0⧻
  | $"Enum variants must all be different: _" ⊃(/$"_, _"◴|≍0⧻) ▽¬⊸◰
  )
  Lines!(
    B!Variants repr
  | Lines ⍚B!∘ : °⊏
  | Doc"Convert variants to a string representation" B!Display M!(⊏⊙Variants)
  )
)

StructImpl ← (
  ∘
)

Enum! ←^ EnumImpl Try‼"Enum! takes only a defintion"°{∘} # Track caller!
Enum‼ ←^ Module⊙EnumImpl Try‼"Enum‼ takes an identifier and a defintion"°{⊙∘} # Track caller!

Struct! ←^ StructImpl Try‼"Struct! takes only a defintion"°{∘} # Track caller!
Struct‼ ←^ Module⊙StructImpl Try‼"Struct‼ takes an identifier and a defintion"°{⊙∘} # Track caller!
