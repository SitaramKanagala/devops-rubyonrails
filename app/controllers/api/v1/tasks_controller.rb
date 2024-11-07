# app/controllers/api/v1/tasks_controller.rb
module Api
    module V1
      class TasksController < ApplicationController
        before_action :set_task, only: [:show, :update, :destroy]
  
        # GET /api/v1/tasks
        def index
          tasks = Task.all
          render json: tasks, each_serializer: TaskSerializer
        end
  
        # POST /api/v1/tasks
        def create
          task = Task.new(task_params)
          if task.save
            render json: task, serializer: TaskSerializer, status: :created
          else
            render json: { errors: task.errors.full_messages }, status: :unprocessable_entity
          end
        end
  
        # GET /api/v1/tasks/:id
        def show
          render json: @task, serializer: TaskSerializer
        end
  
        # PATCH/PUT /api/v1/tasks/:id
        def update
          if @task.update(task_params)
            render json: @task, serializer: TaskSerializer
          else
            render json: { errors: @task.errors.full_messages }, status: :unprocessable_entity
          end
        end
  
        # DELETE /api/v1/tasks/:id
        def destroy
          @task.destroy
          head :no_content
        end
  
        private
  
        def set_task
          @task = Task.find_by(id: params[:id])
          render json: { error: 'Task not found' }, status: :not_found unless @task
        end
  
        def task_params
          params.require(:task).permit(:title, :description, :completed)
        end
      end
    end
  end
  