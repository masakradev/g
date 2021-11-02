defmodule G.Settings do
  alias ExJsonSchema.Validator
  alias G.Utils.Json

  def get(schema_path, settings_path) do
    schema_path
    |> load_json_schema()
    |> load_settings(settings_path)
  end

  defp load_settings({:error, error} = _schema, _), do: {:error, error}

  defp load_settings({:ok, schema} = _schema, path) do
    path
    |> Json.load_json()
    |> case do
      {:ok, settings} ->
        schema
        |> ExJsonSchema.Schema.resolve()
        |> Validator.validate(settings)
        |> case do
          :ok -> {:ok, settings}
          {:error, [{error, path}]} -> {:error, error <> " " <> path}
        end

      {:error, error} ->
        {:error, error}
    end
  end

  defp load_json_schema(path) do
    path
    |> Json.load_json()
    |> case do
      {:ok, json} -> {:ok, json}
      {:error, error} -> {:error, error}
    end
  end
end
