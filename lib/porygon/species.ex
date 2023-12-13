defmodule Porygon.Species do
  def get_pokemon_species(pokemon_species) do
    info =
      Map.take(pokemon_species, [
        "id",
        "name"
      ])
      |> stringify_keys()

    flavor_text_entries =
      Enum.map(pokemon_species["flavor_text_entries"], &transform_flavor_text/1)

    Map.merge(
      info,
      %{
        flavor_text_entries: flavor_text_entries
      }
    )
  end

  defp transform_flavor_text(flavor_text_entry) do
    %{
      flavor_text: flavor_text_entry["flavor_text"],
      language: flavor_text_entry["language"]["name"]
    }
  end

  defp stringify_keys(map) do
    map
    |> Enum.map(fn {key, value} -> {String.to_atom(key), value} end)
    |> Enum.into(%{})
  end
end
