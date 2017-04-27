Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_APP_KEY'], ENV['FACEBOOK_APP_SECRET'],
  	scope: 'user_birthday', info_fields: 'first_name,last_name,email,birthday', display: 'popup'
end