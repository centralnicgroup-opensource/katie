defmodule Katie.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    IO.puts("Starting Katie.Application")

    # List all child processes to be supervised
    children = [
      # Starts a worker by calling: Katie.Worker.start_link(arg)
      # {Katie.Worker, arg},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Katie.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
