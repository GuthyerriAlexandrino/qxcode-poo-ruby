# frozen_string_literal: true
require_relative 'tweet'

class Inbox

  def initialize
    @timeline = {}
    @my_tweets = {}
  end

  def send_to_timeline(tweet)
    @timeline[tweet.id] = tweet
  end

  def tweet(twid)
    @timeline[twid]
  end

  def timeline
    @timeline.values
  end

  def my_tweets
    @my_tweets.values
  end

  def remove_messages_from(username)
    @timeline.delete_if { |_k, v| v.sender == username}
  end

  def send_to_my_tweets(tweet)
    @timeline.delete(tweet)
    @my_tweets[tweet.id] = tweet
  end

  def to_s
    str = ''
    @timeline.values.reverse.each { |v| str += "#{v}\n" }
    str
  end
end
