defmodule BackendWeb.ProjectController do
  use BackendWeb, :controller

  def index(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    # render(conn, :home, layout: false)

    json(conn, %{message: "Welcome to the Backend API"})
  end
end
