defmodule Recollect.CsvController do
  use Recollect.Web, :controller
  alias Recollect.Album
  alias Recollect.Repo

  def export(conn, _params) do
    conn
    |> put_resp_content_type("text/csv")
    |> put_resp_header("content-disposition", "attachment; filename=\"albums.csv\"")
    |> send_resp(200, csv_albums())
  end

  #
  # SELECT
  #   artist,
  #   SUM(1) AS releases,
  #   MIN(year) AS first,
  #   MAX(year) AS last,
  #   STRING_AGG(title, ' ') AS title_words
  # FROM albums
  # GROUP BY artist
  # ORDER BY first, artist
  #
  #            artist       | releases | first | last |                    title_words
  #      -------------------+----------+-------+------+---------------------------------------------------
  #       Black Sabbath     |        4 |  1970 | 1975 | Black Sabbath Paranoid Master of Reality Sabotage
  #       Rolling Stones    |        2 |  1971 | 1978 | Sticky Fingers Some Girls
  #       King Tubby        |        1 |  1974 | 1974 | The Roots of Dub
  #       Black Flag        |        1 |  1981 | 1981 | Damaged
  #       Beastie Boys      |        2 |  1986 | 1989 | Licensed to Ill Paul's Boutique
  #       PJ Harvey         |        1 |  1993 | 1993 | Rid of Me
  #       Radiohead         |        3 |  1995 | 2000 | The Bends OK Computer Kid A
  #       NSYNC             |        1 |  2000 | 2000 | No Strings Attached
  #       My Morning Jacket |        1 |  2008 | 2008 | Evil Urges
  #       The Growlers      |        3 |  2009 | 2014 | Are You In or Out? Hung at Heart Chinese Fountain
  #       Portugal. The Man |        2 |  2010 | 2013 | American Ghetto Evil Friends
  #       Parquet Courts    |        1 |  2012 | 2012 | Light Up Gold
  #       Camera Obscura    |        1 |  2013 | 2013 | Desire Lines
  #       Night Beats       |        1 |  2016 | 2016 | Who Sold My Generation
  #
  defp csv_albums do
    Album
    |> Repo.all
    |> to_csv
  end

  defp to_csv(records) do
    # CSV.encode expects a list of lists
    records
    |> Enum.map(fn r -> Map.drop(r, [:__meta__, :__struct__, :id, :inserted_at, :updated_at]) end)
    |> Enum.map(fn r -> Map.values(r) end)
    |> CSV.encode
    |> Enum.to_list
    |> to_string
  end
end
