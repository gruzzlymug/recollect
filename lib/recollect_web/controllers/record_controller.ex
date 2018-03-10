defmodule RecollectWeb.RecordController do
  use RecollectWeb, :controller

  def index(conn, _pararms) do
    render conn, "index.html"
  end

  def show(conn, %{"id" => id}) do
    [name, number] = ["Beast of Burden", id]
    render conn, "show.html", record_name: "#{name} #{number}"
  end
end
