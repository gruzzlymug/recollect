defmodule Recollect.Router do
  use Recollect.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Recollect do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/albums", AlbumController
  end

  scope "/csv", Recollect do
    pipe_through :browser # Use the default browser stack

    get "/albums", CsvController, :export_albums
  end

  # Other scopes may use custom stacks.
  # scope "/api", Recollect do
  #   pipe_through :api
  # end
end
