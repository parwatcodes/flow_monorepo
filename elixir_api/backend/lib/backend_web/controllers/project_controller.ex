defmodule BackendWeb.ProjectController do
  use BackendWeb, :controller

  def getAllProjects(conn, _params) do
    json(conn, %{message: "List of projects", data: [], status: "success"})
  end

  def getProject(conn, %{"id" => id}) do
    json(conn, %{message: "Welcome to the Backend API", id: id})
  end

  def createProject(conn, _params) do
    json(conn, %{message: "Welcome to the Backend API"})
  end

  def updateProject(conn, %{"id" => id}) do
    json(conn, %{message: "Welcome to the Backend API", id: id})
  end

  def deleteProject(conn, %{"id" => id}) do
    json(conn, %{message: "Welcome to the Backend API", id: id})
  end

  def staticError(conn, %{"id" => id}) do
    json(conn, %{
      message: "Invalid project ID",
      status: "error",
      error: %{
        code: 404,
        message: "The provided #{id} project ID does not exist."
      }
    })
  end
end
