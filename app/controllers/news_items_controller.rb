class NewsItemsController < ApplicationController
  before_filter :login_required, :only => [ :create, :new, :edit, :update, :delete ]
  
  def new
    @news_item = NewsItem.new()
    render :partial => 'form'
  end
  
  def create
    @news_item = NewsItem.new(params[:news_item])
    @news_item.save

    @news_items = NewsItem.find(:all)
    render 'createUpdate'
  end
  
  def edit
    @news_item = NewsItem.find(params[:id])
    render :partial => 'form'
  end
  
  def update
    @news_item = NewsItem.find(params[:id])
    @news_item.update_attributes(params[:news_item])

    @news_items = NewsItem.find(:all)
    render 'createUpdate'
  end
  
  def destroy
    NewsItem.find(params[:id]).destroy
    @news_items = NewsItem.find(:all)
    render :partial => 'results'
  end
  
end