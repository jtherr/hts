class ProductsController < ApplicationController
  before_filter :login_required, :only => [ :create, :new, :edit, :update, :delete, :premierProductOrder ]
  
  def index
    @category = Category.find(params[:category_id])
    @products = @category.products.sorted
    @categories = Category.all
    @title = "Products"
  end
  
  def search
    if (params[:main])
      @search = '%' + params[:main][:search] + '%'
    end
    
    @products = Product.sorted.search(@search)
    @categories = Category.all
    @title = "Products"
    render :index
  end

  def new
    @categories = Category.all
    @product = Product.new()
    render :partial => 'form'
  end

  def create
    @product = Product.new(product_params)
    @product.save
    @products = @product.category.products.sorted
    render 'createUpdate'
  end
  
  def edit
    @product = Product.find(params[:id])
    @categories = Category.all
    render :partial => 'form'
  end
  
  def update
    @product = Product.find(params[:id])
    @product.update_attributes(product_params)
    @products = @product.category.products.sorted
    render 'createUpdate'
  end
  
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    
    @products = @product.category.products.sorted
    render :partial => 'results'
  end
  
  def updateOrder
    params[:premiers].each_with_index do |id, position|
      Product.update(id, :position => position)
    end
    render :nothing => true
  end
  
  private
    def product_params
      params.require(:product).permit(:category, :company, :name, :premier, :position)
    end
end
