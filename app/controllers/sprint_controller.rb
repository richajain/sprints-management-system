class SprintController < ApplicationController
	def index
		@project = Project.find(params[:project_id])
		if current_user && @project.user_id == current_user.id
			@tasks = Task.where(sprints: @project.current_sprint, project_id: params[:project_id])
			render 'index'
		elsif current_user && @project.user_id != current_user.id
			redirect_to user_path(current_user.id)
		else
			redirect_to new_user_session_path

		end
	end

	public
	def create
		@project = Project.find(params[:project_id])
		@tasks = Task.where(project_id: params[:project_id], sprints: @project.current_sprint).where.not(status: 2)
		@project.current_sprint = @project.current_sprint+1
		@project.save
		@tasks.each do |t|
			t.sprints = t.sprints + 1
			t.save
		end
		redirect_to project_sprint_index_path
	end

end