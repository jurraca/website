defmodule WebsiteWeb.PageController do
  use WebsiteWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def writing(conn, _params) do
    posts = Website.Crawler.run()
    render(conn, "writing.html", posts: posts)
  end

  def work(conn, _params) do
    text = "priv/static/content/other/work_blurb.md"
      |> File.read!()
      |> Earmark.as_html!()
      |> Phoenix.HTML.raw()

    render(conn, "work.html", text: text)
  end
end
