defmodule BackendWeb.PageController do
  use BackendWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end

  def index(conn, _params) do
    json(conn,  %{message: "Welcome to the Backend API"})
  end
end
