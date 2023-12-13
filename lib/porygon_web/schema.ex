defmodule PorygonWeb.Schema do
  use Absinthe.Schema

  import_types(Absinthe.Type.Custom)
  import_types(PorygonWeb.Schema.PokemonTypes)
  import_types(PorygonWeb.Schema.SpeciesTypes)

  alias PorygonWeb.Resolvers

  query do
    @desc "Get pokemon info"
    field :pokemon, :pokemon do
      arg(:name, non_null(:string))
      resolve(&Resolvers.Pokemon.get_pokemon/3)
    end

    @desc "Get pokemon species"
    field :species, :species do
      arg(:id, non_null(:integer))
      resolve(&Resolvers.Species.get_pokemon_species/3)
    end
  end
end
