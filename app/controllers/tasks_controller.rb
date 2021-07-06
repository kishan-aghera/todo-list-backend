class TasksController < ApplicationController
  include CurrentUserConcern
  before_action :set_task, only: [:show, :destroy, :update]
  
  def index
    tasks = Task.where("user_id = ?", params[:user_id])
    if tasks.length > 0
      # render json: {
      #   data: ActiveModelSerializers::SerializableResource.new(tasks, each_serializer: TasksSerializer),
      #   message: ['Tasks list fetched successfully'],
      #   status: 200,
      #   type: 'Success'
      # }
      render json: tasks
    else
      render json: {
        # data: ActiveModelSerializers::SerializableResource.new(tasks, each_serializer: TasksSerializer),
        message: 'No tasks found',
        status: 404,
        type: 'Error'
      }
    end
  end

  def show
    # render json: {
    #   data: ActiveModelSerializers::SerializableResource.new(@task, serializer: TasksSerializer),
    #   message: ['Task fetched successfully'],
    #   status: 200,
    #   type: 'Success'
    # }
    render json: @task
  end

  def create
    @task = Task.create(name: params[:name], user_id: params[:user_id])
    if @task.save
      render json: @task
    else
      render json: {
        message: "Task creation failed",
        type: "error",
        status: 422
      }
    end
    
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
    head 204
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.permit(:id, :name, :user_id)
  end
end
