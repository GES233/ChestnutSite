defmodule Chestnut.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      Chestnut.Repo,
      {Ecto.Migrator,
        repos: Application.fetch_env!(:chestnut, :ecto_repos),
        skip: skip_migrations?()},
      {DNSCluster, query: Application.get_env(:chestnut, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Chestnut.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Chestnut.Finch}
      # Start a worker by calling: Chestnut.Worker.start_link(arg)
      # {Chestnut.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Chestnut.Supervisor)
  end

  defp skip_migrations?() do
    # By default, sqlite migrations are run when using a release
    System.get_env("RELEASE_NAME") != nil
  end
end
