Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, "633173872149-0sv24nf99elepp8sqpgeev0ugnfraho6.apps.googleusercontent.com",
           "o_5YiEnKrmrAEyq9hwz_lo3a"
end
