ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Crumbs.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Crumbs.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Crumbs.Repo)

