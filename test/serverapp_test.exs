defmodule ServerappTest do
  use ExUnit.Case
  doctest Serverapp

  test "greets the world" do
    assert Serverapp.hello() == :world
  end
end
