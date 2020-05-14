# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :sistema_compra,
  ecto_repos: [SistemaCompra.Repo]

# Configures the endpoint
config :sistema_compra, SistemaCompraWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "0mUmelOiGKtcRBjYqQP8KhbiFfoMzFwfutV9O8e8D8LF77K3Pa0y0gdVI+U6ScwK",
  render_errors: [view: SistemaCompraWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: SistemaCompra.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "3i8N/JLX"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
