class ApplicationController < ActionController::Base
  include Authentication

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from FbGraph::Exception, :with => :fb_graph_exception

  def fb_graph_exception(e)
    flash[:error] = {
        :title   => e.class,
        :message => e.message
    }
    redirect_to root_url
  end

end
