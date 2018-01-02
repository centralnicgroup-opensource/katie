defmodule KatieTest do
  use ExUnit.Case
  doctest Katie

  test "greets the world" do
    assert Katie.hello() == :world
  end
end
