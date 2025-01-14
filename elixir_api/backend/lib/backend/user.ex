defmodule Backend.User do
  alias Backend.Repo
  alias Backend.UserSchema

  def create_user(user_params) do

    %UserSchema{}
    |> UserSchema.changeset(user_params)
    |> Repo.insert()
  end

  def get_all_users do
    users = Repo.all(UserSchema)

    if users == [] do
      {:error, "No users found"}
    else
      {:ok, users}
    end
  end

  def get_user(id) do
    case Repo.get(UserSchema, id) do
      nil -> {:error, "User not found"}
      user -> {:ok, user}
    end
  end

  def update_user(id, user_params) do
    user = Repo.get(UserSchema, id)
    |> UserSchema.changeset(user_params)
    |> Repo.update()
  end

  def delete_user(id) do
    case Repo.get(UserSchema, id) do
      nil -> {:error, "User not found"}
      user -> Repo.delete(user)
    end
  end
end
