defmodule Katie do
  @moduledoc """
  Katie is an OTP App & API for [kterl](http://iwantmyname.github.io/kterl)
  providing a functional interface to a named registered instance of `kterl`
  which in turn provides a reliable connection to [Kyoto Tycoon], a RESTish
  key-value store with time-based expiration and dual-peer synchronisation
  capabilities.
  """

  @doc """
  Spins up a singleton GenServer instance of :kterl under the appropriate
  supervisor, and when a successful connection has been made, registers
  the name `Katie` with the returned pid.

  ## Examples

  iex> Katie.start("1.2.3.4", 1978, 500)
  {:ok, Katie}

  """
  def get_config_from_env() do
    host = Application.get_env(:katie, :host, 'localhost')
    port = Application.get_env(:katie, :port, 1978)
    delay = Application.get_env(:katie, :backoff, 500)
    [host: host, port: port, reconnect_sleep: delay]
  end

  def start() do
    [host: host, port: port, reconnect_sleep: delay] = get_config_from_env()
    start(host, port, delay)
  end

  def start(host, port \\ 1978, delay \\ 500) when is_list(host) do
    case worker_pid = Process.whereis(:katie) do
      _ when is_pid(worker_pid) ->
        {:ok, worker_pid}

      _ ->
        {:ok, worker_pid} = :kterl.connect(host, port, delay)
        true = Process.register(worker_pid, :katie)
    end

    {:ok, :katie}
  end
end
