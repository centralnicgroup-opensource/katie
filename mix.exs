defmodule Katie.Mixfile do
  use Mix.Project

  def project() do
    [app: :katie,
     version: "0.1.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application() do
    [mod: {Katie, []},
    applications: [:logger, :kterl]]
  end

  defp deps() do
    [{:kterl, github: "iwantmyname/kterl"}]
  end
end
