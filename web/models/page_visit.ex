defmodule Crumbs.PageVisit do
  require Tirexs.Mapping
  alias Tirexs.Mapping
  require Tirexs.ElasticSearch

  #@derive [Access]
  defstruct [:id, :projectId, :referrer, :href, :pathname, :host, :hash, :port, :createdAt]

  def index do
    index = [index: index_name, type: "pagevisit"]
    Mapping.mappings do
      indexes "id", type: "string", index: "not_analyzed"
      indexes "projectId", type: "string", index: "not_analyzed"
      indexes "referrer", type: "string"
      indexes "href", type: "string"
      indexes "pathname", type: "string"
      indexes "host", type: "string"
      indexes "hash", type: "string"
      indexes "port", type: "integer", index: "not_analyzed"
      indexes "createdAt", type: "date"
    end

    index
  end

  # values being keywords
  def visit(values) do
    import Tirexs.Bulk
    settings = Tirexs.ElasticSearch.config()
    values = List.wrap(values) |> Enum.map(&to_es_list/1)
    Tirexs.Bulk.store [index: index_name], settings, do: values
  end

  def index_name do
    "#{Mix.env}-pagevisits"
  end

  defp to_es_list(value) do
    [index: Keyword.delete(Map.to_list(value), :__struct__)]
  end
end

