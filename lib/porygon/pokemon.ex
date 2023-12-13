defmodule Porygon.Pokemon do
  def get_pokemon(pokemon) do
    info =
      Map.take(pokemon, [
        "id",
        "name",
        "order",
        "height",
        "weight"
      ])
      |> stringify_keys()

    sprites = transform_sprites(pokemon["sprites"])
    abilities = Enum.map(pokemon["abilities"], &transform_ability/1)
    types = Enum.map(pokemon["types"], &transform_type/1)

    Map.merge(info, %{
      sprites: sprites,
      abilities: abilities,
      types: types
    })
  end

  defp transform_ability(ability_info) do
    ability = ability_info["ability"]
    %{name: ability["name"], url: ability["url"]}
  end

  defp transform_type(type_info) do
    type = type_info["type"]
    %{name: type["name"], url: type["url"]}
  end

  defp transform_sprites(sprites) do
    basic_sprites =
      sprites
      |> Map.take(["front_default", "back_default", "front_shiny", "back_shiny"])
      |> stringify_keys()

    official_artwork =
      case get_in(sprites, ["other", "official-artwork"]) do
        nil ->
          %{}

        sprites ->
          sprites
          |> stringify_keys()
      end

    Map.merge(basic_sprites, %{official_artwork: official_artwork})
  end

  defp stringify_keys(map) do
    map
    |> Enum.map(fn {key, value} -> {String.to_atom(key), value} end)
    |> Enum.into(%{})
  end
end
