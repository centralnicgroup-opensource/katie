defmodule Katie.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      %{id: :kterl,
      start: {:kterl, :start_link, [[host: '10.241.0.0']]}}
    ]
    opts = [strategy: :one_for_one, name: Katie.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
