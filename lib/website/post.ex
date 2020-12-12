defmodule Website.Post do
    defstruct id: "", title: "", date: "", byline: "", content: "", tags: []

    def compile(file) do
        post = %Website.Post{
            id: get_slug(file)
        }

        "priv/static/content/posts/" <> file
        |> File.read!()
        |> split()
        |> extract(post)
    end

    def get_slug(file) do
        String.replace(file, ~r/\.md$/, "")
    end

    def split(data) do
        [frontmatter, markdown] = String.split(data, ~r/\n-{3,}\n/, parts: 2)
        {parse_yaml(frontmatter), Earmark.as_html!(markdown)}
      end

    defp parse_yaml(yaml) do
      [parsed] = :yamerl_constr.string(yaml)
      parsed
    end

    def get_prop(props, key) do
      case :proplists.get_value(String.to_charlist(key), props) do
        :undefined -> nil
        x -> to_string(x)
      end
    end

    def extract({props, content}, post) do
      %{post |
        title: get_prop(props, "title"),
        date: get_prop(props, "date"),
        byline: get_prop(props, "byline"),
        content: Phoenix.HTML.raw(content),
        tags: get_prop(props, "tags")
    }
    end
end