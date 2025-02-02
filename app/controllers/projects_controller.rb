class ProjectsController < ApplicationController
    before_action :logged_in_user, only: [:new]

    def new
        Project.create(experience_id: params[:id], profile_id: current_user.profile.id)
        flash[:success] = "Project added."
        redirect_to edit_url
    end

end
