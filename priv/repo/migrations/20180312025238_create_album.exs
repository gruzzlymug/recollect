defmodule Recollect.Repo.Migrations.CreateAlbum do
  use Ecto.Migration

  def change do
    create table(:albums) do
      add :artist, :string
      add :title, :string
      add :label, :string
      add :year, :integer
      add :condition, :string

      timestamps()
    end
  end
end
