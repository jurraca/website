defmodule Website.Crawler do

    def crawl do
        File.ls!("priv/static/content")
        |> Enum.map(&Website.Post.compile/1)
    end

    def crawl_titles() do
        crawl
        |> Enum.map(fn x -> x.title end)
    end
end