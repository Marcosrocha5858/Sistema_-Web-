defmodule SistemaCompra.Repo.Migrations.CreateCompras do
  use Ecto.Migration

  def change do
    create table(:compras) do
      add :id_compra, :integer
      add :id_usuario, :integer
      add :id_valor, :integer

      timestamps()
    end

  end
end
