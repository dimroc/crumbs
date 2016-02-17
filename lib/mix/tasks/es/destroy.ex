defmodule Mix.Tasks.Crumbs.Es.Destroy do
  use Mix.Task
  import Mix.Crumbs

  @shortdoc "Destroys elasticsearch indices for application"
  def run(args) do
    IO.puts "Destroying Elasticsearch Indices"
    Crumbs.IndexManager.destroy!
  end
end

