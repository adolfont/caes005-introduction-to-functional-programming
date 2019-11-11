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


# References

[Programming Elixir 1.6: Functional |> Concurrent |> Pragmatic |> Fun, by Dave Thomas (2018)](http://bit.ly/2rqD9VF)
