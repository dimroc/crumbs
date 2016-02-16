defmodule Mix.Tasks.Crumbs.Es.Create do
  use Mix.Task
  import Mix.Crumbs

  @shortdoc "Creates elasticsearch indices for application"
  def run(args) do
    IO.puts "Creating Elasticsearch Indices"
    Crumbs.IndexManager.create!
  end
end

