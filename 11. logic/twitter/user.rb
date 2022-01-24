# frozen_string_literal: true
require_relative 'inbox'

class User
  attr_accessor :name, :inbox, :followers, :following

  def initialize(username)
    @name = username
    @inbox = Inbox.new
    @followers = {}
    @following = {}
  end

  def follow(other)
    raise 'Variable other must be of type User' unless other.instance_of?(User)
    return unless other != self

    @following[other.name] = other
    other.followers[@name] = self
  end

  def unfollow(other)
    raise 'Variable other must be of type User' unless other.instance_of?(User)

    @inbox.remove_messages_from(other.name)
    @following.delete(other.name)
    other.followers.delete(@name)
  end

  def reject(other)
    raise 'Variable other must be of type User' unless other.instance_of?(User)

    @followers.delete(other.name)
    other.following.delete(@name)
  end

  def like(twid)
    @inbox.timeline[twid].like(@name)
  end

  def tweet(tweet)
    @followers.each_value { |v| v.inbox.send_to_timeline(tweet) }
    @inbox.send_to_timeline(tweet)
    @inbox.send_to_my_tweets(tweet)
  end

  def get_tweet(twid)
    @inbox.timeline[twid]
  end

  def unfollow_all
    @following.each { |_k, v| unfollow(v) }
  end

  def reject_all
    @followers.each { |_k, v| reject(v) }
  end

  def to_s
    str = "#{name}: \nFollowers: ["
    str += "#{@followers.keys.join(', ')}"
    str += "]\nFollowing: ["
    str += "#{@following.keys.join(', ')}"
    str << "]\n"
  end

  alias to_str to_s
end

