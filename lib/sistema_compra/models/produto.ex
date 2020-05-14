defmodule SistemaCompra.ProdutoModel do
  use Ecto.Schema
  import Ecto.Changeset

  schema "produtos" do
    field :categoria, :string
    field :nome, :string
    field :valor, :integer

    timestamps()
  end

  @doc false
  def changeset(produto, attrs) do
    produto
    |> cast(attrs, [:categoria, :nome, :valor])
    |> validate_required([:categoria, :nome, :valor])
  end
end
