# app/controllers/notifications_controller.rb
class NotificationsController < ApplicationController
    def index
      @notifications = current_user.notifications.order(created_at: :desc)
    end
  end
  