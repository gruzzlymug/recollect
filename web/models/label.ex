defmodule Recollect.Label do
  use Recollect.Web, :model

  schema "labels" do
    field :name, :string

    timestamps
  end
end
