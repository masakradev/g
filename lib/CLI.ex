defmodule G.CLI do
  alias G.Settings

  @json_schema_path "lib/settings/settings_schema.json"
  @json_settings_path "settings.json"

  def main(_) do
    settings = Settings.get(@json_schema_path, @json_settings_path)

    IO.inspect(settings)
  end
end
