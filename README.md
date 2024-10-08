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
~ "git: github.com/Marcos-cat/makros" ~ Struct! # Import by name
```

or

```uiua
Makros ~ "git: github.com/Marcos-cat/makros" # Import namespace
```

## Available Macros

- [`Struct!`](#struct): arrays with named fields
- [`Enum!`](#enum): sets of unique named values
- [`Match!`](#match): a more restrictive and intuitive form of pattern matching

## Usage

### `Struct!`

- Field accessors for each field
- `New` function which pops all fields off the stack and into an array
- `Default` function which fills certain fields with a predefined value
  - Default values must directly follow the field name and enclose the value in
    parentheses. `Age( 35 )` is correct, but `Age (35)` is not
- `Map` function which converts an instance into a string-accessed `map`
- `Fields` array which is the name of each field as a string
- Structs defined with `[]` will not be boxed, and ones defined with `{}` will

Example:

```uiua
---Person
  Struct!{FirstName("John") LastName("Smith") Age(35)}
  FullName ← $"_ _"⊃FirstName LastName
---

Person~Default
## {"John" "Smith" 35}

Person~New "bobby" "tables" 7
## {"bobby" "tables" 7}
.
Person~FullName
## "bobby tables"
◌
Person~Map
## ╭─
##   ⌜FirstName⌟ → ⌜bobby⌟
##   ⌜LastName⌟  → ⌜tables⌟
##   ⌜Age⌟       →       □7
##                          ╯
```

If you don't need custom methods on the struct, there is a shorthand to create
the module inline.

```uiua
Struct‼Person{FirstName LastName Age}
```

> The macro `Struct‼` has to be imported separately from `Struct!`, even though
> they share a name.

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

---Color ~ Temperature
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
