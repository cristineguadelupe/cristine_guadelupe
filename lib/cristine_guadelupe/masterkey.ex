defmodule CristineGuadelupe.MasterKey do
  defstruct [:status, :rows]
  alias CristineGuadelupe.MasterKey.{Board, Score}

  def new_board() do
    Board.new()
  end

  def new_board(%{answer: answer}) do
    answer
    |> Board.new()
  end
  def new_board(answer) do
    answer
    |> to_numbers()
    |> Board.new()
  end

  def guess(board, guess) do
    Board.guess(board, to_numbers(guess))
  end

  defp to_numbers(guess) do
    guess
    |> String.graphemes()
    |> Enum.map(&String.to_integer/1)
  end

  def to_map(board) do
    __struct__(status: Board.status(board), rows: turns(board))
  end

  defp turns(board) do
    Enum.map(board.guesses, &to_score(&1, board.answer))
  end

  defp to_score(guess, answer) do
    %{guess: guess, score: Score.new(answer, guess)}
  end
end
