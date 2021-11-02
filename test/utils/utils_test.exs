defmodule G.UtilsTest do
  alias G.Utils
  use ExUnit.Case

  doctest G.Utils

  test "load json file/1" do
    assert {:ok, _} = Utils.Json.load_json("test/utils/valid_json.json")
  end

  test "load invalid json file" do
    assert {:error, _} = Utils.Json.load_json("test/utils/invalid_json.json")
  end
end
