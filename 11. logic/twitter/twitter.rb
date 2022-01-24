# frozen_string_literal: true
require_relative 'user'
require_relative 'tweet'


class Twitter
  def initialize
    @next_twid = 0
    @users = {}
    @tweets = {}
  end

  def add_user(username)
    @users[username] = User.new(username)
  end

  def rm_user(username)
    user = @users[username]
    user.inbox.my_tweets.each { |tw| tw.mark_as_deleted }
    user.reject_all
    user.unfollow_all
    @users.delete(username)
  end

  def user(username)
    @users[username]
  end

  def tweet(username, msg)
    raise 'Unexpected username' unless @users.key?(username)

    tweet = create_tweet(username, msg)
    @users[username].tweet(tweet)
  end

  def retweet(username, twid, msg)
    user = @users[username]
    og_tweet = user.get_tweet(twid)
    new_tweet = create_tweet(user.name, msg)
    new_tweet.retweet_from(og_tweet)
    user.tweet(new_tweet)
  end

  def to_s
    str = ''
    @users.each_value { |u| str += u }
    str
  end

private
  def create_tweet(sender, msg)
    @next_twid += 1
    Tweet.new(@next_twid - 1, sender, msg)
  end
end
