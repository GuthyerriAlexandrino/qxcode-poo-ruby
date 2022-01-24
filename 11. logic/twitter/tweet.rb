# frozen_string_literal: true
require 'set'

class Tweet
  attr_reader :likes, :id, :sender, :msg

  def initialize(id, username, msg)
    @id = id
    @sender = username
    @msg = msg
    @likes = Set.new
    @rt = nil
    @deleted = false
  end

  def like(username)
    @likes << username
  end

  def retweet_from(tweet)
    @rt = tweet
  end

  def mark_as_deleted
    @deleted = true
  end

  def deleted?
    @deleted
  end

  def to_s
    return "#{@id}:#{@sender} (this tweet was deleted)" if deleted?

    str = "#{@id}:#{@sender} (#{@msg})"
    str += "\n  #{@rt}" unless @rt.nil?
    str += " [#{@likes.to_a.reverse.join(', ')}]" unless @likes.empty?
    str
  end

  alias to_str to_s
end
