defmodule NestedformWeb.Router do
  use NestedformWeb, :router

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

  scope "/", NestedformWeb do
    pipe_through :browser

    resources "/internetconnections", InternetConnectionController
    resources "/siteinfo", SiteinfoController
    resources "/stores", StoreController
    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", NestedformWeb do
  #   pipe_through :api
  # end
end
