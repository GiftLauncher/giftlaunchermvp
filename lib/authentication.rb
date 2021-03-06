module Authentication

  class Unauthorized < StandardError; end

  def self.included(base)
    base.send(:include, Authentication::HelperMethods)
    base.send(:include, Authentication::ControllerMethods)
  end

  module HelperMethods
    def current_user
      @current_user ||= User.find_by_id(session[:current_user])
    end

    def authenticated?
      !current_user.blank?
    end
  end

  module ControllerMethods
    def require_authentication
      authenticate current_user
    rescue Unauthorized => e
      redirect_to root_path and return false
    end

    def authenticate(user)
      raise Unauthorized unless user
      if !current_user || current_user.id != user.id
        session[:current_user] = user.id
        # reset current_user
        @current_user = nil
      end
    end

    def unauthenticate
      @current_user = session[:current_user] = nil
    end
  end

end