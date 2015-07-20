class UsersController < ApplicationController

  def new
    @user = User.new
    @countries_select_array = Country.countries_as_select_list
    @languages_select_array = Language.languages_as_select_list
  end

  def create
    user = User.find_by(username: user_params[:username])
    if !user
      @user = User.new(user_params)
      @user.level = Level.find_beginner_language(user_params[:study_language_id])
      if @user.save
        session[:user_id] = @user.id
        flash[:notice] = ["Successfully registered."]
        redirect_to root_path
      else
        flash[:alert] = ["A user with that username or email already exists"]
        redirect_to new_user_path
      end
    else
      flash[:alert] = ["A user with that username already exists."]
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :country_id, :native_language_id,
      :study_language_id, :avatar_url, :points, :level_id, :last_seen_at)
  end

end
