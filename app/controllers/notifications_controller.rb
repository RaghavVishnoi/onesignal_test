class NotificationsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def create
    Notification.send_notification(params)
  end

end
