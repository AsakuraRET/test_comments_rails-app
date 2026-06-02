require "test_helper"

class ProcessMentionsJobTest < ActiveJob::TestCase
  setup do
    @sender = users(:one)
    @recipient = users(:two)
  end

  test "parses mention and creates a notification for the mentioned user" do
    comment = Comment.create!(user: @sender, body: "Hey @#{@recipient.username} take a look")

    assert_difference "Notification.count", 1 do
      ProcessMentionsJob.perform_now(comment)
    end

    notification = Notification.last
    assert_equal @recipient, notification.recipient
    assert_equal @sender, notification.actor
    assert_equal comment, notification.notifiable
  end

  test "does not create notification if no valid users are mentioned" do
    comment = Comment.create!(user: @sender, body: "Just a regular comment with @nonexistent_user")

    assert_no_difference "Notification.count" do
      ProcessMentionsJob.perform_now(comment)
    end
  end
end
