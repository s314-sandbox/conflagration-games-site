class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category was successfully created"
      redirect_to category_path(@category)
    else
      render 'new'
    end
  end

  def update
  end

  def edit
  end

  def show
    @category = Category.find(params[:id])
  end

  def destroy
  end

  private
  def category_params
    params.require(:category).permit(:title, :game)
  end
end
