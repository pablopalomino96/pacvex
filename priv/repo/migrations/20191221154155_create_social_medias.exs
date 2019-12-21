defmodule Pacvex.Repo.Migrations.CreateSocialMedias do
  use Ecto.Migration

  def change do
    create table(:social_medias) do
      add :instagram, :string
      add :github, :string
      add :linkedin, :string
      add :spotify, :string

      timestamps()
    end

  end
end
