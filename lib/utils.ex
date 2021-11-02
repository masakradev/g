defmodule G.Utils do
  defmodule Json do
    def load_json(path) do
      with {:ok, body} <- File.read(path),
           {:ok, json} <- Poison.decode(body) do
        {:ok, json}
      else
        {:error, :enoent} -> {:error, "File didn't exist"}
        {:error, _} -> {:error, "Invalid json file"}
      end
    end
  end
end
