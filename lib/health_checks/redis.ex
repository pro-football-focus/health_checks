if Code.ensure_loaded?(Redix) do

  defmodule HealthChecks.Redis do

    @doc """
    Receives a Redis connection and sends a "PING" to check availablity.
    If it receives "PONG", return `:ok`, otherwise `:error`.
    """
    def check(redis_conn) do
      case Redix.command(redis_conn, ~w(PING)) do
        {:ok, _pong} -> :ok
        _ -> :error
      end
    end
  end

end
