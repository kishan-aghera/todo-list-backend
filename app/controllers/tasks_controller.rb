class TasksController < ApplicationController
  before_action :set_task, only: [:show, :destroy, :update]
  
  def index
    render json: Task.all
  end

  def show
    render json: @task
  end

  def create
    @task = Task.create(task_params)
    render json: @task
  end

  def update
    if @task.update(task_params)
      render json: @task, status: 200
    else
      render json: { error: @task.errors }, status: 422
    end
  end

  def destroy
    @task.destroy
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name)
  end
end
