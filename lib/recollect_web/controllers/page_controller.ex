defmodule RecollectWeb.PageController do
  use RecollectWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
