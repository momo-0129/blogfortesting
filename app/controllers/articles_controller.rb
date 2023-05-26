class ArticlesController < ApplicationController
  
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    #@comment = Comment.new
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      flash[:notice] = "Article created successfully"
      redirect_to @article
    else
      render :new, status: :bad_request
    end
  end

  def update  
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "Article updated successfully"
      redirect_to @article
    else
      render :new, status: :bad_request
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to @article
  end


  private

  def article_params
    params.require(:article).permit(:title, :description)
  end


end
