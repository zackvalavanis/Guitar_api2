Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://localhost:5173'  # This is your React frontend's address

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      credentials: true # Allow sending cookies and authentication headers
  end
end
