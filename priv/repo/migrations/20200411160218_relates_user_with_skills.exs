defmodule Pacvex.Repo.Migrations.RelatesUserWithSkills do
  use Ecto.Migration

  def change do
    alter table(:skills) do
      add :user_id, references(:users)
    end

    create(index(:skills, :user_id))
  end
end
