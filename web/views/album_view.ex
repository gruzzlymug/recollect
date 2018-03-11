defmodule Recollect.AlbumView do
  use Recollect.Web, :view
  alias Recollect.Repo
  alias Recollect.Album
  alias Recollect.Artist
  alias Recollect.Label

  # TODO: this should work with the association (currently broken)
  def artist_name(%Album{artist_id: artist_id}) do
    artist = Repo.get_by!(Artist, id: artist_id)
    artist.name
  end

  def label_name(%Album{label_id: label_id}) do
    label = Repo.get_by!(Label, id: label_id)
    label.name
  end
end
