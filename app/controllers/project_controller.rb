class ProjectController < ApplicationController
	def new
		@project = Project.new
	end
	
	def index
		@project = Project.all
	end

	def show
		@project = Project.find(params[:id])
		@user = User.all
		@tasks = Task.where(sprints: @project.current_sprint, project_id: params[:id])

		@options = (0..5)
	end

	def update
		@project = Project.find(params[:id])
		@tasks = Task.where(project_id: params[:id], sprints: @project.current_sprint).where.not(status: 2)
		@project.update(:current_sprint => @project.current_sprint+1)
		@tasks.each do |t|
			t.sprints = t.sprints + 1
		end
		redirect_to project_path
	end

	def create
		@project = Project.new(params.require(:project).permit(:title, :text))
		@project.current_sprint = 0
		@project.save
		redirect_to project_index_path
  	end


end
