module Api
  class TasksController < ApiController

    load_and_authorize_resource

    def index
    end

    def show
    end

    def create
    end

    def update
    end

    def destroy
      @task.destroy
      render :show
    end

    def reset
      @task.reset
      render :show
    end

    def complete
      @task.complete
      render :show
    end

  end
end
