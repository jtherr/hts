class QuoteMailer < ActionMailer::Base
  default from: "noreply@herrtoolsales.com"
  
  def quote_request_email(quote_request)
    @quote_request = quote_request
    mail(:to => ['tom@herrtoolsales.com', 'jtherr@gmail.com', 'peter.herr@gmail.com'], :subject => "HTS MESSAGE")
  end
  
end
