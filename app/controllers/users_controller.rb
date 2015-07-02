class UsersController < ApplicationController
	def show

		@projectlist = Project.where(user_id: 2)
		@tasklist = Task.where(user_id: 2)
	end
end
