defmodule PorygonWeb.Schema.SpeciesTypes do
  use Absinthe.Schema.Notation

  object :species do
    field(:id, :integer)
    field(:name, :string)
    field(:flavor_text_entries, list_of(:flavor_text_entries))
  end

  object :flavor_text_entries do
    field(:flavor_text, :string)
    field(:language, :string)
  end
end
