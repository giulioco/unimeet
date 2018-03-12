# config/development.rb
Rails.application.configure do 
  config.action_cable.url = "ws://localhost:3000/cable"
  #config.action_cable.url = 'ws://unimeetapp-development.ckfbsrxa15vu.us-west-1.rds.amazonaws.com/cable'
  #config.action_cable.allowed_request_origins = ['http://localhost:3001']
end 