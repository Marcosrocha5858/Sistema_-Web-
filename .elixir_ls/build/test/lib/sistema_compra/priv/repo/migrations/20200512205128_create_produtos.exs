defmodule SistemaCompra.Repo.Migrations.CreateProdutos do
  use Ecto.Migration

  def change do
    create table(:produtos) do
      add :categoria, :string
      add :nome, :string
      add :valor, :integer

      timestamps()
    end

  end
end
