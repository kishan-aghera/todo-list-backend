module V1  
  class TasksController < ApplicationController
    before_action :set_task, only: [:show, :destroy, :update]
    
    def index
      # render json: Task.all
      tasks = Task.all
      render json: {
        data: ActiveModelSerializers::SerializableResource.new(tasks, each_serializer: TasksSerializer),
        message: ['Tasks list fetched successfully'],
        status: 200,
        type: 'Success'
      }
    end
  
    def show
      # render json: @task
      render json: {
        data: ActiveModelSerializers::SerializableResource.new(@task, serializer: TasksSerializer),
        message: ['Task fetched successfully'],
        status: 200,
        type: 'Success'
      }
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
      head 204
    end
  
    private
  
    def set_task
      @task = Task.find(params[:id])
    end
  
    def task_params
      params.require(:task).permit(:name)
    end
  end
end
