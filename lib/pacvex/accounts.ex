defmodule Pacvex.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias Pacvex.Repo

  alias Pacvex.Accounts.User

  def list_users do
    Repo.all(User)
  end

  def get_user!(id), do: Repo.get!(User, id)

  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  def get_owner!() do
    User
    |> where([user], user.admin)
    |> Repo.one!()
  end

  def delete_user(%User{} = user) do
    user
    |> Repo.preload(:social_media)
    |> delete_social_media()
    |> Repo.preload(:company)
    |> delete_company()
    |> Repo.delete()
  end

  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

  def delete_social_media(%User{social_media: nil} = user), do: user

  def delete_social_media(%User{id: user_id, social_media: social_media}) do
    {:ok, _} = Repo.delete(social_media)

    get_user!(user_id)
  end

  def delete_company(%User{company: nil} = user), do: user

  def delete_company(%User{id: user_id, company: company}) do
    {:ok, _} = Repo.delete(company)

    # Reload user
    get_user!(user_id)
  end
end
