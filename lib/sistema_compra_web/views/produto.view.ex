defmodule SistemaCompraWeb.ProdutoView do
  use SistemaCompraWeb, :view
  alias SistemaCompraWeb.ProdutoView


  def render("show.json", %{produto: produto}) do
    %{data: render_one(produto, ProdutoView, "produto.json")}
  end

  def render("produto.json", %{produto: produto}) do
    %{
      id: produto.id,
      categoria: produto.categoria,
      nome: produto.nome
    }
  end
end
