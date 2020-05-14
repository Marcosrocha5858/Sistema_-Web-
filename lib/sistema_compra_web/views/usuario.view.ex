defmodule SistemaCompraWeb.UsuarioView do
  use SistemaCompraWeb, :view
  alias SistemaCompraWeb.UsuarioView


  def render("show.json", %{usuario: usuario}) do
    %{data: render_one(usuario, UsuarioView, "usuario.json")}
  end

  def render("usuario.json", %{usuario: usuario}) do
    %{id: usuario.id,
      nome: usuario.nome,
      email: usuario.email}
  end
end
