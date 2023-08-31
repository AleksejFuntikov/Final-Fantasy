# frozen_string_literal: true

class CommentsController < ApplicationController

  before_action :find_article, only: [:create, :destroy]

  def create
    @comment = @article.comments.build(comment_params)
    if @comment.save
      redirect_to article_path(@article)
    else
      puts "Rendering turbo stream..."
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace("comment_form", partial: 'comments/form', locals: { comment: @comment }) }
        format.html { render "articles/show" }
      end
    end
  end

  def destroy
    @comment = @article.comments.find(params[:id])
    @comment.destroy

    redirect_to article_path(@article), status: :see_other
  end

  private

  def find_article 
    @article = Article.find(params[:article_id])
  end

  def comment_params
    params.require(:comment).permit(:commenter, :body, :status)
  end
end
