defmodule Pacvex.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :description, :text
      add :position, :string
      add :email, :string
      add :phone, :string
      add :location, :string
      add :location_url, :string
      add :admin, :boolean, default: false, null: false

      timestamps()
    end

  end
end
