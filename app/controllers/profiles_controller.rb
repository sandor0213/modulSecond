class ProfilesController < ApplicationController
	before_action :authenticate_user!


  def new
  	@profile = Profile.new
  end

  def create
  	@profile = current_user.build_profile(profile_params)
  	if @profile.save
  		redirect_to root_path
  	else
  		render 'new'
  	end
  end


  private
  def profile_params
  	params.require(:profile).permit(:age, :firstname, :lastname, :user_id, :avatar)
  end

end
