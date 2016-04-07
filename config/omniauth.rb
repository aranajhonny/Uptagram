OmniAuth.config.logger = Rails.logger

ENV['FACEBOOK_APP_ID'] = '205859306445566'
ENV['FACEBOOK_SECRET'] = 'e621a627b91ea9a78a8dfbdf2d68f818'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET']
  on_failure = Proc.new { |env|
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure
}
end

