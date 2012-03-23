class QuoteRequestsController < ApplicationController
  before_filter :login_required, :only => [ :index, :desroy ]
    
  def index
    @quote_requests = QuoteRequest.find(:all)
    @title = "Quote Requests";
  end
  
  def new
    @quote_request = QuoteRequest.new
    @title = "Request Quote"
  end
  
  def create
    @quote_request = QuoteRequest.new(params[:quote_request])
    @quote_request.date = DateTime.now

    # if leave_blank is not blank, it is likely a robot, so don't save
    if params[:leave_blank] == "" && @quote_request.save
      QuoteMailer.quote_request_email(@quote_request).deliver
      @title = "Request Submitted"    
    
      if logged_in?
        redirect_to :action => 'index'
      else
        redirect_to root_url, :notice => "Thank You - We will contact you shortly"
      end
    else
      @title = "Request Quote"
      render :action => 'new'
    end
  end
  
  def destroy
    QuoteRequest.find(params[:id]).destroy
    @quote_requests = QuoteRequest.find(:all)
    render :partial => 'results'
  end
  
end