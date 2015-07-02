class UsersController < ApplicationController
	def show
		if current_user
			@projectlist = Project.where(user_id: current_user.id)
			@tasklist = Task.where(user_id: current_user.id)
		else
			#puts "please log in."
			redirect_to new_user_session_path, notice: 'You are not logged in.'
		end
	end
end
