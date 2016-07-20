class UsersController < ApplicationController
	def show
		redirect_to(:games)
	end
end