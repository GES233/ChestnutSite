defmodule Helpers.WordCounter do
  @moduledoc """
  Provide more customisation for word counts in articles.
  """

  # Reading speed in words per minute
  @read_speed %{
    # Language
    :english => 200,
    :chinese => 150,

    # Code
    :code => 50,  # Read by lines nor words.
  }

  # TODO: use configurer to set
  def get_read_speed(language) do
    @read_speed[language]
  end

  @doc """
  Count words in a paragraph or block.
  """
  def count_words(_text) do
    # TODO: implement
    # count words
    # TODO: implement
    # estimate reading time
  end

  ## Code
  @doc """
  Count code lines in a code block.
  """
  def count_code(_code_block, _lang \\ nil) do
    # 0. Recognize comment, document and code example
    # - code_example => count as code
    # - document and comment => count as normal content
  end

  def pick_code(_comment, _lang \\ nil) do
    # Single comment
    # code_and_comments = String.split(comment, "\n")
    # code = Enum.filter(code_and_comments, fn line -> not String.starts_with?(line, "#") end)
    # TODO: implement
  end

  def count_code_lines(snippet) do
    snippet
    # 1. Seperate by enter
    |> String.split("\n")
    # 2. Remove blank lines
    |> Enum.reject(&String.trim(&1) == "")
    # 3. Count lines
    |> Enum.count()
  end

  # Footnote
  # Content in details
  # Appendix, Bibliography
  # => costumize per article

  # estimate reading time
end
