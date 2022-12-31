defmodule Serverapp.MixProject do
  use Mix.Project

  def project do
    [
      app: :serverapp,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {ServerApp.Application, []}
    ]
  end

  defp deps do
    [
      {:dialyxir, "~> 1.2.0", only: [:dev], runtime: false},
      {:ecto_sql, "~> 3.2"},
      {:postgrex, "~> 0.15"},
      {:plug, "~> 1.14.0"},
      {:bandit, ">= 0.6.4"},
      {:jason, "~> 1.4"}
    ]
  end
end
