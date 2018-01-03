Path.join(["rel", "plugins", "*.exs"])
|> Path.wildcard()
|> Enum.map(&Code.eval_file(&1))

use Mix.Releases.Config,
    default_release: :default,
    default_environment: :prod

environment :dev do
  set dev_mode: true
  set include_erts: false
  set cookie: :"nomnomnom"
end

environment :prod do
  set include_erts: false
  set include_src: false
  set cookie: :"nomnomnom"
end

release :katie do
  set version: current_version(:katie)
  set applications: [
    :runtime_tools, :wx, :observer
  ]
end

