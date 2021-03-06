defmodule ExPostmark.Mixfile do
  use Mix.Project

  def project do
    [
      app:             :ex_postmark,
      version:         "1.3.0",
      elixir:          "~> 1.4",
      build_embedded:  Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      description:     description(),
      package:         package(),
      deps:            deps(),
      elixirc_paths:   elixirc_paths(Mix.env),
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:poison, "~> 3.1"},
      {:hackney, "~> 1.6"},
      {:ex_doc, ">= 0.0.0", runtime: false},
    ]
  end

  defp description do
    """
    Postmark email adapter for Elixir
    """
  end

  defp elixirc_paths(:test), do: elixirc_paths(:dev) ++ ["test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  defp package do
    [
      files:       ["lib", "config", "mix.exs", "test", "README.md"],
      maintainers: ["Kamil Lelonek"],
      licenses:    ["MIT"],
      links:       %{ "GitHub" => "https://github.com/KamilLelonek/ex_postmark" },
    ]
  end
end
