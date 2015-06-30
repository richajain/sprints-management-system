class Project < ActiveRecord::Base
  has_many :works
  has_many :users, through: :works 

  def new
    @project = Project.new  
  end

  def create
    @project = Project.create(title => )
    if @project.save
      redirect_to @project
    else
      render 'new'
    end
  end

  def edit
    
  end
  
  def manager
    @user = @project.users.includes(:works).where('works.role' => 'manager')
  end
 
  #def add_new_dev
  #  @user = @project.users.create(params[:id], params[:name])
  #end

end
