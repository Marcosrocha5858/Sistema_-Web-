defmodule SistemaCompraWeb.ProdutoController do
  use SistemaCompraWeb, :controller

  alias SistemaCompra.Helps

  def create(conn, %{"produto" => produto_params}) do
      IO.inspect(produto_params)
    with {:ok , produto} <- Helps.create_produto(produto_params)  do
      conn
      |> put_status(:created)
      |> put_resp_content_type("application/json")
      |> render("show.json", produto: produto)

    end
  end

end
