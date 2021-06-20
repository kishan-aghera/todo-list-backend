module V1  
  class TasksController < ApplicationController
    before_action :set_task, only: [:show, :destroy, :update]
    
    def index
      # render json: Task.all
      tasks = Task.all
      if tasks.length > 0
        render json: {
          data: ActiveModelSerializers::SerializableResource.new(tasks, each_serializer: TasksSerializer),
          message: ['Tasks list fetched successfully'],
          status: 200,
          type: 'Success'
        }
      else
        render json: {
          # data: ActiveModelSerializers::SerializableResource.new(tasks, each_serializer: TasksSerializer),
          error: ['No tasks found'],
          status: 404,
          type: 'Error'
        }
      end
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
        # render json: @task, status: 200
        render json: {
          data: ActiveModelSerializers::SerializableResource.new(@task, serializer: TasksSerializer),
          message: ['Task updated successfully'],
          status: 200,
          type: 'Success'
        }
      else
        # render json: { error: @task.errors }, status: 422
        render json: {
          # data: ActiveModelSerializers::SerializableResource.new(tasks, each_serializer: TasksSerializer),
          error: [@task.errors], #'Task updating failed'
          status: 422,
          type: 'Error'
        }
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
      params.permit(:id, :name) # For Postman, use this line. It will also work for frontend, but a warning will come.
      # params.require(:task).permit(:id, :name) # For API through frontend apps, use this line
    end
  end
end
