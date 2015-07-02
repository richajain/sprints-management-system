class ProjectController < ApplicationController
	def new
		@project = Project.new
	end
	
	def index
		@project = Project.all
	end

	def show
<<<<<<< HEAD
		if current_user && current_user.id == Project.find(params[:id]).user_id
			@project = Project.find(params[:id])
			@user = User.all
			@tasks = Task.where(sprints: @project.current_sprint, project_id: params[:id])
			@options = (0..20)
			@task = Task.new
		elsif current_user && current_user.id != Project.find(params[:id]).user_id
			redirect_to user_path(current_user.id)
		else
			redirect_to new_user_session_path, notice: 'You are not logged in.'	
		end
	end

	public
	def next_sprint
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
		@project.user_id = current_user.id
		#@project.manager = current_user.id
		@project.save
		redirect_to project_path(@project.id)
  	end


end
