defmodule SistemaCompra.Repo.Migrations.CreateCompras do
  use Ecto.Migration

  def change do
    create table(:compras) do
      add :id_compra, :integer
      add :id_usuario, :integer

      timestamps()
    end

  end
end
