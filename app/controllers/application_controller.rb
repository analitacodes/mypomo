class ApplicationController < ActionController::Base
  include Authentication
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  allow_unauthenticated_access if: -> {
    self.class.name == "ApplicationController" &&
    %w[index show].include?(action_name)
  }
  
end
