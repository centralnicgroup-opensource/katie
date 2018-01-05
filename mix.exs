defmodule Katie.Mixfile do
  use Mix.Project

  def project do
    [
      app: :katie,
      version: "0.1.0",
      elixir: "~> 1.5",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  def application() do
    [
      extra_applications: [:logger],
      mod: {Katie.Application, []}
    ]
  end

  defp aliases do
    [dep: ["deps.get --only #{Mix.env}", "deps.compile"],
     rel: ["compile", "release --env=prod"]]
  end

  defp deps() do
    [{:kterl, github: "iwantmyname/kterl"},
     {:credo, "~> 0.8", only: [:dev, :test]},
     {:dialyxir, "~> 0.5", only: [:dev], runtime: false},
     {:distillery, "~> 1.5", runtime: false}]
  end
end
