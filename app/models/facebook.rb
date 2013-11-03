class Facebook < ActiveRecord::Base
  belongs_to :user

  def profile
    @profile ||= FbGraph::User.me(self.access_token).fetch
  end

  class << self
    def config
      GiftLauncher::Application.config
    end

    def auth(redirect_uri = nil)
      FbGraph::Auth.new(config.fb_app_id, config.fb_app_secret, :redirect_uri => redirect_uri)
    end

    def identify(fb_user)
      fb = find_or_initialize_by(:identifier => fb_user.identifier.try(:to_s))
      access_token = fb_user.access_token.access_token
      fb.access_token = access_token if fb.access_token != access_token
      fb.save! if fb.persisted? && fb.access_token_changed?
      fb
    end
  end

end
