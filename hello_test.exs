ExUnit.start()

defmodule GreetingsTest do
  use ExUnit.Case

  test "greets the world" do
    assert Greetings.hello() == "Hello, world!"
  end
  test "greets people by name" do
    assert Greetings.hello("Clayton") == "Hello, Clayton!"
  end
  test "greets the world by default" do
    assert Greetings.hello("") == "Hello, world!"
  end
end
