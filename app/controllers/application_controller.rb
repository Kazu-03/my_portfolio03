class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource) 
    root_path
  end

  def slack_notification channel, text
    return if Rails.env.development?

    Slack.chat_postMessage(
      channel: channel, text: text
    )
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :image ])
  end
end
