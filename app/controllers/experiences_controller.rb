class ExperiencesController < ApplicationController
    include HomeHelper
    include ProfilesHelper

    before_action :logged_in_user, only: [:new]

    def new
        current_user.profile.experiences.create
        flash[:success] = "Experience added."
        redirect_to edit_url
    end

    private
        def experience_params
            params.require(:experience).permit(:company, :position, :description, :start, :end,
                :projects_attributes => [ :id, :title, :url, :description, :techstack, :_destroy]
            )
        end
end
