class TasksController < ApplicationController
	
    def index
        @tasks = Task.all
    end

    def show
        @task = Task.find(params[:id])
        @project = Project.find(params[:project_id])
        render plain: @project.inspect
        #@prev_task = Task.where(:project_id => params[:project_id]).where("start_sprint == @project.current_sprint-1 
        #    or (start_sprint < @project.current_spreint-1 and sprints >= @project.current_sprint-1)")
        #@prev_comp = Task.where(:project_id => params[:project_id]).where("start_sprint == @project.current_sprint-1 
        #    or (start_sprint < @project.current_spreint-1 and sprints == @project.current_sprint-1)")
        #@prev_incomp = Task.where(:project_id => params[:project_id]).where("start_sprint == @project.current_sprint-1 
        #    or (start_sprint < @project.current_spreint-1 and sprints > @project.current_sprint-1)")
    end
     
    def new
    	if current_user && current_user.id == Project.find(params[:project_id]).user_id
	        @task = Task.new
	        @project = Project.find(params[:project_id])
	        @user = User.all
	        @options = (@project.current_sprint..@project.current_sprint+20)
	    elsif current_user && current_user.id != Project.find(params[:project_id]).user_id
			redirect_to user_path(current_user.id)
		else
			redirect_to new_user_session_path, notice: 'You are not logged in.'	
		end
    end

    def edit
        @project = Project.find(params[:project_id])
        @options = ['In Progress', 'Not Started', 'Finished']
        redirect_to @project
    end

    def create
		@project = Project.find(params[:project_id])
		#render plain: project.inspect       
    	@task = @project.tasks.create(task_params)
    	@task.user_id = params[:user][:name]
    	@task.sprints = params[:sprints]
        @task.start_sprint = params[:sprints]
        @task.points = params[:task][:points]
    	@task.status = 0
    	#render plain: task.inspect
    	@task.save
    	redirect_to @project
    end

    def update
        @task = Task.find(params[:id])
        @task.status = params[:task][:status]
        @task.save
        redirect_to project_sprint_index_path(:project_id => @task.project_id)
    end
    private
    def task_params
      params.require(:task).permit(:text)
    end



end
