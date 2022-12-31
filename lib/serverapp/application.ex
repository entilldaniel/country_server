defmodule ServerApp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  require Logger

  @impl true
  def start(_type, _args) do
    children = [
      ServerApp.World.Repo,
      {Bandit, scheme: :http, plug: ServerApp.Router, options: [port: 8080]}
    ]

    Logger.info("Starting application...")
    opts = [strategy: :one_for_one, name: ServerApp.Supervisor]
    Supervisor.start_link(children, opts)
  end
end



