Enum! ←^ /◇⊂⍚$"_ ← _\n":°⊏⊜□⊸≠@ °{$"[_]"}

# A boxed struct, with functions to retrieve fields.
# 
# Example:
# 
# ```uiua
# Struct!{A B C}
# Instance ← New 3 "Hello" [π ∞]
# B Instance
# ```
# > "Hello"
Struct! ←^ ⊂⊃($"New ← {_}\n"↯⊙@⊙⧻|/◇⊂⍚$"_ ← °□⊡_\n":°⊏)⊜□⊸≠@ °{$"{_}"}
