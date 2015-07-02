class SprintController < ApplicationController
	def index
		@project = Project.find(params[:project_id])
		@tasks = Task.where(sprints: @project.current_sprint, project_id: params[:project_id])
	end
end
