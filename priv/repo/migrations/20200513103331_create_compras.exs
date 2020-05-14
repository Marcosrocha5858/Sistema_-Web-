defmodule SistemaCompra.Repo.Migrations.CreateCompras do
  use Ecto.Migration

  def change do
    create table(:compras) do
      add :id_produto, :integer
      add :id_usuario, :integer

      timestamps()
    end

  end
end
