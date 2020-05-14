defmodule SistemaCompraWeb.DashboardView do
  use SistemaCompraWeb, :view



  def render("relatorio.json", %{relatorio: relatorio}) do
    %{
      relatorio: relatorio
    }
  end

end
