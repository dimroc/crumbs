defmodule Crumbs.PageController do
  use Crumbs.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
