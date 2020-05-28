defmodule Mjmleex.MixProject do
  use Mix.Project

  def project do
    [
      app: :mjmleex,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps(),

      # Docs
      name: "Mjmleex",
      docs: docs(),

      # Hex
      description: description(),
      package: package()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:elixir_uuid, "~> 1.2"}
    ]
  end

  defp docs do
    [
      main: "Mjmleex",
      extras: ["README.md"],
      source_url: "https://github.com/Elonsoft/mjmleex"
    ]
  end

  defp description do
    "Renders EEx to MJML and MJML to HTML (eex -> mjml -> html)"
  end

  defp package do
    [
      links: %{"GitHub" => "https://github.com/Elonsoft/mjmleex"},
      licenses: ["MIT"],
      files: ~w(.formatter.exs mix.exs README.md LICENSE.md lib)
    ]
  end
end
