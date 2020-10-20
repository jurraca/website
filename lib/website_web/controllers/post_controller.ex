defmodule WebsiteWeb.PostController do
    use WebsiteWeb, :controller

    def show(conn, %{"slug" => slug}) do
        # look up post based on title/slug
        post = Website.Post.compile(slug <> ".md")
        render(conn, "show.html", post: post)
    end
end