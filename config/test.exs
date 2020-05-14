use Mix.Config

# Configure your database
config :sistema_compra, SistemaCompra.Repo,
  username: "postgres",
  password: "postgres",
  database: "sistema_compra_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :sistema_compra, SistemaCompraWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
