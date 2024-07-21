# Makros.ua

Makros is a collection of macros intended to speed up uiua development.

The library itself is **NOT** experimental (unlike
[`uiua-math`](https://github.com/Omnikar/uiua-math) 😏), although certain macros
are. This means you don't need to have `# Experimental!` code unless you
*really* want to.

A goal of Makros is to make niceties for dealing with common patterns found in
larger programs.

## Use Makros

```uiua
~ "git: Marcos-cat/makros" ~ Struct! # Import by name
```

or

```uiua
Makros ~ "git: Marcos-cat/makros" # Import namespace
```

## Available Macros

- [`Struct!`](#struct): arrays with named fields
- [`Enum!`](#enum): sets of unique named values
- [`Match!`](#match): a more restrictive and intuitive form of pattern matching

## Usage

### `Struct!`

- Field accessors for each field
- `New` function which pops all fields off the stack and into an array
- `AsMap` function which converts an instance into a string-accessed `map`
- `Fields` array which is the name of each field as a string
- Structs defined with `[]` will not be boxed, and ones defined with `{}` will

Example:

```uiua
---Person
  Struct!{FirstName LastName Age}
  FullName ← $"_ _"⊃FirstName LastName
---

Person~New "bobby" "tables" 7
## {"bobby" "tables" 7}
.
Person~FullName
## "bobby tables"
◌
Person~AsMap
## ╭─
##   ⌜FirstName⌟ → ⌜bobby⌟
##   ⌜LastName⌟  → ⌜tables⌟
##   ⌜Age⌟       →       □7
##                          ╯
```

### `Enum!`

- Constants for each variant which are increasing integers from zero
- `Display` function which converts a variant into a string form
- `Variants` array which is the name of each variant as a string

Example:

```uiua
---Seasons
  Enum![Spring Summer Fall Winter]
  Next ← ◿⧻Variants+1
---

Seasons~Summer
## 1
Seasons~Display
## "Summer"
⍜°Seasons~Display Seasons~Next
## "Fall"
⍜°Seasons~Display Seasons~Next
## "Winter"
⍜°Seasons~Display Seasons~Next
## "Spring"
```

### `Match!`

- Requires `# Experimental!`
- Arms are can be in the form `pattern => code` or `pattern -> code`
- The benefit as over a simple `⍣` is that the code section of the branch is
  wrapped in `case`, and thus errors in the arms do not fall though to the next
  branch causing headaches while debugging

Example:

```uiua

---Color
  Enum![Red Orange Yellow Green Blue Purple]

  Temperature ← Match!(
    Red + Orange => "Hot"
  | Yellow -> "Warm"
  | Green => "Cool"
  | Blue + Purple -> "Cold"
  )
---

Temperature Color~Red
## "Hot"
Temperature Color~Purple
## "Cold"
```
