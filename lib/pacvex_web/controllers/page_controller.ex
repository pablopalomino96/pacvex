defmodule PacvexWeb.PageController do
  use PacvexWeb, :controller

  alias Pacvex.Accounts

  plug :assign_owner

  def index(conn, _params) do
    owner = conn.assigns.owner
    render(conn, "home.html", owner: owner)
  end

  def contact(conn, _params) do
    owner = conn.assigns.owner

    render(conn, "contact.html", owner: owner)
  end

  defp assign_owner(conn, _params), do: assign(conn, :owner, Accounts.get_owner())
end
