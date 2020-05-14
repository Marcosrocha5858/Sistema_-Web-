defmodule SistemaCompra.Repo do
  use Ecto.Repo,
    otp_app: :sistema_compra,
    adapter: Ecto.Adapters.Postgres
end
