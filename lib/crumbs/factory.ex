defmodule Crumbs.Factory do
  # with Ecto
  #use ExMachina.Ecto, repo: Crumbs.Repo

  # without Ecto
  use ExMachina

  def factory(:page_visit) do
    %Crumbs.PageVisit{
      id: sequence("id"),
      referrer: "https://www.google.com/",
      host: "github.com",
      href: "https://github.com/thoughtbot/ex_machina",
      pathname: "/thoughtbot/ex_machina",
    }
  end
end
