defmodule HealthChecks.Redis do
  require Logger

  @doc """
  Receives a Redis connection and sends a "PING" to check availablity.
  If it receives "PONG", return `:ok`, otherwise `:error`.
  """
  def check(redis_conn) do
    if Code.ensure_loaded?(Redix) do
      case Redix.command(redis_conn, ~w(PING)) do
        {:ok, _pong} -> :ok
        _ -> :error
      end
    else
      Logger.error("HealthCheck: Redix library not available")
      :error
    end
  end
end
