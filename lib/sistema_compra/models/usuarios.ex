defmodule SistemaCompra.UsuarioModel do
  use Ecto.Schema
  import Ecto.Changeset

  schema "usuarios" do
    field :email, :string
    field :nome, :string

    timestamps()
  end

  @doc false
  def changeset(usuario, attrs) do
    usuario
    |> cast(attrs, [:nome, :email])
    |> validate_required([:nome, :email])
  end





end
