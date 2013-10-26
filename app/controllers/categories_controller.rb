class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params[:category].permit(:name))

    if @category.save
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])

    if @category.update(params[:category].permit(:name))
      redirect_to @category
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    redirect_to categories_path
  end

  def show
    @categories = Category.all
    @category = Category.find(params[:id])
    @products = Product.all
    @products_cat = Product.select { |p|  p.category_id == @category.id }
  end
end
