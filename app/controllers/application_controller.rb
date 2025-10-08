class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  def L4
    cookies[:c] ||= 0 
    cookies[:c] = cookies[:c].to_i + 1
    render plain: cookies[:c]
  end
  
end
