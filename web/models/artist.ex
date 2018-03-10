defmodule Recollect.Artist do
  use Recollect.Web, :model

  schema "artists" do
    field :name, :string

    timestamps
  end
end
