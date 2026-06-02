class Comment < ApplicationRecord
  include MeiliSearch::Rails

  belongs_to :user

  validates :body, presence: true, length: { maximum: 1000 }

  meilisearch auto_index: !Rails.env.test?, auto_remove: !Rails.env.test? do
    attribute :body
    attribute :author_username do
      user.username
    end

    searchable_attributes [ :body ]
  end

  private

  def process_mentions
    ProcessMentionsJob.perform_later(self)
  end
end
