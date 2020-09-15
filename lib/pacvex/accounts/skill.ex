defmodule Pacvex.Accounts.Skill do
  use Ecto.Schema
  import Ecto.Changeset

  alias Pacvex.Accounts.User

  schema "skills" do
    field :logo, :string
    field :name, :string
    field :description, :string
    field :website, :string

    belongs_to(:user, User)
    
    timestamps()
  end

  @doc false
  def changeset(skill, attrs) do
    skill
    |> cast(attrs, [:name, :website, :logo, :description])
    |> validate_required([:name, :website, :logo, :description])
  end
end
