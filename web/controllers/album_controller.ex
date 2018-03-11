defmodule Recollect.AlbumController do
  use Recollect.Web, :controller

  alias Recollect.Album
  alias Recollect.Artist
  alias Recollect.Label

  plug :load_artists when action in [:new, :create, :edit, :update]
  plug :load_labels when action in [:new, :create, :edit, :update]

  def index(conn, _params) do
    albums = Repo.all(Album)
    render(conn, "index.html", albums: albums)
  end

  def new(conn, _params) do
    changeset = Album.changeset(%Album{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"album" => album_params}) do
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

  def show(conn, %{"id" => id}) do
    album = Repo.get!(Album, id)
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
