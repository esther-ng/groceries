class ProductsController < ApplicationController

  def search
    render json: Product.search(params[:query], params[:store])
  end

  def show
    product = Product.find_by(id: params[:id])
    if product
      render json: product
    else
      render status: :not_found, nothing: true
    end
  end

  def index
    products = Product.all

    render json: products
  end

  def create
    product = Product.new(product_params)

    if product.save
      render json: product, status: :created, location: product
    else
      render json: product.errors, status: :unprocessable_entity
    end
  end

  def update
    product = Product.find(params[:id])

    if product.update(category_params)
      head :no_content
    else
      render json: product.errors, status: :unprocessable_entity
    end
  end

  # def destroy
  #   product.destroy
  #
  #   head :no_content
  # end

  private

    # def set_category
    #   @category = Category.find(params[:id])
    # end

    def product_params
      params.require(:product).permit(:name)
    end

end
