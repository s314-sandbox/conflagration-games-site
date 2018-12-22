class ArticlesController < ApplicationController
  before_action :authenticate_user!

  def index
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
  end

  def update
  end

  def destroy
  end

  def show
    @article = Article.find(params[:id])
  end

  private
  def article_params
    taken = params.require(:article).permit(:title, :contents, :category, :author)
    taken[:category] = Category.find(taken[:category])
    taken[:author] = User.find(taken[:author])
    taken
  end
end
