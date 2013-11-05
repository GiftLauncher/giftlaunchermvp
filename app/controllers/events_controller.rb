class EventsController < ApplicationController
  before_filter :require_authentication

  def index
    @fb_user = current_user.facebook
  end

end
