defmodule Pacvex.Accounts.Company do
  use Ecto.Schema
  import Ecto.Changeset

  alias Pacvex.Accounts.User

  schema "companies" do
    field :name, :string
    field :website, :string

    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(company, attrs) do
    company
    |> cast(attrs, [:name, :website])
    |> validate_required([:name, :website])
  end
end
