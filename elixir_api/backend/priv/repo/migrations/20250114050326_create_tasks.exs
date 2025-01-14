defmodule Backend.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add(:title, :string)
      add(:description, :string)
      add(:status, :string)
      add(:priority, :string)
      add(:due_date, :utc_datetime)
      add(:is_completed, :boolean, default: false)
      add(:user_id, references(:users, on_delete: :nothing))

      timestamps()
    end
  end
end
