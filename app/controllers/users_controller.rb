class UsersController < ApplicationController
  before_action :move_to_index, except: [:show]

  def show
    user = User.find(params[:id])
    @user_name = user.user_name
    @articles  = user.articles.order("updated_at DESC")
  end

  def drafts
    @user_name = current_user.user_name
    @articles  = current_user.articles.where(publish: 0).order("updated_at DESC")
  end

  def move_to_index
    redirect_to controller: :articles, action: :index unless user_signed_in?
  end
end
