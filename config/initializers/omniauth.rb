Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :twitter, 'CONSUMER_KEY', 'CONSUMER_SECRET'
  provider :facebook, '198081906950333', '67afe1e0075870faa1efb72fcfe6c123'
end