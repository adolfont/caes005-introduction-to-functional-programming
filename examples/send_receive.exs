# Copie e cole o texto abaixo no iex - vai mostrar duas mensagens
send self(), {:hello, "world"}
send self(), {:world, "world"}


receive do
  {:hello, msg} -> msg
  {:world, _msg} -> "won't match"
end

receive do
  {:hello, msg} -> msg
  {:world, _msg} -> "won't match"
end

# Faça novamente - Vai travar o terminal
send self(), {:ola, "world"}
receive do
  {:hello, msg} -> msg
  {:world, _msg} -> "won't match"
end
