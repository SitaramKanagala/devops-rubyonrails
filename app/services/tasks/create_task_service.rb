
module Tasks
    class CreateTaskService
      def initialize(task_params)
        @task_params = task_params
      end
  
      def call
        Task.create!(@task_params)
      end
    end
  end
  