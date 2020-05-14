defmodule SistemaCompraWeb.DashboardController do
  use SistemaCompraWeb, :controller
  alias SistemaCompra.Helps

  def total_compra_semana(conn, _params) do
    relatorio = Helps.total_compras_semana()
    render(conn, "relatorio.json", relatorio: relatorio)
  end

  def total_compras_mes(conn, _params) do
    relatorio = Helps.total_compras_mes()
    render(conn, "relatorio.json", relatorio: relatorio)
  end

  def total_compras_mes_cliente(conn, %{"id"=> id}) do
    relatorio = Helps.total_compras_cliente(id)
    render(conn, "relatorio.json", relatorio: relatorio)
  end

  def total_media_compras_cliente(conn, %{"id"=> id}) do
    relatorio = Helps.media_compras_na_semana(id)
    render(conn, "relatorio.json", relatorio: relatorio)
  end

end
