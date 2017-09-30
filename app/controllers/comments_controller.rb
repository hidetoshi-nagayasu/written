class CommentsController < ApplicationController
  def create
    @comment = Comment.create(
      text: comment_params[:text],
      article_id: comment_params[:article_id],
      user_id: current_user.id
    )
    redirect_to "/articles/#{@comment.article.id}"  # article詳細ページにリダイレクト
  end

  private
  def comment_params
    params.permit(:text, :article_id)
  end
end
