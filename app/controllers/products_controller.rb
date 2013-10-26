class ProductsController < ApplicationController
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to categories_path
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(params[:product].permit(:name, :description, :price, :category_id))
      redirect_to @product
    else
      render 'edit'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def index
    @product = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params[:product].permit(:name, :description, :price, :category_id))

    if @product.save
      redirect_to @product
    else
      render 'new'
    end
  end

  def show
    @product = Product.find(params[:id])
  end
end
