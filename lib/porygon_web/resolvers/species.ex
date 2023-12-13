defmodule PorygonWeb.Resolvers.Species do
  @poke_api_url "https://pokeapi.co/api/v2/pokemon-species"

  def get_pokemon_species(_parent, %{id: pokemon_id}, _resolution) do
    case HTTPoison.get("#{@poke_api_url}/#{pokemon_id}") do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        case Jason.decode(body) do
          {:ok, info} -> {:ok, Porygon.Species.get_pokemon_species(info)}
          {:error, _} -> {:error, "unable to decode response"}
        end

      {:ok, %HTTPoison.Response{status_code: 404}} ->
        {:error, "Pokemon species #{pokemon_id} not found"}

      {:ok, %HTTPoison.Response{status_code: status_code}} ->
        {:error, "Error code: #{status_code}"}

      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, "Connection error: #{reason}"}
    end
  end
end
