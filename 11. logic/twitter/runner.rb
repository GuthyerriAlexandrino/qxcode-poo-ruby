require_relative 'twitter'

twitter = Twitter.new

loop do
  print '$'
  line = gets.chomp.split(' ')
  cmd = line[0]
  op = line[1..]

  case cmd
  when 'add'
    twitter.add_user(op[0])
  when 'follow'
    twitter.user(op[0]).follow(twitter.user(op[1]))
  when 'unfollow'
    twitter.user(op[0]).unfollow(twitter.user(op[1]))
  when 'tweet'
    twitter.tweet(op[0], op[1..].join)
  when 'retweet'
    twitter.retweet(op[0], op[1], op[2..].join)
  when 'like'
    twitter.user(op[0]).like(op[2])
  when 'unf_all'
    twitter.user(op[0]).unfollow_all
  when 'rej_all'
    twitter.user(op[0]).reject_all
  when 'delete'
    twitter.user(op[0]).get_tweet(op[1]).mark_as_deleted
  when 'show'
    print twitter
  when 'timeline'
    print twitter.user(op[0]).inbox
  when 'user'
    print twitter.user(op[0])
  when '\\0'
    break
  end
end
