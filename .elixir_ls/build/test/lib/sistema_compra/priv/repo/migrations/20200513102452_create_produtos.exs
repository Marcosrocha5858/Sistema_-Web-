defmodule SistemaCompra.Repo.Migrations.CreateProdutos do
  use Ecto.Migration

  def change do
    create table(:produtos) do
      add :id_compra, :integer
      add :id_usuario, :integer

      timestamps()
    end

  end
end
