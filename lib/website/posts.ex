defmodule Website.Posts do

    def get() do
        "assets/static/content"
        |> File.ls!()
        |> Enum.map(&load/1)
    end

    def load(file) do
        "assets/static/content/" <> file
        |> File.read!()
        |> Earmark.as_html!()
    end
end