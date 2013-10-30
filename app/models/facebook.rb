class Facebook < ActiveRecord::Base

  class << self
    def config
      GiftLauncher::Application.config
    end

    def auth(redirect_uri = nil)
      FbGraph::Auth.new config.fb_app_id, config.fb_app_secret, :redirect_uri => redirect_uri
    end
  end

end
