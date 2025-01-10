defmodule Backend.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :first_name, :string
    field :last_name, :string
    field :email, :string
    field :password, :string
    field :role, :string
    field :status, :string
    field :inserted_at, :utc_datetime
    field :updated_at, :utc_datetime
  end
end
