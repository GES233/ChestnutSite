defmodule ChestnutArticle.Tags do
  defmodule Tag do
    @type t :: %__MODULE__{
          id: atom(),
          name: String.t()
        }
    defstruct [:id, :name]
  end
end
