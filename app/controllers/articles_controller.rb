class ArticlesController < ApplicationController
  def index
    @articles = Article
                  .order("created_at DESC")
                  .where(published: true)
  end

  def new
    @article = Article.new
    # @article.title = "JWO RULES"
  end

  def create
    @article = Article.new
    @article.title = params[:article][:title]
    @article.body = params[:article][:body]
    @article.published = params[:article][:published]
    if @article.save
      redirect_to articles_path
    else
      render :new
    end
  end

  def show
    # select * from articles where id = params.id
    # @article = Article.find params[:id]
    @article = Article.find_by id: params[:id]
  end

  def edit
    @article = Article.find_by id: params[:id]
  end

  def update
    @article = Article.find_by id: params[:id]
    @article.title = params[:article][:title]
    @article.body = params[:article][:body]
    @article.published = params[:article][:published]
    if @article.save
      redirect_to articles_path
    else
      render :new
    end
  end

  def destroy
    Article.destroy params[:id]
    redirect_to articles_path
  end
end
