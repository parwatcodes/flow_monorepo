def BackendWeb.UserController do
  use BackendWeb, :controller

  def getAllUsers(conn, _params) do
    json(conn, %{message: "List of users", data: [], status: "success"})
  end

  def getUser(conn, %{"id" => id}) do
    json(conn, %{message: "Welcome to the Backend API", id: id})
  end

  def createUser(conn, _params) do
    json(conn, %{message: "Welcome to the Backend API"})
  end

  def updateUser(conn, %{"id" => id}) do
    json(conn, %{message: "Welcome to the Backend API", id: id})
  end

  def deleteUser(conn, %{"id" => id}) do
    json(conn, %{message: "Welcome to the Backend API", id: id})
  end

  def staticError(conn, %{"id" => id}) do
    json(conn, %{
      message: "Invalid user ID",
      status: "error",
      error: %{
        code: 404,
        message: "The provided #{id} user ID does not exist."
      }
    })
  end
end
