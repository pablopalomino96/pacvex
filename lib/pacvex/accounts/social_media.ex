defmodule Pacvex.Accounts.Social_media do
  use Ecto.Schema
  import Ecto.Changeset

  alias Pacvex.Accounts.User

  schema "social_medias" do
    field :github, :string
    field :instagram, :string
    field :linkedin, :string
    field :spotify, :string

    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(social_media, attrs) do
    social_media
    |> cast(attrs, [:instagram, :github, :linkedin, :spotify])
    |> validate_required([:instagram, :github, :linkedin, :spotify])
  end
end
