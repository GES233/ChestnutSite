defmodule ChestnutArticle.Meta do
  @type t :: %__MODULE__{
          id: String.t(),
          title: String.t(),
          status: ChestnutArticle.Meta.Status.status(),
          create_at: DateTime.t(),
          update_at: DateTime.t(),
          tags: list(String.t()) | [],
          category: %{number() => list(String.t())} | %{},
          series: String.t() | nil,
          extra: map()
        }
  defstruct [:id, :title, :status, :create_at, :update_at, :tags, :category, :series, :extra]

  def validid?(id) do
    Regex.match?(~r/^[a-zA-Z0-9-]+$/, id)
  end
end

defmodule ChestnutArticle.Meta.Status do
  @moduledoc false

  @type status :: :draft | :publish | :trash | :secret
  @status [:draft, :publish, :trash, :secret]

  def valid?(status), do: status in @status

  def default() do
    # in config/chestnut.exs
    # Application.get_env(:site, :article)[:default_status] || :draft
    :draft
  end
end
