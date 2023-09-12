# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :find_article, only: %i[show edit update destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :article_not_found

  def index
    @articles = Article.published.page(params[:page]).per(25)
  end

  def show; end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end

  def article_not_found
    redirect_to articles_path, alert: "Article not found"
  end

  def article_params
    params.require(:article).permit(:title, :body, :status)
  end
end
