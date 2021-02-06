require 'net/http'

class QuoteRequestsController < ApplicationController

  def index
    redirect_to :action => 'new'
  end

  def new
    @quote_request = QuoteRequest.new
    @title = "Contact"
  end
  
  def create
    @quote_request = QuoteRequest.new(quote_request_params)
    @quote_request.date = DateTime.now

    # if hts is not blank, it is likely a robot, so don't save
    if validate_captcha(params['g-recaptcha-response']) && @quote_request.valid?
      QuoteMailer.quote_request_email(@quote_request).deliver
      @title = "Request Submitted"    
    
      redirect_to root_url, :notice => "Thank You - We will contact you shortly"
    else
      @title = "Contact"
      render 'new'
    end
  end
  
  private

  def quote_request_params
    params.require(:quote_request).permit(:name, :company, :phone, :email, :fax, :street, :city, :state, :zip, :additional)
  end

  def validate_captcha(g_recaptcha_response)
    api_response = Net::HTTP.post('www.google.com', '/recaptcha/api/siteverify', 443, body: {
                     secret: RECAPTCHA_PRIV_KEY,
                     response: recaptcha_response
                   })

    api_response.body['success']
  end
end