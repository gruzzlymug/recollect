defmodule Recollect.Repo.Migrations.CreateArtist do
  use Ecto.Migration

  def change do
    create table(:artists) do
      add :name, :string

      timestamps()
    end

    create unique_index(:artists, [:name])
  end
end
