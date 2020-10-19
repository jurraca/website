defmodule Website.Post do
    defstruct id: "", title: "", date: "", byline: "", content: ""

    def compile(file) do
        %Website.Post{
            id: get_slug(file),
            title: get_title(file),
            content: load(file)
        }
    end

    def get_slug(file) do
        file
        |> String.replace(~r/\.md$/, "")
    end

    def get_title(file) do
        file
        |> get_slug()
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

    def load(file) do
        "priv/static/content/" <> file
        |> File.read!()
        |> Earmark.as_html!()
        |> Phoenix.HTML.raw()
    end
end