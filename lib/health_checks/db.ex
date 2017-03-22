if Code.ensure_loaded?(Ecto) do

  defmodule HealthChecks.DB do

    @doc """
    Receives a Repo and sends a generic SELECT statement to check availability.
    Returns `:ok` on success, otherwise `:error`.
    """
    def check(repo) do
      try do
        Ecto.Adapters.SQL.query(repo, "select 1", [])
        :ok
      catch
        :exit, _ -> :error
      end
    end
  end

end
