class TasksController < ApplicationController
	
    def index
        @tasks = Task.all
    end

    def show
        @task = Task.find(params[:id])
    end
     
    def new
        @task = Task.new
    end

    def edit
        @project = Project.find(params[:project_id])
        @options = ['In Progress', 'Not Started', 'Finished']
        redirect_to @project
    end

    def create
		@project = Project.find(params[:project_id])       
    	@task = @project.tasks.create(task_params)
    	@task.user_id = params[:user][:name]
    	@task.sprints = params[:sprints]
<<<<<<< HEAD
    	#render plain: @task.inspect
        @task.save
        redirect_to @project
=======
    	@task.status = 0
    	@task.save
    	redirect_to @project
>>>>>>> 10872dffb2cb00aad2d9386ec99161c6bfb8b5ca
    end

    def update
        @task = Task.find(params[:id])
        @task.status = params[:task][:status]
        redirect_to @project
    end
    private
    def task_params
      params.require(:task).permit(:text)
    end



end
