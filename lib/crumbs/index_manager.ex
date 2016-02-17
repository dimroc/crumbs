defmodule Crumbs.IndexManager do
  require Tirexs.{ElasticSearch,Mapping,Manage}
  alias Tirexs.Mapping

  def create! do
    Enum.map(index_classes, &create_index_for/1)
  end

  def refresh do
    settings = Tirexs.ElasticSearch.config()
    Enum.map(index_classes, fn(indexee) ->
      Tirexs.Manage.refresh(indexee.index_name, settings)
    end)
  end

  def destroy! do
    settings = Tirexs.ElasticSearch.config()
    Enum.map(index_classes, fn(indexee) ->
      Tirexs.ElasticSearch.delete(indexee.index_name, settings)
    end)
  end

  defp create_index_for(indexee) do
    { :ok, status, body } = Mapping.create_resource(indexee.index)
  end

  defp index_classes do
    [
      Crumbs.PageVisit
    ]
  end
end
