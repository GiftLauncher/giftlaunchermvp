class WelcomeController < ApplicationController
  before_filter :do_authentication, :only => :show

  rescue_from Rack::OAuth2::Client::Error, :with => :oauth2_error

  def index
  end

  def show
    @fb_user = current_user.facebook
  end


  private

  def do_authentication
    auth = Facebook.auth.from_cookie(cookies)
    fb_user = auth.user.fetch
    fb = Facebook.identify(fb_user)

    if fb.persisted?
      user = fb.user
    else
      user = User.create!(:email => fb_user.email, :first_name => fb_user.first_name, :last_name => fb_user.last_name, :facebook => fb)
    end

    authenticate(user)
  end

  def oauth2_error(e)
    flash[:error] = {
        :title => e.response[:error][:type],
        :message => e.response[:error][:message]
    }
    redirect_to root_url
  end
end
