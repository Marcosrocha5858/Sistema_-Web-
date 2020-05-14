defmodule SistemaCompra.CompraModel do
  use Ecto.Schema
  import Ecto.Changeset

  schema "compras" do
    field :id_produto, :integer
    field :id_usuario, :integer

    timestamps()
  end

  @doc false
  def changeset(compra, attrs) do
    compra
    |> cast(attrs, [:id_produto, :id_usuario])
    |> validate_required([:id_produto, :id_usuario])
  end
end
