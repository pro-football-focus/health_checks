defmodule HealthChecks.DB do
  require Logger

  @doc """
  Receives a Repo and sends a generic SELECT statement to check availability.
  Returns `:ok` on success, otherwise `:error`.
  """
  def check(repo) do
    if Code.ensure_loaded?(Ecto) do
      try do
        Ecto.Adapters.SQL.query(repo, "select 1", [], log: false)
        :ok
      catch
        :exit, _ -> :error
      end
    else
      Logger.error("HealthCheck: Ecto library not available")
      :error
    end
  end
end
