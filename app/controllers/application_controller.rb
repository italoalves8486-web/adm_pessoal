class ApplicationController < ActionController::Base
  allow_browser versions: :modern
  stale_when_importmap_changes

  # 🔒 OBRIGA LOGIN EM TODO O SITE
  before_action :authenticate_user!

  # 🎨 Layout automático
  layout :layout_by_resource

  private

  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end
end
