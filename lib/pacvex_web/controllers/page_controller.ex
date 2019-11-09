defmodule PacvexWeb.PageController do
  use PacvexWeb, :controller

  def index(conn, _params) do
    render(conn, "home.html")
  end

  def contact(conn, _params) do
    render(conn, "contact.html")
  end
end
