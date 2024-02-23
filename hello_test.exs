ExUnit.start()

defmodule GreetingsTest do
  use ExUnit.Case

  test "greets the world" do
    assert Greetings.hello() == "Hello, world!"
  end
  test "greets people" do
    assert Greetings.hello("Clayton") == "Hello, Clayton!"
  end
end
