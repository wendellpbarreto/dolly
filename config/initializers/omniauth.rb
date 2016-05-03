OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1142869415758395', 'db73f5bfd53fe22f644b1b27061ac636', {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
end