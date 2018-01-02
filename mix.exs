defmodule Katie.Mixfile do
  use Mix.Project

  def project() do
    [app: :katie,
     version: "0.1.0",
     elixir: "~> 1.5",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application() do
    [mod: {Katie.Application, []},
     extra_applications: [:logger]]
  end

  defp deps() do
    [{:kterl, github: "iwantmyname/kterl"},
     {:credo, "~> 0.8", only: [:dev, :test]},
     {:distillery, "~> 1.5", runtime: false}]
  end
end
