class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
    if @task.completed == false
      @details = "This task is  not completed yet"
    else
      @details = "This task is completed"
    end
  end

  def new
    @task = Task.new
    # you need to give an empty shell to your form_for!
  end

  def create
    task = Task.create(task_params)
    redirect_to show_path(task)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id])
    task.update(task_params)
    redirect_to task
  end

  def destroy

    # fetch restaurant to destroy from DB
    @task = Task.find(params[:id])

    # destroy record
    @task.destroy

    # redirect to index
    redirect_to tasks_path

  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
