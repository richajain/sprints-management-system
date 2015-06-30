class ProjectController < ApplicationController
	def new
		@project = Project.new
	end
	
	def index
		@project = Project.all
	end

	def show
		@project = Project.find(params[:id])
	end

	def create
		@project = Project.new(params.require(:project).permit(:title, :text, :manager => @user.id, :user_id => @user.id))
		if  @project.save
		  redirect_to @project
	  else
      render 'new'
    end
  end


end
