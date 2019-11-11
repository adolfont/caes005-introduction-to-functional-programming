# Strings and Binaries

## String Literals

- Single-quoted and double-quoted
- [UTF-8](https://en.wikipedia.org/wiki/UTF-8)
- Escape sequences
- #{...} syntax

### Exercise

On iex:

```elixir
  IO.puts "\u00A9"
  name = "Adolfo"
  "Hello, #{String.capitalize name}\u2757"
```

## Heredocs

- """
- "Heredocs are used extensively to add documentation to functions and modules."  (Thomas, 2018)

## Sigils

- Tilde
- Upper- or lowercase letter
- Delimited dontent ( <...> , {...} , [...] , (...) , |...| , /.../ , "..." , and '...')
- optional options

```elixir
~C[1\n2#{1+2}]
~W[the c#{'a'}t sat on the mat]
~N{1999-12-31 23:59:59}
~w[the c#{'a'}t sat on the mat]s
```





# References

[Programming Elixir 1.6: Functional |> Concurrent |> Pragmatic |> Fun, by Dave Thomas (2018)](http://bit.ly/2rqD9VF)
