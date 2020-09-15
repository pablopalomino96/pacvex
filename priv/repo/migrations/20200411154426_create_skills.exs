defmodule Pacvex.Repo.Migrations.CreateSkills do
  use Ecto.Migration

  def change do
    create table(:skills) do
      add :name, :string
      add :website, :string
      add :logo, :string
      add :description, :string

      timestamps()
    end

  end
end
