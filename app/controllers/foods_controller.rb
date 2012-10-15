class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def show
    @food = Food.find(params[:id])
    session[:food_id] = @food.id
    @favorite = FavoriteFood.where(:user_id => session[:user_id], :food_id => @food.id).first
    @ef = UserFood.where(:user_id => session[:user_id], :food_id => @food.id).first
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(params[:food])
    if @food.save
      redirect_to @food, :notice => "Successfully created food."
    else
      render :action => 'new'
    end
  end

  def edit
    @food = Food.find(params[:id])
  end

  def update
    @food = Food.find(params[:id])
    if @food.update_attributes(params[:food])
      redirect_to @food, :notice  => "Successfully updated food."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to foods_url, :notice => "Successfully destroyed food."
  end


  def add_favorite
    @ff = FavoriteFood.new
    @ff.food_id = params[:food_id]
    @ff.user_id = session[:user_id]

    if @ff.save
      redirect_to :back, :notice => "Food marked as favorite."
    else
      redirect_to :back, :alert => "Could not add food as favorite."
    end

  end

  def remove_favorite
    @favorite = FavoriteFood.find(params[:favorite_id])

    if @favorite.destroy
      redirect_to Food.find(session[:food_id]), :notice => "You removed this food as a favorite."
    else
      redirect_to Food.find(session[:food_id]), :alert => "Unable to remove food from favorites."
    end

  end

  def mark_as_eaten
    @ef = UserFood.new
    @ef.food_id = params[:food_id]
    @ef.user_id = session[:user_id]

    if @ef.save
      redirect_to :back, :notice => "Marked food as eaten."
    else
      redirect_to :back, :alert => "Could not mark food as eaten."
    end

  end

  def unmark_as_eaten

    puts params[:ef_id]

    @ef = UserFood.find(params[:ef_id])


    if @ef.destroy
      redirect_to Food.find(session[:food_id]), :notice => "You removed this food as a favorite."
    else
      redirect_to Food.find(session[:food_id]), :alert => "Unable to remove food from favorites."
    end
  end

  def new_menu
    @fl = FoodLocation.new
  end

  def create_menu
    @fl = FoodLocation.new(params[:food_location])
    if @fl.save
      redirect_to @fl, :notice => "Successfully created food."
    else
      render :action => 'new_menu'
    end

  end
end
