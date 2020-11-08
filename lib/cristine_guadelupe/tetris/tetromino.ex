defmodule CristineGuadelupe.Tetris.Tetromino do
  alias CristineGuadelupe.Tetris.{Point, Points}

  defstruct shape: :i, rotation: 0, location: {3, -4}

  def new(options \\ []) do
    __struct__(options)
  end

  def new_random() do
    __struct__(shape: random_shape())
  end

  def right(tetro) do
    %{tetro | location: Point.right(tetro.location)}
  end
  def left(tetro) do
    %{tetro | location: Point.left(tetro.location)}
  end
  def down(tetro) do
    %{tetro | location: Point.down(tetro.location)}
  end

  def rotate(tetro) do
    %{tetro | rotation: rotate_degrees(tetro.rotation)}
  end

  def show(tetro) do
    tetro
    |> to_points()
    |> Points.rotate(tetro.rotation)
    |> Points.move(tetro.location)
    |> Points.add_shape(tetro.shape)
  end

  def to_points(%{shape: :l}) do
    [{2, 1}, {2, 2}, {2, 3}, {3, 3}]
  end
  def to_points(%{shape: :i}) do
    [{2, 1}, {2, 2}, {2, 3}, {2, 4}]
  end
  def to_points(%{shape: :t}) do
    [{1, 2}, {2, 2}, {3, 2}, {2, 3}]
  end
  def to_points(%{shape: :z}) do
    [{1, 1}, {2, 1}, {2, 2}, {3, 2}]
  end
  def to_points(%{shape: :s}) do
    [{1, 2}, {2, 1}, {2, 2}, {3, 1}]
  end
  def to_points(%{shape: :o}) do
    [{2, 2}, {3, 2}, {2, 3}, {3, 3}]
  end
  def to_points(%{shape: :j}) do
    [{1, 3}, {2, 1}, {2, 2}, {2, 3}]
  end

  def rotate_degrees(270), do: 0
  def rotate_degrees(rotation), do: rotation + 90

  defp random_shape do
    ~w[l i t z s o j]a
    |> Enum.random()
  end

 def maybe_move(_old, new, true), do: new
 def maybe_move(old, _new, false), do: old

end
