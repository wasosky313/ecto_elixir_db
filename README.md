# ecto_elixir_db

# Install phoenix
mix archive.install hex phx_new

# create new project without html
mix phx.new petex --no-html --no-assets

# Config of db
config/dev.exs

# Gerar o bando de dados
mix ecto.setup

# Criar migration
mix ecto.gen.migration name_migration

# Arquivo exemplo migration
defmodule Petex.Repo.Migrations.CreateHumans do
  use Ecto.Migration

  def change do
    create table(:humans) do
      add :age, :integer
      add :cpf, :string
      add :email, :string
      add :name, :string

      timestamps()
    end

    create unique_index(:humans, [:cpf])
    create unique_index(:humans, [:email])
  end
end

# Executar migration
mix ecto.migrate

# Inserir no banco
Repo.insert(changeset)

# trazer tudo
Repo.all(Project.Modulo)


