defmodule PacvexWeb.PageControllerTest do
  use PacvexWeb.ConnCase

  import Pacvex.Factory

  setup do
    {:ok, owner} = create(:user, %{admin: true})

    {:ok, owner: owner}
  end

  test "GET /home", %{conn: conn, owner: owner} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ owner.description
  end

  test "GET /contact", %{conn: conn, owner: owner} do
    conn = get(conn, "/contact")
    assert html_response(conn, 200) =~ owner.phone
  end
end
