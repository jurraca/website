defmodule Website.Crawler do

    def run do
        "priv/static/content"
        |> File.ls!()
        |> Enum.map(&Website.Post.compile/1)
    end

    def crawl_titles() do
        run()
        |> Enum.map(fn x -> x.title end)
    end
end