class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def show
    @task = Task.find(params[:id])
  end

  def create
    # permitted = restaurant_params
    @task = Task.create(task_params) # We pass a hash with the attributes and values
    # @restaurant.save
    redirect_to task_path(@task)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to task_path, notice: 'Task was successfully deleted.'
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
