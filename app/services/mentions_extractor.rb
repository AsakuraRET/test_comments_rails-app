class MentionsExtractor
  MENTION_REGEX = /(?<=^|\s)@([a-zA-Z0-9_]+)/

  def self.call(text)
    return [] if text.blank?

    text.scan(MENTION_REGEX).flatten.uniq
  end
end
