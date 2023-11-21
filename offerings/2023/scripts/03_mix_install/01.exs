# https://tmr08c.github.io/2021/05/using-mix-install/
Mix.install([:jason])


IO.puts(Jason.encode!(%{hello: :world}))
