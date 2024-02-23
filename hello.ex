defmodule Greetings do
  @english_greeting "Hello, "
  @english_world "world"
  @english_punctuation "!"
  @spanish_greeting "¡Hola, "
  @french_greeting "Bonjour, "

  @spec hello :: String.t()
  def hello do
    hello(name_with_default(""))
  end

  @spec hello(String.t()) :: String.t()
  def hello(name) do
    hello(name, :english)
  end

  @spec hello(String.t(), String.t()) :: String.t()
  def hello(name, language) do
    greeting(language) <> name_with_default(name) <> punctuation(language)
  end

  @spec greeting(String.t()) :: String.t()
  defp greeting(language) do
    case language do
      :spanish -> @spanish_greeting
      :french -> @french_greeting
      _ -> @english_greeting
    end
  end

  @spec punctuation(String.t()) :: String.t()
  defp punctuation(_language), do: @english_punctuation

  @spec name_with_default(String.t()) :: String.t()
  defp name_with_default(""), do: @english_world
  defp name_with_default(name), do: name

  @spec say_hello :: :ok
  def say_hello do
    IO.puts(hello())
    IO.puts(hello("Y'all", :english))
  end
end
