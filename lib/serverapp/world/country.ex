defmodule ServerApp.World.Country do
  use Ecto.Schema

  @derive {Jason.Encoder, only: [:name, :continent, :local_name, :population]}
  @primary_key {:code, :string, []}
  schema "country" do
    field(:name, :string)
    field(:continent, :string)
    field(:region, :string)
    field(:surface_area, :decimal)
    field(:population, :integer)
    field(:life_expectancy, :decimal)
    field(:gnp, :decimal)
    field(:local_name, :string)
    field(:government_form, :string)
    field(:head_of_state, :string)
    field(:capital, :integer)
  end
end
