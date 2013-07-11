class NewsItemsController < ApplicationController
  before_filter :login_required, :only => [ :create, :new, :edit, :update, :delete ]
  
  def new
    @news_item = NewsItem.new()
    render :partial => 'form'
  end
  
  def create
    @news_item = NewsItem.new(news_item_params)
    @news_item.save

    @news_items = NewsItem.all
    render 'createUpdate'
  end
  
  def edit
    @news_item = NewsItem.find(params[:id])
    render :partial => 'form'
  end
  
  def update
    @news_item = NewsItem.find(params[:id])
    @news_item.update_attributes(news_item_params)

    @news_items = NewsItem.all
    render 'createUpdate'
  end
  
  def destroy
    NewsItem.find(params[:id]).destroy
    @news_items = NewsItem.all
    render :partial => 'results'
  end
  
  private
    def news_item_params
      params.require(:news_item).permit(:date, :description)
    end
  
end