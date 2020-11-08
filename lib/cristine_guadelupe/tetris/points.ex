defmodule CristineGuadelupe.Tetris.Points do
  alias CristineGuadelupe.Tetris.Point

  def move(points, change) do
    points
    |> Enum.map(&Point.move(&1, change))
  end

  def add_shape(points, shape) do
    points
    |> Enum.map(&Point.add_shape(&1, shape))
  end

  def rotate(points, degrees) do
    points
    |> Enum.map(&Point.rotate(&1, degrees))
  end

  def valid?(points, junkyard) do
    Enum.all?(points, &Point.valid?(&1, junkyard))
  end

end
