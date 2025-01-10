defmodule Backend.Repo.Migrations.CreateUserProfiles do
  use Ecto.Migration

  def change do
    create table(:user_profiles) do
      add :user_id, references(:users, on_delete: :delete_all), null: false
      add :bio, :text
      add :address, :string
      add :phone_number, :string
      add :inserted_at, :utc_datetime
      add :updated_at, :utc_datetime
    end

    create index(:user_profiles, [:user_id])
  end
end
