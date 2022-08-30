defmodule Petex.Pet do
  use Ecto.Schema
  import Ecto.Changeset

  alias Petex.Human

  @fields [:age, :kind, :name, :human_id]

  schema "pets" do
      field :age, :integer
      field :kind, :string
      field :name, :string

      belongs_to :human, Human

      timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @fields) # convierte a tipos de datos requeridos no schema
    |> validate_required(@fields) # todos esse campos são obligatorios
    |> validate_number(:age, greater_than_or_equal_to: 1)
    |> validate_length(:name, min: 2)

  end
end
