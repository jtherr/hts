class CategoriesController < ApplicationController  
  before_filter :login_required, :only => [ :index, :create, :new, :edit, :update, :delete, :reorderCategories ]
  
  def categoryList
    @categories = Category.all
    @title = "Products"
  end
  
  def index
    @categories = Category.all
    @title = "Categories"
  end
  
  def updateOrder    
    params[:categories].each_with_index do |id, position|
      Category.update(id, :position => position)
    end
    render :nothing => true
  end
    
  def new
    @category = Category.new()
    render :partial => 'form'
  end
  
  def create
    @category = Category.new(category_params)
    @category.save
    @categories = Category.all
    render 'createUpdate'
  end
  
  def edit
    @category = Category.find(params[:id])    
    render :partial => 'form'
  end
  
  def update
    @category = Category.find(params[:id])
    @category.update_attributes(category_params)
    @categories = Category.all
    render 'createUpdate'
  end
  
  def destroy
    Product.destroy_all "category_id = #{params[:id]}"
    Category.find(params[:id]).destroy
    
    @categories = Category.all
    render :partial => 'results'
  end
  
  private
    def category_params
      params.require(:category).permit(:name, :position)
    end
  
end
