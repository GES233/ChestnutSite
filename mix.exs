defmodule Chestnut.Umbrella.MixProject do
  use Mix.Project

  def project do
    [
      apps_path: "apps",
      version: "0.1.0",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases()
    ]
  end

  # 依赖项采用 Hex 包:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # 或 git 仓库:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # 想获得更多例子与选项，请输入 "mix help deps" 。
  #
  # 此处列出的依赖项仅适用于本项目，不能从 apps/ 文件夹内的应用程序访问。
  defp deps do
    [
      # Required to run "mix format" on ~H/.heex files from the umbrella root
      {:phoenix_live_view, ">= 0.0.0"}
    ]
  end

  defp aliases do
    [
      setup: ["cmd mix setup"]
    ]
  end
end
