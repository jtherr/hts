class MainController < ApplicationController      
  def index
    @products = Product.premier
    @news_items = NewsItem.find(:all)
    @title = "Welcome"
  end
  
  def contactUs
    @title = "Contact Us"
  end
  
  def companyProfile
    @title = "Company Profile"
    @categories = Category.find(:all, :order => 'position');
  end
  
end