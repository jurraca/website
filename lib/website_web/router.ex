defmodule WebsiteWeb.Router do
  use WebsiteWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", WebsiteWeb do
    pipe_through :browser

    get "/", PageController, :index
    #get "/writing", PageController, :writing
    #get "/work", PageController, :work

    #get "/:slug", PostController, :show
  end
end
