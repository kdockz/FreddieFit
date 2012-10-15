class HomeController < ApplicationController
  def index
  	if !current_user.nil?
  		@registrations = Registration.where(:user_id => current_user.id)
  		@foods = UserFood.where(:user_id => current_user.id)
  		@favorites = FavoriteFood.where(:user_id => current_user.id)
  	end
  end
end
