defmodule BackendWeb.TaskController do
  use BackendWeb, :controller
  alias Backend.Task

  def getAllTasks(conn, _params) do
    case Task.get_all_tasks() do
      {:ok, tasks} ->
        json(conn, %{message: "List of tasks", data: tasks, status: "success"})

      {:error, message} ->
        json(conn, %{message: message, status: "error"})
    end
  end

  def getTask(conn, params) do
    task_id = params["id"]

    case Task.get_task(task_id) do
      {:ok, task} ->
        json(conn, %{message: "Task found", data: task, status: "success"})

      {:error, message} ->
        json(conn, %{message: message, status: "error"})
    end
  end

  def createTask(conn, %{"task" => task_params}) when not is_nil(task_params) do

    case Task.create_task(task_params) do
      {:ok, task} ->
        json(conn, %{message: "Task created", data: task, status: "success"})

      {:error, changeset} ->
        json(conn, %{message: "Error creating task", data: changeset.errors, status: "error"})
    end
  end

  def deleteTask(conn, %{"id" => id}) do
    case Task.delete_task(id) do
      {:ok, _task} ->
        json(conn, %{message: "Task deleted", status: "success"})

      {:error, message} ->
        json(conn, %{message: message, status: "error"})
    end

  end
end
