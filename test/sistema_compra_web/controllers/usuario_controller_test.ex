defmodule SistemaCompraWeb.UsuarioControllerTest do
  use SistemaCompraWeb.ConnCase

  test "Teste insert" do
    params_usuario = %{"nome" => "Marcos", "email" => "marcosrocha@gmail"}

    params_produto = %{"categoria" => "calcados", "nome" => "tenis", "valor" => "22"}

    usuario =
      build_conn()
      |> post("api/usuario", %{"usuario" => params_usuario})
      |> json_response(201)
      |> Map.get("data")

    {:ok, %{usuario: usuario}}

    produto =
      build_conn()
      |> post("api/produto", %{"produto" => params_produto})
      |> json_response(201)
      |> Map.get("data")

    {:ok, %{produto: produto}}
    compra =
      build_conn()
      |> post("api/compra/#{usuario["id"]}/#{produto["id"]}")
      |> json_response(201)
      |> Map.get("data")
    {:ok, %{compra: compra}}
  end

  test "Relatorio de compra  da semana" do
      relatorio =
        build_conn()
        |> get("api/dashboard/total_compra_semana")
        |> json_response(200)
        |> Map.get("relatorio")
        |>IO.inspect
        {:ok, %{relatorio: relatorio}}

  end

  test "Relatorio de compra no mes" do
    relatorio =
      build_conn()
      |> get("api/dashboard/total_compras_mes")
      |> json_response(200)
      |> Map.get("relatorio")
      |> IO.inspect
      {:ok, %{relatorio: relatorio}}
  end

  test "Rela de compra na semana Cliente" do
    relatorio =
      build_conn()
      |> get("api/dashboard/total_media_compras_cliente/1")
      |> json_response(200)
      |> Map.get("relatorio")
      |> IO.inspect
      {:ok, %{relatorio: relatorio}}
  end


  test "Relatorio de compra no mês Cliente" do
    relatorio =
      build_conn()
      |> get("api/dashboard/total_compras_mes_cliente/1")
      |> json_response(200)
      |> Map.get("relatorio")
      |> IO.inspect
      {:ok, %{relatorio: relatorio}}
  end




end
