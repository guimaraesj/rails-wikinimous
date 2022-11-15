class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
    # the set_article method is run in the before_action.
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params) # can't be like this. # Will raise ActiveModel::ForbiddenAttributesError
    @article.save
    redirect_to article_path(@article) # Just redirect. No need for app/views/articles/create.html.erb
  end

  def edit
    # the set_article method is run in the before_action.
  end

  def update
    # the set_article method is run in the before_action.
    @article.update(article_params)
    redirect_to article_path(@article) # Just redirect. No need for app/views/articles/update.html.erb
  end

  def destroy
    # the set_article method is run in the before_action.
    @article.destroy
    redirect_to articles_path, status: :see_other
  end

  private

  # to avoid ForbiddenAttributesError
  def article_params
    params.require(:article).permit(:title, :content)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
