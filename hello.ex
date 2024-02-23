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
    @english_greeting <> name_with_default(name) <> @english_punctuation
  end

  @spec hello(String.t(), String.t()) :: String.t()
  def hello(name, language) do
    language_greeting(language) <> name_with_default(name) <> language_punctuation(language)
  end

  @spec language_greeting(String.t()) :: String.t()
  defp language_greeting(:spanish), do: "¡Hola, "
  defp language_greeting(:english), do: @english_greeting

  @spec language_punctuation(String.t()) :: String.t()
  def language_punctuation(language), do: "!"

  @spec name_with_default(String.t()) :: String.t()
  defp name_with_default(""), do: @english_world
  defp name_with_default(name), do: name

  @spec say_hello :: :ok
  def say_hello do
    IO.puts(hello())
    IO.puts(hello("Y'all", :english))
  end
end
