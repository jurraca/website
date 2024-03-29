defmodule Website.MixProject do
  use Mix.Project

  def project do
    [
      app: :website,
      version: "0.1.0",
      elixir: "~> 1.12",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Website.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
      [
        {:phoenix, "~> 1.6.2"},
        {:phoenix_html, "~> 3.0"},
        {:phoenix_live_reload, "~> 1.2", only: :dev},
        {:phoenix_live_view, "~> 0.16.0"},
        {:floki, ">= 0.30.0", only: :test},
        {:phoenix_live_dashboard, "~> 0.5"},
        {:esbuild, "~> 0.2", runtime: Mix.env() == :dev},
        {:swoosh, "~> 1.3"},
        {:hackney, "~> 1.9"},
        {:telemetry_metrics, "~> 0.6"},
        {:telemetry_poller, "~> 1.0"},
        {:gettext, "~> 0.18"},
        {:jason, "~> 1.2"},
        {:plug_cowboy, "~> 2.5"},
        {:earmark, "~> 1.4.0"},
        {:yamerl, "~> 0.8.1"},
        {:tailwind, "~> 0.1", runtime: Mix.env() == :dev}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.create --quiet", "ecto.migrate", "test"],
      "assets.deploy": ["esbuild default --minify", "tailwind default --minify", "phx.digest"]
    ]
  end
end
