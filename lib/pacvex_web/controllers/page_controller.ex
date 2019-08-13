defmodule PacvexWeb.PageController do
  use PacvexWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
