defmodule SistemaCompra.Repo.Migrations.CreateProdutos do
  use Ecto.Migration

  def change do
    create table(:produtos) do
      add :id_usuario, :integer
      add :idusuario, :integer

      timestamps()
    end

  end
end
