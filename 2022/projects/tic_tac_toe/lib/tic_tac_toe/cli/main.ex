defmodule TicTacToe.CLI.Main do
  alias Mix.Shell.IO, as: Shell

  def start_game do
    Shell.info("== Tic-tac-toe Game ==")
    type = ask_type_of_game()
    Shell.info("The first move is yours!")
    play_game(type)
  end

  defp ask_type_of_game() do
    answer =
      Shell.prompt("Do you want a random game? (yes/no)?")
      |> String.trim()

    if answer == "yes" do
      Shell.info("OK, random game chosen!")
      true
    else
      Shell.info("OK, my moves will be predictable!")
      false
    end
  end

  def play_game(pseudo_random) do
    if pseudo_random do
      :rand.seed(:exsss)
    else
      :rand.seed(:exsss, {100, 101, 102})
    end

    keep_playing(TicTacToe.new_board())
  end

  def parse_choice(string) do
    string
    |> String.split()
    |> Enum.map(&String.to_integer/1)
  end

  defp keep_playing(board) do
    show_board(board)

    choice =
      Shell.prompt(
        "Type line and column of your move\n(two numbers, line and column, between 1 and 3 separated by a blank space, or -1 to quit): "
      )
      |> String.trim()

    # Shell.info("Your choice was \"#{choice}\"!")

    case parse_choice(choice) do
      [-1] ->
        Shell.info("Bye bye! See you next time!")

      [line, column] when line in 1..3 and column in 1..3 ->
        Shell.info("You chose line=#{line}, column=#{column}!")
        apply_move(board, line, column)

      _ ->
        Shell.info("Wrong input! Your input should be two numbers between 1 and 3!")
        keep_playing(board)
    end
  end

  defp show_board([p11, p12, p13, p21, p22, p23, p31, p32, p33]) do
    Shell.info("Current board")
    Shell.info("#{p11} #{p12} #{p13}")
    Shell.info("#{p21} #{p22} #{p23}")
    Shell.info("#{p31} #{p32} #{p33}")
    Shell.info("")
  end

  defp apply_move(board, line, column) do
    if TicTacToe.allowed_play?(board, line, column) do
      board_after_the_human_played = TicTacToe.play(board, 1, line, column)

      if winner?(board_after_the_human_played) do
        show_board(board_after_the_human_played)
        Shell.info("Congrats! You won!")
        start_game()
      else
        board_after_the_computer_played = computer_plays(board_after_the_human_played)

        if winner?(board_after_the_computer_played) do
          show_board(board_after_the_computer_played)
          Shell.info("Sorry, the computer won!")
          start_game()
        else
          keep_playing(board_after_the_computer_played)
        end
      end
    else
      Shell.info("Wrong input! The position you chose is not empty!")
      keep_playing(board)
    end
  end

  defp winner?(board) do
    {_, result} = TicTacToe.finished?(board)
    result
  end

  def computer_plays(board) do
    {_, chosen_position} =
      Enum.with_index(board)
      |> Enum.filter(fn {symbol, _position} -> symbol == "_" end)
      |> Enum.random()

    List.replace_at(board, chosen_position, TicTacToe.player_symbol(2))
  end
end
