# Strings, Binaries and Character Lists - part 2

[Strings, Binaries and Character Lists - part 1](https://github.com/adolfont/introducao-a-programacao-funcional/blob/master/topics/strings_binaries_and_charlists_1.md)

## Binaries

- A sequence of bits
- << term,... >>
- "The simplest term is just a number from 0 to 255" (Thomas, 2018)
- byte_size, bit_syze

```elixir
b = << 1, 2, 3 >>
{byte_size(b), bit_size(b)}
b = << 1::size(2), 1::size(3) >>
{byte_size(b), bit_size(b)}
```

```elixir
int = << 1 >>
float = << 2.5 :: float >>
mix = << int :: binary, float :: binary >>
```

- [IEEE 754:  IEEE Standard for Floating-Point Arithmetic](https://en.wikipedia.org/wiki/IEEE_754)
- "An IEEE 754 float has a sign bit, 11 bits of exponent, and 52 bits of mantissa. The exponent is biased by 1023, and the mantissa is a fraction with the top bit assumed to be 1." (Thomas, 2018)

```elixir
<< sign::size(1), exp::size(11), mantissa::size(52) >> = << 3.14159::float >>
{sign, exp, mantissa}
(1 + mantissa / :math.pow(2, 52)) * :math.pow(2, exp-1023) * (1 - 2*sign)
```

## Double-Quoted Strings Are Binaries

- a consecutive sequence of bytes in UTF-8 encoding

```elixir
formula = "∀x,∃y(p(x,y))"
String.length formula
byte_size formula
String.at(formula, 0)
String.codepoints(formula)
String.split(formula, "(")
String.split(formula, ["(",")"])
```

## Strings and Elixir Libraries

- "When Elixir library documentation uses the word string (and most of the time it uses the word binary), it means double-quoted strings." (Thomas, 2018)
- [String module: double-quoted strings](https://hexdocs.pm/elixir/String.html)

```elixir
String.ends_with? "adolfo", ["olfo", "ad", "elf"]
String.jaro_distance("adolfo", "rodolfo")
String.myers_difference("brasil", "brazil")
```

## Binaries and Pattern Matching

- "The first rule of binaries is “if in doubt, specify the type of each field.”" (Thomas, 2018)

- Types: binary, bits, bitstring, bytes, float, integer, utf8, utf16, utf32.
- Qualifiers:
  - size(n)
  - signed or unsigned
  - endianness
- Hyphens

### String Processing with Binaries

# References

[Programming Elixir 1.6: Functional |> Concurrent |> Pragmatic |> Fun, by Dave Thomas (2018)](http://bit.ly/2rqD9VF)
