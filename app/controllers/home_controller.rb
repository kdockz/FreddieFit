class HomeController < ApplicationController
  def index
  	if !current_user.nil?
  		@registrations = Registration.where(:user_id => current_user.id)
  	end
  end
end
