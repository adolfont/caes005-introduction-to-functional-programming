

# Atores

- Cada ator é um processo
- Cada ator é um processo.
- Cada processo executa uma tarefa específica.
- Para instruir um processo a fazer algo, você precisa enviar uma mensagem para ele. 
O processo pode responder enviando de volta outra mensagem.
- Os tipos de mensagens nas quais o processo pode atuar são específicos ao próprio processo. 
Em outras palavras, as mensagens passam por casamento de padrões.
- Fora isso, os processos não compartilham nenhuma informação com outros processos.

Fonte:  The Little Elixir & OTP Guidebook  https://www.goodreads.com/book/show/25563811-the-little-elixir-otp-guidebook


# Processos 

- A unidade básica de concorrência em Elixir é o processo.
  - Não são processos nativos do sistema operacional.
- `spawn/1`
- `spawn/3`
- `Process.info/2`
  
~~~elixir
spawn(fn -> IO.puts("Hello, Alpha Centauri!") end)

spawn(IO, :puts, ["Hello, Alpha Centauri!"])

spawn(fn -> IO.puts "Hello, World!" end) |> Process.info(:memory)
~~~
  
# Referências

- Elixir Processes: Spawn, Send, and Receive https://samuelmullen.com/articles/elixir-processes-send-and-receive
