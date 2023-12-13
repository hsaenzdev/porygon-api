defmodule PorygonWeb.Resolvers.Pokemon do
  @poke_api_url "https://pokeapi.co/api/v2/pokemon"

  def get_pokemon(_parent, %{name: pokemon_name}, _resolution) do
    case HTTPoison.get("#{@poke_api_url}/#{pokemon_name}") do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        case Jason.decode(body) do
          {:ok, info} -> {:ok, Porygon.Pokemon.get_pokemon(info)}
          {:error, _} -> {:error, "unable to decode response"}
        end

      {:ok, %HTTPoison.Response{status_code: 404}} ->
        {:error, "Pokemon #{pokemon_name} not found"}

      {:ok, %HTTPoison.Response{status_code: status_code}} ->
        {:error, "Error code: #{status_code}"}

      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, "Connection error: #{reason}"}
    end
  end
end
