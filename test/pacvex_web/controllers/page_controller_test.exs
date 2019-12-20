defmodule PacvexWeb.PageControllerTest do
  use PacvexWeb.ConnCase

  alias Pacvex.Accounts

  setup do
    {:ok, owner} =
      Accounts.create_user(%{
        admin: true,
        description: "some description",
        email: "some email",
        location: "some location",
        location_url: "some location_url",
        name: "some name",
        phone: "some phone",
        position: "some position"
      })

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
