defmodule PacvexWeb.Router do
  use PacvexWeb, :router

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

  scope "/", PacvexWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/skills", PageController, :skills
    get "/contact", PageController, :contact
  end

  # Other scopes may use custom stacks.
  # scope "/api", PacvexWeb do
  #   pipe_through :api
  # end
end
