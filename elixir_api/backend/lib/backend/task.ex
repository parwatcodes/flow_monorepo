defmodule Backend.Task do
  alias Backend.Repo
  alias Backend.TaskSchema

  def create_task(task) do

    %TaskSchema{}
    |> TaskSchema.changeset(task)
    |> Repo.insert()
  end

  def get_all_tasks do
    tasks = Repo.all(TaskSchema)

    if tasks == [] do
      {:error, "No tasks found"}
    else
      {:ok, tasks}
    end
  end

  def get_task(id) do
    case Repo.get(TaskSchema, id) do
      nil -> {:error, "Task not found"}
      task -> {:ok, task}
    end
  end

  def update_task(id, params) do
    task = Repo.get(TaskSchema, id)
    |> TaskSchema.changeset(params)
    |> Repo.update()
  end

  def delete_task(id) do
    case Repo.get(TaskSchema, id) do
      nil -> {:error, "Task not found"}
      task -> Repo.delete(task)
    end
  end
end
