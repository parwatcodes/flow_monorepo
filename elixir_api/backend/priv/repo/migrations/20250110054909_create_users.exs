defmodule Backend.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :first_name, :string
      add :last_name, :string
      add :email, :string
      add :password, :string
      add :role, :string
      add :status, :string
      add :inserted_at, :utc_datetime
      add :updated_at, :utc_datetime
    end
  end
end
