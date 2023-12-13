defmodule PorygonWeb.Schema.PokemonTypes do
  use Absinthe.Schema.Notation

  object :pokemon do
    field(:id, :integer)
    field(:name, :string)
    field(:order, :integer)
    field(:height, :integer)
    field(:weight, :integer)
    field(:sprites, :pokemon_sprites)
    field(:abilities, list_of(:pokemon_ability))
    field(:types, list_of(:pokemon_types))
  end

  object :pokemon_ability do
    field(:name, :string)
    field(:url, :string)
  end

  object :pokemon_types do
    field(:name, :string)
    field(:url, :string)
  end

  object :pokemon_sprites do
    field(:front_default, :string)
    field(:back_default, :string)
    field(:front_shiny, :string)
    field(:back_shiny, :string)
    field(:official_artwork, :pokemon_sprites_official_artwork)
  end

  object :pokemon_sprites_official_artwork do
    field(:front_default, :string)
    field(:front_shiny, :string)
  end
end
