defmodule SistemaCompraWeb.CompraView do
  use SistemaCompraWeb, :view
  alias SistemaCompraWeb.CompraView


  def render("show.json", %{compra: compra}) do
    %{data: render_one(compra, CompraView, "compra.json")}
  end

  def render("compra.json", %{compra: compra}) do
    %{
      id: compra.id,
      id_usuario: compra.id_usuario,
      id_produto: compra.id_produto
    }
  end

  def render("relatorio.json", %{relatorio: relatorio}) do
    %{
      id: relatorio.relatorio
    }
  end
end
