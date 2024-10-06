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
Pack   ← M!((?)())/$"_|_"
Fork   ← ⊂@⊃Pack
Try    ← ⊂@⍣Pack
Lines! ←^ M!(/$"_\n_" {?}) Fork ⊙◌
# ? Identifier Body
Module ← $$ ---_
         $$ _
         $$ ---
# ? Comment Item
Doc ← $"# _\n_"
Sig ← $"? _" /$"_ _"

Assert! ←^ Fork ⊂⍚M!(⍤?) ⊙(□↯⊙@⊙/↥⍤"All asserts must have two outputs"/↧=2∩⊢⊸⇌⍉) # Track caller!
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
  Try‼"Invalid Struct syntax"⍣(
    °M![?]
    ⍣(⊙[⊸≠∞ ⋕▽⊸≠@ ] °M!(?:?))⊙[1 0]
    ⊙0
  | ⊙(1 0)°M!{?})
  # ? Definition IsBox [IsRanked Rank]
  ⊜□⊸≠@ 
  Assert!(
    "Struct must have at least one field" >0⧻
  | $"Struct fields must all be different: _" ⊃(/$"_, _"◴|≍0⧻) ▽¬⊸◰
  )
  Lines!(
    BP!RankMagic ⨬M!∘(M!(?⍉) ▽≠1⟜M!setinv⍜(☇?)≡⍉⍜(☇?)≡°⍉.+1⊡1)⊸⊢⋅⋅∘
  | Doc Sig ⟜(B!New M!(RankMagic ?) ⨬M![?]M!{?} : ≡⋅@⊙)
  | B!Fields repr
  | Lines ⍚(Doc$"Get `_`"⟜B!∘ ⊙⊂⊙⊃⋅(▽⊙M!°□)M!(⊡?°RankMagic)) : °⊏
  | B!Map M!(map Fields)
  )
)

# A set of named, distinguishable constants.
Enum! ←^ EnumImpl Try‼"Enum! takes only a defintion"°{∘} # Track caller!
# A set of named, distinguishable constants.
Enum‼ ←^ Module⊙EnumImpl Try‼"Enum‼ takes an identifier and a defintion"°{⊙∘} # Track caller!

# An array with functions to retrieve named fields.
Struct! ←^ StructImpl Try‼"Struct! takes only a defintion"°{∘} # Track caller!
# An array with functions to retrieve named fields.
Struct‼ ←^ Module⊙StructImpl Try‼"Struct‼ takes an identifier and a defintion"°{⊙∘} # Track caller!

# A rust-style pattern match, similar to ⍣ `try`
Match! ←^ (
  ⊙◌
  Try‼"All branches must contain `pattern -> code`"⍚⍣°M!(?->?)°M!(?=>?)
  ⍚(⊜□⊸≠@+
    ⍚M!°(?)
    ⍣°{∘}Try
  )
  Try⍚M!(case(?) (?)):
)
