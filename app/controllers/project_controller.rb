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
  end

	def create
		@project = Project.new(params.require(:project).permit(:title, :text))
		@project.save
		redirect_to project_index_path
  	end


end
