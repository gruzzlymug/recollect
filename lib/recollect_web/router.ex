defmodule RecollectWeb.Router do
  use RecollectWeb, :router

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

  scope "/", RecollectWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/records", RecordController, :index
    get "/records/:id", RecordController, :show
  end

  # Other scopes may use custom stacks.
  # scope "/api", RecollectWeb do
  #   pipe_through :api
  # end
end
