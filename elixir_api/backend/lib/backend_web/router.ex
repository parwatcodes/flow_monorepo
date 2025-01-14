defmodule BackendWeb.Router do
  alias DialyxirVendored.Project
  alias Hex.API.User
  use BackendWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_live_flash)
    plug(:put_root_layout, html: {BackendWeb.Layouts, :root})
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", BackendWeb do
    pipe_through(:browser)

    get("/", PageController, :home)
  end

  # Other scopes may use custom stacks.
  scope "/api", BackendWeb do
    pipe_through(:api)

    get("/", PageController, :index)

    # Project routes
    scope "/projects" do
      get("/",  ProjectController, :getAllProjects)
      get("/:id", ProjectController, :getProject)
      post("/", ProjectController, :createProject)
      put("/:id", ProjectController, :updateProject)
      delete("/:id", ProjectController, :deleteProject)

      get("/static-error/:id", ProjectController, :staticError)
    end

    # User routes
    scope "/users" do
      get("/", UserController, :getAllUsers)
      get("/:id", UserController, :getUser)
      post("/", UserController, :createUser)
      put("/:id", UserController, :updateUser)
      delete("/:id", UserController, :deleteUser)
    end

    # Task routes
    scope "/tasks" do
      get("/", TaskController, :getAllTasks)
      get("/:id", TaskController, :getTask)
      post("/", TaskController, :createTask)
      put("/:id", TaskController, :updateTask)
      delete("/:id", TaskController, :deleteTask)
    end
  end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:backend, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through(:browser)

      live_dashboard("/dashboard", metrics: BackendWeb.Telemetry)
      forward("/mailbox", Plug.Swoosh.MailboxPreview)
    end
  end
end
