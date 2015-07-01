class WorkController < ApplicationController
  def create_new_dev
    @work = Work.new(user_id => @user.id, project_id => @project.id, role=> 'dev');
  end

  def create_new_proj_man
    @work = Work.new(user_id => @user.id, project_id => @project.id, role=> 'manager')
  end
end
