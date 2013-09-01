module Api
  class TasksController < ApiController

    load_and_authorize_resource except: [:create]

    def index
    end

    def show
    end

    def create
      @task = current_user.tasks.build(permitted_params)
      @task.save!
      render :show
    end

    def update
      # @task = current_user.tasks.find(params)
      @task.update_attributes! permitted_params
      render :show
    end

    def destroy
      @task.destroy!
      render :show
    end

    def reset
      @task.reset!
      render :show
    end

    def complete
      @task.complete!
      render :show
    end

    def permitted_params
      params.require(:task).permit :description, :priority
    end
  end
end
