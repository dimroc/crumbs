defmodule Crumbs.IndexManager do
  require Tirexs.Mapping
  alias Tirexs.Mapping

  def create! do
    Enum.map([
      Crumbs.PageVisit
    ], &create_index_for/1)
  end

  defp create_index_for(indexee) do
    { :ok, status, body } = Mapping.create_resource(indexee.index)
  end
end
