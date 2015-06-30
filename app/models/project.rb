class Project < ActiveRecord::Base
  has_many :works
  has_many :users, through: :works 

  #def add_new_dev
  #  @user = @project.users.create(params[:id], params[:name])
  #end

end
