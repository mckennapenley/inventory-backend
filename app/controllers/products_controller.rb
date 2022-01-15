class ProductsController < ApplicationController
  def index
    @products = tag ? tag.products : Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params.require(:product).permit(:title, :quantity))

    if tag_params
      @product.add_tags(tag_params)
    end

    if @product.save
      redirect_to root_url
    else
      render :new
    end
  end

  def show
    product
  end

  def edit
    product
  end

  def update
    product

    update_tags

    if @product.update(params.require(:product).permit(:title, :quantity))
      redirect_to root_url
    else
      render :edit
    end
  end

  def destroy
    product
    product.destroy

    redirect_to root_url
  end

  private

  def product
    @product = Product.find(params[:id])
  end

  def tag
    @tag ||= Tag.find_by(category: params[:tag])
  end

  def tag_params
    params["product"]["tags"]
  end

  def update_tags
    Product.transaction do
      @product.tags.destroy_all

      if tag_params
        @product.add_tags(tag_params)
      end
    end
  end
end
