defmodule Recollect.AlbumController do
  use Recollect.Web, :controller

  alias Recollect.Album

  def index(conn, params) do
    # albums = Repo.all(Album)
    page = Album
           |> Repo.paginate(params)
    render(conn, "index.html", albums: page.entries, page: page)
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
end
