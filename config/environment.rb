# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Hts::Application.initialize!

ENV['RECAPTCHA_PUBLIC_KEY'] = '6LeRKwMAAAAAAPbvPVIrpSmxfN093uRQi0h8_gV-'
ENV['RECAPTCHA_PRIVATE_KEY'] = '6LeRKwMAAAAAAK5RIid5U2Yz5xHJavzcQ2bEwrOe'