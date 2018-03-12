defmodule Recollect.Album do
  use Recollect.Web, :model

  schema "albums" do
    field :artist, :string
    field :title, :string
    field :label, :string
    field :year, :integer
    field :condition, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:artist, :title, :label, :year, :condition])
    |> validate_required([:artist, :title, :label, :year, :condition])
  end
end
