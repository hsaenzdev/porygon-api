defmodule PorygonWeb.Router do
  use PorygonWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api" do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: PorygonWeb.Schema,
      interface: :playground

    forward "/", Absinthe.Plug, schema: PorygonWeb.Schema
  end
end
