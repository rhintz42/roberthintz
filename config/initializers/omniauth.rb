Rails.application.config.middleware.use OmniAuth::Builder do
  provider :fitbit, 'c779b5f5007c4365bd596b07de83f844', '4bc7236e191c4ea6a22baa34f8388e66'
end