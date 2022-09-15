class NewsController < ApplicationController

  # GET /news
  def index
    @news = News.all

    render json: @news.to_json(include: :user)
  end

  # POST /news
  def create
    @news = News.new(news_params)

    if @news.save
      render json: @news, status: :created, location: @news
    else
      render json: @news.errors, status: :unprocessable_entity
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def news_params
      params.require(:news).permit(:title, :content, :authorId, :image, :tag)
    end
end
