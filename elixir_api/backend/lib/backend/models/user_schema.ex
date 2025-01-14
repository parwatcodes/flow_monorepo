defmodule Backend.UserSchema do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field(:first_name, :string)
    field(:last_name, :string)
    field(:email, :string)
    field(:password, :string)
    field(:role, :string)
    field(:status, :string)
    field(:inserted_at, :utc_datetime)
    field(:updated_at, :utc_datetime)
  end

  def changeset(user, params) do
    user
    |> cast(params, [:first_name, :last_name, :email, :password, :role, :status])
    # |> validate_required([:first_name, :email, :password])
    |> validate_format(:email, ~r/@/)
    |> validate_length(:password, min: 8)
    |> unique_constraint(:email)
  end
end
