defmodule CristineGuadelupeWeb.MasterKey.GuessFormData do
  alias Ecto.Changeset

  @types %{guess: :string}

  def changeset(params) do
    {%{}, @types}
    |> Changeset.cast(params, Map.keys(@types))
    |> Changeset.validate_required([:guess])
    |> Changeset.validate_length(:guess, min: 4, max: 4)
    |> Changeset.validate_format(:guess, ~r/^[1-8]{4}$/, message: "Guesses must be four numbers from 1-8" )
    |> Map.put(:action, :validate)
  end
end
