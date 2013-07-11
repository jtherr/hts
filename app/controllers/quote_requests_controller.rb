class QuoteRequestsController < ApplicationController
  before_filter :login_required, :only => [ :index, :desroy ]

  def new
    @quote_request = QuoteRequest.new
    @title = "Request Quote"
  end
  
  def create
    @quote_request = QuoteRequest.new(quote_request_params)
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
  
  private
    def quote_request_params
      params.require(:quote_request).permit(:name, :company, :phone, :email, :fax, :street, :city, :state, :zip, :additional)
    end
end