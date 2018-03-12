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
