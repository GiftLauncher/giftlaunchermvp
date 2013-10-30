class WelcomeController < ApplicationController
  rescue_from Rack::OAuth2::Client::Error, :with => :oauth2_error

  def index
  end

  def show
    auth = Facebook.auth.from_cookie(cookies)
    @fb_user = auth.user
  end

  private

  def oauth2_error(e)
    flash[:error] = {
        :title => e.response[:error][:type],
        :message => e.response[:error][:message]
    }
    redirect_to root_url
  end
end
