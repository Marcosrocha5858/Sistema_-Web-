defmodule SistemaCompra.Repo.Migrations.CreateUsuarios do
  use Ecto.Migration

  def change do
    create table(:usuarios) do
      add :nome, :string
      add :email, :string

      timestamps()
    end

  end
end
