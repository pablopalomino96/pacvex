defmodule Pacvex.Factory do
  alias Pacvex.Accounts
  alias Pacvex.Repo

  # Factories

  @user_params %{
    admin: false,
    description: "some description",
    email: "user@email",
    location: "some location",
    location_url: "https://location.com",
    name: "Test User",
    phone: "000 000 000",
    position: "Tester"
  }

  @social_media_params %{
    instagram: "Instagram user profile",
    github: "Github user profile",
    linkedin: "Linkedin user profile",
    spotify: "Spotify user profile"
  }

  @company_params %{
    name: "Test company",
    website: "www.test_company.com"
  }

  def build(:user, attrs \\ %{}) do
    params = Enum.into(attrs, @user_params)

    struct(Accounts.User, params)
  end

  def create(:user, attrs \\ %{}) do
    attrs
    |> Enum.into(@user_params)
    |> Accounts.create_user()
    |> case do
      {:ok, user} ->
        user
        |> Ecto.build_assoc(:social_media, @social_media_params)
        |> Repo.insert!()

        user
        |> Ecto.build_assoc(:company, @company_params)
        |> Repo.insert!()

        {:ok, Accounts.get_user!(user.id)}

      error ->
        error
    end
  end
end
