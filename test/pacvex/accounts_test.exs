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

  describe "skills" do
    alias Pacvex.Accounts.Skill

    @valid_attrs %{logo: "some logo", name: "some name", rate: 42, website: "some website"}
    @update_attrs %{logo: "some updated logo", name: "some updated name", rate: 43, website: "some updated website"}
    @invalid_attrs %{logo: nil, name: nil, rate: nil, website: nil}

    def skill_fixture(attrs \\ %{}) do
      {:ok, skill} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_skill()

      skill
    end

    test "list_skills/0 returns all skills" do
      skill = skill_fixture()
      assert Accounts.list_skills() == [skill]
    end

    test "get_skill!/1 returns the skill with given id" do
      skill = skill_fixture()
      assert Accounts.get_skill!(skill.id) == skill
    end

    test "create_skill/1 with valid data creates a skill" do
      assert {:ok, %Skill{} = skill} = Accounts.create_skill(@valid_attrs)
      assert skill.logo == "some logo"
      assert skill.name == "some name"
      assert skill.rate == 42
      assert skill.website == "some website"
    end

    test "create_skill/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_skill(@invalid_attrs)
    end

    test "update_skill/2 with valid data updates the skill" do
      skill = skill_fixture()
      assert {:ok, %Skill{} = skill} = Accounts.update_skill(skill, @update_attrs)
      assert skill.logo == "some updated logo"
      assert skill.name == "some updated name"
      assert skill.rate == 43
      assert skill.website == "some updated website"
    end

    test "update_skill/2 with invalid data returns error changeset" do
      skill = skill_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_skill(skill, @invalid_attrs)
      assert skill == Accounts.get_skill!(skill.id)
    end

    test "delete_skill/1 deletes the skill" do
      skill = skill_fixture()
      assert {:ok, %Skill{}} = Accounts.delete_skill(skill)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_skill!(skill.id) end
    end

    test "change_skill/1 returns a skill changeset" do
      skill = skill_fixture()
      assert %Ecto.Changeset{} = Accounts.change_skill(skill)
    end
  end
end
