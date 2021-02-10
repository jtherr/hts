require 'net/http'
require 'json'

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
    api_response = Net::HTTP.post_form(URI('https://www.google.com/recaptcha/api/siteverify'),
                     secret: RECAPTCHA_PRIV_KEY,
                     response: g_recaptcha_response
                   )

    api_response_hash = JSON.parse(api_response)

    logger.info "Validate Captcha Response: #{api_response_hash}"

    success = api_response_hash['success']
    score = api_response_hash['score']

    valid = success && score.to_f > 0.5

    logger.warn "Rejecting quote request due to low recaptcha score" unless valid

    valid    
  end
end