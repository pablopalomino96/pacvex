defmodule Pacvex.Repo.Migrations.RelatesUserWithSocialMediaAndCompanies do
  use Ecto.Migration

  def change do
    alter table(:social_medias) do
      add :user_id, references(:users)
    end

    alter table(:companies) do
      add :user_id, references(:users)
    end

    create(index(:social_medias, :user_id))
    create(index(:companies, :user_id))
  end
end
