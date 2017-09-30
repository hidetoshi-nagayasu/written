class ArticlesController < ApplicationController

  before_action :move_to_index, except: [:index, :show]

  def index
    @articles = Article.includes(:user).where(publish: 1).order('updated_at DESC')
  end

  def search
    @articles = Article.includes(:user).where('title LIKE(?)', "%#{params[:keyword]}%")
  end

  def show
    @article = Article.find(params[:id])
    @comments = @article.comments.includes(:user)
  end

  def new
  end

  def create
    if params[:draft]
      Article.create(
        title: article_params[:title],
        text: article_params[:text],
        thumbnail: thumb_params[:thumbnail],
        user_id: current_user.id,
        publish: false
      )
      return @draft = params[:draft]
    else
      Article.create(
        title: article_params[:title],
        text: article_params[:text],
        thumbnail: thumb_params[:thumbnail],
        user_id: current_user.id,
        publish: true
      )
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    article = Article.find(params[:id])
    if params[:draft]
      article.update(
        title: article_params[:title],
        text: article_params[:text],
        thumbnail: thumb_params[:thumbnail],
        publish: false
      )
      return @draft = params[:draft]
    else
      article.update(
        title: article_params[:title],
        text: article_params[:text],
        thumbnail: thumb_params[:thumbnail],
        publish: true
      )
    end
  end

  def search
    @articles = Article.where('title LIKE(?)', "%#{params[:keyword]}%")
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy if article.user_id == current_user.id
  end

  private
  def article_params
    params.permit(:title, :text)
  end

  def thumb_params
    if params[:article] != nil
      params.require(:article).permit(:thumbnail)
    else
      params.permit(:thumbnail)
    end
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
