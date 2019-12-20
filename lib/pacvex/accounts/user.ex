defmodule Pacvex.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :admin, :boolean, default: false
    field :description, :string
    field :email, :string
    field :location, :string
    field :location_url, :string
    field :name, :string
    field :phone, :string
    field :position, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :description, :position, :email, :phone, :location, :location_url, :admin])
    |> validate_required([:name, :description, :position, :email, :phone, :location, :location_url, :admin])
  end
end
