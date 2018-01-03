defmodule Katie do
  use Application
  @moduledoc """
  Katie is an OTP App &  API for [kterl](http://iwantmyname.github.io/kterl)
  providing a functional interface to a named registered instance of `kterl`
  which in turn provides a reliable connection to [Kyoto Tycoon], a RESTish
  key-value store with time-based expiration and dual-peer synchronisation
  capabilities.
  """

  @doc """
  Katie.start

  Spins up a singleton GenServer instance of :kterl, and when a successful
  connection has been made, registers `Katie` with the returned pid.

  ## Examples

      iex> Katie.start
      :ok

  """
  def start(_type, _args)  do
    host = Application.get_env(:katie, :host, '127.0.0.1')
    port = Application.get_env(:katie , :port, 1978)
    # reconnect = Application.get_env(__MODULE__, :reconnect, 5000)
    IO.puts("starting Katie with #{host}:#{port}")
    # {:ok, pid} = :kterl.start_link()
    # true = Process.register pid, __MODULE__
    # {:ok, pid}
    {:ok, self()}
  end
end
