defmodule Pacvex.AccountsTest do
  use Pacvex.DataCase

  alias Pacvex.Accounts

  describe "users" do
    alias Pacvex.Accounts.User

    @valid_attrs %{
      admin: false,
      description: "some description",
      email: "some email",
      location: "some location",
      location_url: "some location_url",
      name: "some name",
      phone: "some phone",
      position: "some position"
    }

    @update_attrs %{
      admin: true,
      description: "some updated description",
      email: "some updated email",
      location: "some updated location",
      location_url: "some updated location_url",
      name: "some updated name",
      phone: "some updated phone",
      position: "some updated position"
    }

    @invalid_attrs %{
      admin: nil,
      description: nil,
      email: nil,
      location: nil,
      location_url: nil,
      name: nil,
      phone: nil,
      position: nil
    }

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "get_owner/0 returns the web owner" do
      owner = user_fixture(%{admin: true})

      assert Accounts.get_owner() == owner
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.admin == false
      assert user.description == "some description"
      assert user.email == "some email"
      assert user.location == "some location"
      assert user.location_url == "some location_url"
      assert user.name == "some name"
      assert user.phone == "some phone"
      assert user.position == "some position"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Accounts.update_user(user, @update_attrs)
      assert user.admin == true
      assert user.description == "some updated description"
      assert user.email == "some updated email"
      assert user.location == "some updated location"
      assert user.location_url == "some updated location_url"
      assert user.name == "some updated name"
      assert user.phone == "some updated phone"
      assert user.position == "some updated position"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end
end
