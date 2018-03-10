defmodule Recollect.PageController do
  use Recollect.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
