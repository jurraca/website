defmodule Website.Post do
    defstruct title: "", date: "", byline: "", content: ""

    def compile(file) do
        %Website.Post{
            title: file_to_title(file),
            content: load(file)
        }
    end

    def file_to_title(file) do
        file
        |> String.replace(~r/\.md$/, "")
        |> String.replace("_", " ")
        |> String.split()
        |> Enum.map(fn x -> String.capitalize(x) end)
        |> Enum.join(" ")
    end

    def get_tags(file) do
        file
        |> File.read!()
        |> String.split(~r/#\w*/)
    end

    def get() do
        "assets/static/content"
        |> File.ls!()
        |> Enum.map(&load/1)
    end

    def load(file) do
        "priv/static/content/" <> file
        |> File.read!()
        |> Earmark.as_html!()
        |> Phoenix.HTML.raw()
    end
end