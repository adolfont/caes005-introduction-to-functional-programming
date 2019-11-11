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

```elixir
<< sign::size(1), exp::size(11), mantissa::size(52) >> = << 3.14159::float >>
(1 + mantissa / :math.pow(2, 52)) * :math.pow(2, exp-1023) * (1 - 2*sign)
```

# References

[Programming Elixir 1.6: Functional |> Concurrent |> Pragmatic |> Fun, by Dave Thomas (2018)](http://bit.ly/2rqD9VF)
