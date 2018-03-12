defmodule Recollect.Artist do
  use Recollect.Web, :model

  schema "artists" do
    field :name, :string

    # has_many :albums, Recollect.Album

    timestamps()
  end

  def alphabetical(query) do
    from a in query, order_by: a.name
  end

  def names_and_ids(query) do
    from a in query, select: {a.name, a.id}
  end
end
