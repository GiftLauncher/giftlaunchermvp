module GiftLauncher
  class Application
    FB_CREDENTIALS = YAML.load_file("#{Rails.root}/config/facebook.yml")[Rails.env].symbolize_keys

    config.fb_app_id = FB_CREDENTIALS[:app_id]
    config.fb_app_secret = FB_CREDENTIALS[:app_secret]
    config.fb_scope = FB_CREDENTIALS[:scope]
  end
end
