class ArticlesController < ApplicationController

  before_action do
    if @current_user.blank?
      redirect_to login_path
    end
  end


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
    @article.user = @current_user
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
    unless @article.user == @current_user
      redirect_to root_path, notice: "BAD USER!"
    end
  end

  def update
    @article = Article.find_by id: params[:id]
    unless @article.user == @current_user
      redirect_to root_path, notice: "BAD USER!"
    end
    
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
