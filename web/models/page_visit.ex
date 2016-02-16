defmodule Crumbs.PageVisit do
  require Tirexs.Mapping
  alias Tirexs.Mapping

  def index do
    index = [index: "#{Mix.env}-pagevisits", type: "pagevisit"]
    Mapping.mappings do
      indexes "id", type: "long", index: "not_analyzed"
      indexes "projectId", type: "long", index: "not_analyzed"
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
end

