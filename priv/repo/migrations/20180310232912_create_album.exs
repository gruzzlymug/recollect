defmodule Recollect.Repo.Migrations.CreateAlbum do
  use Ecto.Migration

  def change do
    create table(:albums) do
      add :title, :string
      add :year, :integer
      add :condition, :string
      add :liner_notes, :text
      add :artist_id, references(:artists, on_delete: :nothing)
      add :label_id, references(:labels, on_delete: :nothing)

      timestamps()
    end

    create index(:albums, [:artist_id])
    create index(:albums, [:label_id])
  end
end
