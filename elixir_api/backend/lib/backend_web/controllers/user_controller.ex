defmodule BackendWeb.UserController do
  use BackendWeb, :controller
  alias Backend.User
  alias Backend.User

  def getAllUsers(conn, _params) do
    case User.get_all_users() do
      {:ok, users} ->
        json(conn, %{message: "List of users", data: users, status: "success"})

      {:error, message} ->
        json(conn, %{message: message, status: "error"})
    end
  end

  def getUser(conn, %{"id" => id}) do
    case User.get_user(id) do
      {:ok, user} ->
        json(conn, %{message: "User found", data: user, status: "success"})

      {:error, message} ->
        json(conn, %{message: message, status: "error"})
    end
  end

  def createUser(conn, %{"user" => user_params}) when not is_nil(user_params) do

    case User.create_user(user_params) do
      {:ok, user} ->
        json(conn, %{message: "User created", data: user, status: "success"})

      {:error, changeset} ->
        formatted_errors = format_changeset_errors(changeset)
        json(conn, %{message: "Error creating user", data: changeset.errors, status: "error"})
    end
  end

  def createUser(conn, _params) do
    json(conn, %{message: "Invalid request: 'user' is required", status: "error"})
  end

  def updateUser(conn, %{"id" => id, "user" => user_params}) do
    case User.update_user(id, user_params) do
      {:ok, user} ->
        json(conn, %{message: "User updated", data: user, status: "success"})

      {:error, changeset} ->
        json(conn, %{message: "Error updating user", data: changeset.errors, status: "error"})
      end
  end

  def deleteUser(conn, %{"id" => id}) do
    case User.delete_user(id) do
      {:ok, _user} ->
        json(conn, %{message: "User deleted", status: "success"})

      {:error, message} ->
        json(conn, %{message: message, status: "error"})
    end

  end

  defp format_changeset_errors(changeset) do
    Ecto.Changeset.traverse_errors(changeset, fn {msg, opts} ->
      Enum.reduce(opts, msg, fn {key, value}, acc ->
        String.replace(acc, "%{#{key}}", to_string(value))
      end)
    end)
  end
end
