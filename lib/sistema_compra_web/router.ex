defmodule SistemaCompraWeb.Router do
  use SistemaCompraWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", SistemaCompraWeb do

  #____________Usuario_________
  post "/usuario", UsuarioController, :create
  #___________Produto___________
  post "/produto", ProdutoController, :create
  #___________Compra_____________
  post "/compra/:id_usuario/:id_produto", CompraController, :create

  #___________dashboard____________
  get "/dashboard/total_compra_dia", DashboardController, :total_compra_dia
  get "/dashboard/total_compra_semana", DashboardController, :total_compra_semana
  get "/dashboard/total_compras_mes", DashboardController, :total_compras_mes
  get "/dashboard/total_compras_mes_cliente/:id", DashboardController, :total_compras_mes_cliente
  get "/dashboard/total_media_compras_cliente/:id", DashboardController, :total_media_compras_cliente

  end
end
