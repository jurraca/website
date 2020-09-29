defmodule WebsiteWeb.PageController do
  use WebsiteWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def writing(conn, _params) do
    render(conn, "writing.html")
  end
end
