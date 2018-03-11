defmodule Recollect.AlbumTest do
  use Recollect.ModelCase

  alias Recollect.Album

  @valid_attrs %{condition: "some condition", liner_notes: "some liner_notes", title: "some title", year: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Album.changeset(%Album{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Album.changeset(%Album{}, @invalid_attrs)
    refute changeset.valid?
  end
end
