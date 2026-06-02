class ProcessMentionsJob < ApplicationJob
  queue_as :default

  def perform(comment)
    usernames = MentionsExtractor.call(comment.body)
    return if usernames.empty?

    mentioned_users = User.where(username: usernames).where.not(id: comment.user_id)

    mentioned_users.find_each do |user|
      Notification.create!(
        recipient: user,
        actor: comment.user,
        notifiable: comment,
        action: "mentioned"
      )
    end
  end
end
