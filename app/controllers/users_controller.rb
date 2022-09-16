class UsersController < ApplicationController
  before_action :set_user
  # :authenticate_user!, only: %i[ update ]
                
  respond_to :json

  def show
    if @user.nil?
      render json: { message: 'User not found' }, status: :not_found
    else
      render json: @user.to_json(include: :news)
    end  
  end

  def update

    if @user.update(user_params)
      render json: @user, status: :ok
    else 
      render json: @user.errors, status: :unprocessable_entity
    end   
  end

  private
     
    def set_user
      @user = User.find_by(id: params[:id])
    end  
      
    def user_params
      params.require(:user).permit(:name, :image)
    end  
end
