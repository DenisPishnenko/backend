class MembersController < ApplicationController
    before_action :authenticate_user!
  
    def show
      render json: current_user.to_json(include: :news)
    end
end