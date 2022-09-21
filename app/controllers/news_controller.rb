class NewsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :get_user, except: :index

  def index
    @news = News.all

    render json: @news.to_json(include: :user)
  end

  def create
    @news = @user.news.build(news_params)
    if @news.save
      render json: @news, status: :created, location: @news
    else
      render json: @news.errors, status: :unprocessable_entity
    end
  end

  private
    def get_user
      @user = User.find(params[:user_id])
    end  
    def news_params
      params.permit(:title, :content, :user_id, :image, :tag)
    end
end
