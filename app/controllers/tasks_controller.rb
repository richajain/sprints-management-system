class TasksController < ApplicationController
	def create
		@project = Project.find(params[:project_id])
    	@task = @project.tasks.create(task_params)
    	@task.user_id = params[:user][:name]
    	@task.sprints = params[:sprints]
    	@task.save
    	redirect_to @project
    end

    private
    def task_params
      params.require(:task).permit(:text)
    end

    def edit
        @tasks = Project.find(params[:project_id])
        redirect_to 'show'
    end

    def update
        @task = Task.find(params[:id])
        if @task.update(params.require(:task).permit(:text))
            redirect_to @task
        else
            render 'edit'
        end
    end

end
