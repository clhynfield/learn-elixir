defmodule Greetings do
  @english_greeting "Hello, "
  @english_world "world"
  @english_punctuation "!"

  @spec hello :: String.t()
  def hello do
    @english_greeting <> @english_world <> @english_punctuation
  end

  @spec hello(String.t()) :: String.t()
  def hello(name) do
    @english_greeting <> name <> @english_punctuation
  end

  @spec say_hello :: :ok
  def say_hello do
    IO.puts(hello())
  end
end
