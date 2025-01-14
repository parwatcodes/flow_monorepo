defmodule Backend.TaskSchema do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field(:title, :string)
    field(:description, :string)
    field(:status, :string)
    field(:priority, :string)
    field(:due_date, :utc_datetime)
    field(:is_completed, :boolean)

    timestamps()
  end

  def changeset(user, params) do
    user
    |> cast(params, [:title, :description, :status, :priority, :due_date, :is_completed])
    |> validate_required([:title])
  end
end
