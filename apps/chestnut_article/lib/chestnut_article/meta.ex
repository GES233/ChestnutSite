defmodule ChestnutArticle.Meta do
  @type t :: %__MODULE__{
    id: String.t(),
    title: String.t(),
    create_at: DateTime.t(),
    update_at: DateTime.t(),
    tags: list(String.t()),
    extra: map()
  }
  defstruct [:id, :title, :create_at, :update_at, :tags, :extra]

  def validid?(id) do
    Regex.match?(~r/^[a-zA-Z0-9-]+$/, id)
  end
end
