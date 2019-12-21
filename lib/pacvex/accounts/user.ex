defmodule Pacvex.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Pacvex.Accounts.Company
  alias Pacvex.Accounts.Social_media

  schema "users" do
    field :admin, :boolean, default: false
    field :description, :string
    field :email, :string
    field :location, :string
    field :location_url, :string
    field :name, :string
    field :phone, :string
    field :position, :string

    has_one :social_media, Social_media, on_replace: :delete
    has_one :company, Company, on_replace: :delete

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [
      :name,
      :description,
      :position,
      :email,
      :phone,
      :location,
      :location_url,
      :admin
    ])
    |> validate_required([
      :name,
      :description,
      :position,
      :email,
      :phone,
      :location,
      :location_url,
      :admin
    ])
  end
end
