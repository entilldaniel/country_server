defmodule ServerApp.World.City do
  use Ecto.Schema

  schema "city" do
    field(:name, :string)
    field(:country_code, :string)
    field(:district, :string)
    field(:population, :integer)
  end
end
