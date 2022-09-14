class UsersController < ApplicationController
  respond_to :json

  def show
    @user = User.find(params[:id])
    render json: @user.to_json(include: :news)
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      render json: @user, status: :ok
    else 
      render json: { message: 'Something went wrong.' }
    end   
  end

  private
    def user_params
      params.require(:user).permit(:name)
    end  
end
