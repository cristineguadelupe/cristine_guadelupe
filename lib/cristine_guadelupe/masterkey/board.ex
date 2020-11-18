defmodule CristineGuadelupe.MasterKey.Board do
  @max_tries 10
  defstruct [:answer, guesses: []]

  def new do
    __struct__(answer: random_answer())
  end

  def new(answer) do
    __struct__(answer: answer)
  end

  defp random_answer do
    Enum.take_random(1..8, 4)
  end

  def guess(board, guess) do
    %{board | guesses: [guess | board.guesses]}
  end

  def status(%{guesses: [last_guess | _guesses], answer: last_guess}), do: :won
  def status(%{guesses: guesses}) when length(guesses) == @max_tries, do: :lost
  def status(_board), do: :playing
end
