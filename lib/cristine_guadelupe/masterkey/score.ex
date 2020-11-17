defmodule CristineGuadelupe.MasterKey.Score do
  defstruct [reds: [], whites: []]
  def new(answer, guess) do
    __struct__(reds: reds(answer, guess), whites: whites(answer, guess))
  end

  defp reds(answer, guess) do
    answer
    |> Enum.zip(guess)
    |> Enum.count(&(elem(&1, 0) == elem(&1, 1)))
  end

  def misses(answer, guess) do
    answer
    |> Kernel.--(guess)
    |> length()
  end

  def slots(guess), do: length(guess)

  defp whites(answer, guess) do
    slots(guess)
    |> Kernel.-(reds(answer, guess))
    |> Kernel.-(misses(answer, guess))
  end
end
