defmodule SistemaCompraWeb.CompraController do
  use SistemaCompraWeb, :controller

  alias SistemaCompra.Helps

  def create(conn, %{"id_usuario" => id_usuario, "id_produto" => id_produto}) do
    with {:ok , compra} <- Helps.create_compra(id_usuario, id_produto) do
      conn
      |> put_status(:created)
      |> put_resp_content_type("application/json")
      |> render("show.json", compra: compra)

    end
  end



end
