FreddieFit::Application.config.action_mailer.perform_deliveries = true
FreddieFit::Application.config.action_mailer.raise_delivery_errors = true
FreddieFit::Application.config.action_mailer.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 25,
  :domain               => "",
  :user_name            => "k.dockz",
  :password             => "Fragwars#32goo",
  :authentication       => :login,
  :enable_starttls_auto => true
}