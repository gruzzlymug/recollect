defmodule Recollect.Label do
  use Recollect.Web, :model

  schema "labels" do
    field :name, :string

    # has_many :albums, Recollect.Album

    timestamps()
  end

  # TODO: this should be DRYed up (see artist)
  def alphabetical(query) do
    from b in query, order_by: b.name
  end

  def names_and_ids(query) do
    from b in query, select: {b.name, b.id}
  end
end
