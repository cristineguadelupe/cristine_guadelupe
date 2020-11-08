# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :cristine_guadelupe,
  ecto_repos: [CristineGuadelupe.Repo]

# Configures the endpoint
config :cristine_guadelupe, CristineGuadelupeWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "dlFEMm4vKXKSLR89EKpGfLe6J7+U+jkWvIx0H6UQl+GF2fAHGQWHttOQU39a3vAN",
  render_errors: [view: CristineGuadelupeWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: CristineGuadelupe.PubSub,
  live_view: [signing_salt: "EwTBHp7n"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
