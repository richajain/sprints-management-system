class TasksController < ApplicationController
	def create
		@project = Project.find(params[:project_id])
    	@task = @project.tasks.create(task_params)
    	@task.save
    	redirect_to project_index_path
    end
    private
    def task_params
      params.require(:task).permit(:text)
    end
end