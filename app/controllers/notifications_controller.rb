class NotificationsController < AuthenticatedController
  def index
    @notifications = current_user.notifications.includes(:actor, :notifiable).order(created_at: :desc)
  end

  def mark_as_read
    @notification = current_user.notifications.find(params[:id])
    @notification.mark_as_read!

    redirect_back fallback_location: notifications_path, notice: "Marked as read."
  end
end
