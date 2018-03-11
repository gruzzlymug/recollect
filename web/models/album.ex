defmodule Recollect.Album do
  use Recollect.Web, :model

  schema "albums" do
    field :title, :string
    field :year, :integer
    field :condition, :string
    field :liner_notes, :string
    belongs_to :artist, Recollect.Artist, foreign_key: :artist_id
    belongs_to :label, Recollect.Label, foreign_key: :label_id

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:artist_id, :label_id, :title, :year, :condition, :liner_notes])
    |> validate_required([:artist_id, :label_id, :title, :year, :condition, :liner_notes])
    # |> assoc_constraint(:artist)
  end
end
