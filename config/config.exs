# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :website,
  ecto_repos: [Website.Repo]

config :esbuild,
version: "0.12.18",
default: [
  args:
    ~w(js/app.js --bundle --target=es2016 --outdir=../priv/static/assets),
  cd: Path.expand("../assets", __DIR__),
  env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
]

config :tailwind,
  version: "3.0.7",
  default: [
    args: ~w(
      --config=tailwind.config.js
      --input=css/app.css
      --output=../priv/static/assets/app.css
    ),
    cd: Path.expand("../assets", __DIR__)
  ]

# Configures the endpoint
config :website, WebsiteWeb.Endpoint,
  url: [host: "julienurraca.com"],
  secret_key_base: System.get_env("SECRET_KEY_BASE"),
  render_errors: [view: WebsiteWeb.ErrorView, accepts: ~w(html json)],
  pubsub_server: Website.PubSub

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :logger, level: :info
# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
