class QuoteMailer < ActionMailer::Base
  default from: "quotes@herrtoolsales.com"
  
  def quote_request_email(quote_request)
    @quote_request = quote_request
    mail(:to => 'jtherr@gmail.com', :subject => "HTS QUOTE REQUEST")
  end
  
end
