class HomeController < ApplicationController
  def index
  	if !current_user.nil?
  		@registrations = Registration.where(:user_id => current_user.id)
  		@foods = UserFood.where(:user_id => current_user.id)
  		@favorites = FavoriteFood.where(:user_id => current_user.id)
  		@classes = Registration.where(:user_id => current_user.id)
  		@classes.reject!{ |c| Event.find(c.event_id).event_type != 2 }
  	end
  end
end
