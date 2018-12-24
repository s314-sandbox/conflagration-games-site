class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
    @categories = Category.all
  end

  def create
    @categories = Category.all
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def edit
    @categories = Category.all
    @article = Article.find(params[:id])
  end

  def update
    @categories = Category.all
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = 'Article was updated'
      redirect_to article_path(@article)
    else
      flash[:notice] = 'Article was not updated'
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = 'Article was deleted'
    redirect_to articles_path
  end

  def show
    @article = Article.find(params[:id])
    @comments = @article.comments.order(created_at: :desc).first(5)
    @comment = Comment.new
  end

  private

  def article_params
    taken = params.require(:article).permit(:title, :contents, :description, :category, :author)
    taken[:category] = Category.find(taken[:category])
    taken[:author] = User.find(taken[:author])
    taken
  end
end
