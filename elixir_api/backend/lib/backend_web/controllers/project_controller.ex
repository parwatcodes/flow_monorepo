defmodule BackendWeb.ProjectController do
  use BackendWeb, :controller

  def getAllProjects(conn, _params) do

    json(conn, %{message: "Welcome to the Backend API"})
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
end
