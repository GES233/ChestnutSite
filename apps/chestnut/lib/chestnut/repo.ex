defmodule Chestnut.Repo do
  use Ecto.Repo,
    otp_app: :chestnut,
    adapter: Ecto.Adapters.SQLite3
end
