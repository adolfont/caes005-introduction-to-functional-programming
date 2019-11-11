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

- Run this with elixir https://gist.github.com/adolfont/f803d6014136bb94bf0daa8c5c2c9a47

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

- You can use heredocs
- You can define your own sigils

## Strings vs. character lists

- "In Elixir, the convention is that we call only double-quoted strings “strings.” The single-quoted form is a character list." (Thomas, 2018)

### Single-Quoted Strings—Lists of Character Codes

- "IEx says it is a list, but it shows the value as a string" (Thomas, 2018)

```elixir
[ 67, 65, 84 ]
```

- "Because a character list is a list, we can use the usual pattern matching and List functions" (Thomas, 2018). See [parse.exs](http://media.pragprog.com/titles/elixir16/code/strings/parse.exs)

# References

[Programming Elixir 1.6: Functional |> Concurrent |> Pragmatic |> Fun, by Dave Thomas (2018)](http://bit.ly/2rqD9VF)
