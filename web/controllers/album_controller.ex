defmodule Recollect.AlbumController do
  use Recollect.Web, :controller

  alias Recollect.Album
  alias Recollect.Artist
  alias Recollect.Label

  plug :load_artists when action in [:new, :create, :edit, :update]
  plug :load_labels when action in [:new, :create, :edit, :update]

  def index(conn, _params) do
    albums = Album
      |> Repo.all
      |> Repo.preload(:artist)
      |> Repo.preload(:label)
    render(conn, "index.html", albums: albums)
  end

  def new(conn, _params) do
    changeset = Album.changeset(%Album{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"album" => album_params}) do
    artist = find_or_create_artist(album_params["artist_id"])
    album_params = Map.put(album_params, "artist_id", artist.id)

    label = find_or_create_label(album_params["label_id"])
    album_params = Map.put(album_params, "label_id", label.id)
    changeset = Album.changeset(%Album{}, album_params)

    case Repo.insert(changeset) do
      {:ok, album} ->
        conn
        |> put_flash(:info, "Album created successfully.")
        |> redirect(to: album_path(conn, :show, album))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  defp find_or_create_artist(artist_name) do
    artist = Repo.get_by(Artist, name: artist_name)
    if artist == nil do
      artist = Repo.insert!(%Artist{name: artist_name})
    end
    artist
  end

  defp find_or_create_label(label_name) do
    label = Repo.get_by(Label, name: label_name)
    if label == nil do
      label = Repo.insert!(%Label{name: label_name})
    end
  end

  def show(conn, %{"id" => id}) do
    # album = Repo.get!(Album, id)
    album = Album
      |> Repo.get!(id)
      |> Repo.preload(:artist)
      |> Repo.preload(:label)
    render(conn, "show.html", album: album)
  end

  def edit(conn, %{"id" => id}) do
    album = Repo.get!(Album, id)
    changeset = Album.changeset(album)
    render(conn, "edit.html", album: album, changeset: changeset)
  end

  def update(conn, %{"id" => id, "album" => album_params}) do
    album = Repo.get!(Album, id)
    changeset = Album.changeset(album, album_params)

    case Repo.update(changeset) do
      {:ok, album} ->
        conn
        |> put_flash(:info, "Album updated successfully.")
        |> redirect(to: album_path(conn, :show, album))
      {:error, changeset} ->
        render(conn, "edit.html", album: album, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    album = Repo.get!(Album, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(album)

    conn
    |> put_flash(:info, "Album deleted successfully.")
    |> redirect(to: album_path(conn, :index))
  end

  defp load_artists(conn, _) do
    query =
      Artist
      |> Artist.alphabetical
      |> Artist.names_and_ids
    artists = Repo.all query
    assign(conn, :artists, artists)
  end

  defp load_labels(conn, _) do
    query =
      Label
      |> Label.alphabetical
      |> Label.names_and_ids
    labels = Repo.all query
    assign(conn, :labels, labels)
  end
end
