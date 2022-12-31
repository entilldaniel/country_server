defmodule ServerApp.World.Repo do
  use Ecto.Repo,
    otp_app: :serverapp,
    adapter: Ecto.Adapters.Postgres
end
