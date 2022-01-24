require_relative 'twitter'

twitter = Twitter.new

loop do
  print '$'
  line = gets.chomp.split(' ')
  cmd = line.first
  op = line[1..-1]

  case cmd
  when 'add'
    twitter.add_user(op.first)
  when 'follow'
    twitter.user(op.first).follow(twitter.user(op[1]))
  when 'unfollow'
    twitter.user(op.first).unfollow(twitter.user(op[1]))
  when 'tweet'
    twitter.tweet(op.first, op[1..].join)
  when 'retweet'
    twitter.retweet(op.first, op[1], op[2..].join)
  when 'like'
    twitter.user(op.first).like(op[2])
  when 'unf_all'
    twitter.user(op.first).unfollow_all
  when 'rej_all'
    twitter.user(op.first).reject_all
  when 'delete'
    twitter.user(op.first).get_tweet(op[1]).mark_as_deleted
  when 'show'
    print twitter
  when 'timeline'
    print twitter.user(op.first).inbox
  when 'user'
    print twitter.user(op.first)
  when '\\0'
    break
  end
end
