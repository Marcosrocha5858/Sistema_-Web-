defmodule SistemaCompraWeb.UsuarioController do
  use SistemaCompraWeb, :controller

  alias SistemaCompra.Helps

  def create(conn, %{"usuario" => params_usuario}) do

    with {:ok , usuario} <- Helps.create(params_usuario)  do
      conn
      |> put_status(:created)
      |> put_resp_content_type("application/json")
      |> render("show.json", usuario: usuario)

    end
  end

end
