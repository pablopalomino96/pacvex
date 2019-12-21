defmodule Pacvex.AccountsTest do
  use Pacvex.DataCase

  import Pacvex.Factory

  alias Pacvex.Accounts

  describe "users" do
    alias Pacvex.Accounts.User

    test "list_users/0 returns all users" do
      {:ok, user} = create(:user)
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      {:ok, user} = create(:user)
      assert Accounts.get_user!(user.id) == user
    end

    test "get_owner!/0 returns the web owner" do
      {:ok, owner} = create(:user, %{admin: true})

      assert Accounts.get_owner!() == owner
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = create(:user)
      assert user.admin == false
      assert user.description == "some description"
      assert user.email == "user@email"
      assert user.location == "some location"
      assert user.location_url == "https://location.com"
      assert user.name == "Test User"
      assert user.phone == "000 000 000"
      assert user.position == "Tester"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = create(:user, %{name: nil})
    end

    test "update_user/2 with valid data updates the user" do
      {:ok, user} = create(:user)

      assert {:ok, %User{name: "Test User Updated"} = user} =
               Accounts.update_user(user, %{name: "Test User Updated"})
    end

    test "update_user/2 with invalid data returns error changeset" do
      {:ok, user} = create(:user)
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, %{name: nil})
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      {:ok, user} = create(:user)
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      {:ok, user} = create(:user)
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end
end
