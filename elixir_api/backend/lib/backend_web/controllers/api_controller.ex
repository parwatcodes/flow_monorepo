defmodule BackendWeb.ApiController do
  use BackendWeb, :controller

  def index(conn, _params) do
    json(conn, %{message: "Welcome to the Elixir Phoenix backend API"})
  end
end