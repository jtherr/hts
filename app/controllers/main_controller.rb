class MainController < ApplicationController      
  def index
    @products = Product.premier.order('position asc')
    @news_items = NewsItem.all
    @title = "Welcome"
  end
  
  def about
    @title = "About"
    @categories = Category.all
  end

  def brands
    @title = "Brands"
  end

  def contact
    @quote_request = QuoteRequest.new    
    @title = "Contact"
  end
    
end