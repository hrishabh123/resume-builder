class HomeController < ApplicationController

  def index
    logged_in_user
    @user = current_user
  end

  def edit
    logged_in_user
    if current_user
        @profile = current_user.profile
        # @education = Education.find_by(profile_id: @profile.id)
        # @experience = Experience.find_by(profile_id: @profile.id)
    end
  end

end
