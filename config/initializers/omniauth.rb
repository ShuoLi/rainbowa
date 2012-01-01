Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :twitter, 'CONSUMER_KEY', 'CONSUMER_SECRET'
  if Rails.env == 'development'
    provider :facebook, '198081906950333', '67afe1e0075870faa1efb72fcfe6c123'
  else
    if Rails.env == 'production'
      provider :facebook, '352806468068101', '50c352990839be14f0908fe1867b0730'      
    end
  end
end