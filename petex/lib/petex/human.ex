defmodule Petex.Human do
    use Ecto.Schema
    import Ecto.Changeset

    @fields [:age, :cpf, :email, :name]

    schema "humans" do
        field :age, :integer
        field :cpf, :string
        field :email, :string
        field :name, :string

        timestamps()
    end

    def changeset(params) do
      %__MODULE__{}
      |> cast(params, @fields) # convierte a tipos de datos requeridos no schema
      |> validate_required(@fields) # todos esse campos são obligatorios
      |> validate_number(:age, greater_than_or_equal_to: 18)
      |> validate_length(:name, min: 2)

    end
end
