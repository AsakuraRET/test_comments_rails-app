module Comments
  class CreateService
    attr_reader :comment

    def initialize(user, params)
      @user = user
      @params = params
      @comment = @user.comments.build(params)
    end

    def call
      if @comment.save
        ProcessMentionsJob.perform_later(@comment)
        true
      else
        false
      end
    end
  end
end
