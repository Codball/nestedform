defmodule NestedformWeb.PageController do
  use NestedformWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
