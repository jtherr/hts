class CategoriesController < ApplicationController  
  before_filter :login_required, :only => [ :index, :create, :new, :edit, :update, :delete, :reorderCategories ]
  
  def categoryList
    @categories = Category.find(:all);
    @title = "Products"
  end
  
  def index
    @categories = Category.find(:all)
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
    @category = Category.new(params[:category])
    @category.save
    @categories = Category.find(:all)
    render 'createUpdate'
  end
  
  def edit
    @category = Category.find(params[:id])    
    render :partial => 'form'
  end
  
  def update
    @category = Category.find(params[:id])
    @category.update_attributes(params[:category])
    @categories = Category.find(:all)
    render 'createUpdate'
  end
  
  def destroy
    Product.destroy_all "category_id = #{params[:id]}"
    Category.find(params[:id]).destroy
    
    @categories = Category.find(:all)
    render :partial => 'results'
  end
  
end
