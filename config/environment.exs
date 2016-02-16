use Mix.Config

config :tirexs, uri: URI.parse(System.get_env("ELASTICSEARCH_URL"))
