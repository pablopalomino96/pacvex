defmodule PacvexWeb.PageController do
  use PacvexWeb, :controller

  alias Pacvex.Accounts
  alias Pacvex.Repo

  plug :assign_owner

  def index(%{assigns: %{owner: user}} = conn, _params) do
    owner = Repo.preload(user, [:company, :social_media])

    render(conn, "home.html", owner: owner)
  end

  def contact(%{assigns: %{owner: owner}} = conn, _params) do
    render(conn, "contact.html", owner: owner)
  end

  defp assign_owner(conn, _params), do: assign(conn, :owner, Accounts.get_owner!())
end
