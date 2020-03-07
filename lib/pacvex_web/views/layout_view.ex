defmodule PacvexWeb.LayoutView do
  use PacvexWeb, :view

  def format_page_title(name) do
    name
    |> String.split()
    |> case do
      [name] -> name
      [first_name | lastnames] -> "#{first_name} #{format_lastname(lastnames)}"
    end
  end

  defp format_lastname([lastname]), do: String.first(lastname)

  defp format_lastname([lastname | rest]) do
    "#{String.first(lastname)}#{format_lastname(rest)}"
  end
end
