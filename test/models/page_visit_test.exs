defmodule Crumbs.PageVisitTest do
  use ExUnit.Case, async: false
  use Plug.Test
  alias Crumbs.IndexManager
  alias Crumbs.PageVisit
  import Crumbs.Factory

  setup do
    IndexManager.create!

    on_exit fn ->
      IndexManager.destroy!
    end
  end

  test ".visit inserts documents into ES" do
    response = PageVisit.visit([build(:page_visit)])
    { result, _, _ } = response
    assert result == :ok, "Failed to insert visits"
  end
end
