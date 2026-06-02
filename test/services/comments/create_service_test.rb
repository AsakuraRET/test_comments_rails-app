require "test_helper"

class Comments::CreateServiceTest < ActiveSupport::TestCase
  include ActiveJob::TestHelper

  setup do
    @user = users(:one)
  end

  test "successfully creates a comment and enqueues mention processing" do
    params = { body: "Hello @bob, check this out!" }
    service = Comments::CreateService.new(@user, params)

    assert_difference "Comment.count", 1 do
      assert_enqueued_with(job: ProcessMentionsJob) do
        assert service.call
      end
    end

    assert_equal "Hello @bob, check this out!", service.comment.body
  end

  test "fails to create a comment with invalid params" do
    params = { body: "" }
    service = Comments::CreateService.new(@user, params)

    assert_no_difference "Comment.count" do
      assert_no_enqueued_jobs do
        refute service.call
      end
    end
  end
end
