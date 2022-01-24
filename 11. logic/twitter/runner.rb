require_relative 'twitter'

twitter = Twitter.new
twitter.add_user('goku')
twitter.add_user('sara')
twitter.add_user('tina')
print twitter, "\n"

twitter.user('goku').follow(twitter.user('sara'))
twitter.user('goku').follow(twitter.user('tina'))
twitter.user('sara').follow(twitter.user('tina'))
print twitter, "\n"

twitter.tweet('sara', 'hoje estou triste')
twitter.tweet('tina', 'ganhei chocolate')
twitter.tweet('sara', 'partiu ru')
twitter.tweet('tina', 'chocolate ruim')
twitter.tweet('goku', 'internet maldita')

print twitter.user('goku').inbox, "\n"
print twitter.user('tina').inbox, "\n"
print twitter.user('sara').inbox, "\n"

twitter.user('sara').like(1)
twitter.user('goku').like(1)
twitter.user('sara').like(3)

print twitter.user('sara').inbox, "\n"
print twitter.user('goku').inbox, "\n"

twitter.user('goku').unfollow(twitter.user('tina'))
print twitter
print twitter.user('goku').inbox, "\n"
print twitter.user('sara').inbox, "\n"

twitter.retweet('sara', 3, 'olha goku, ela nao gostou do seu chocolate')
print twitter.user('sara').inbox, "\n"
print twitter.user('goku').inbox, "\n"

print "removing------\n"
twitter.user('tina').follow(twitter.user('sara'))
print twitter, "\n"
twitter.rm_user('tina')
print twitter, "\n"

print twitter.user('goku').inbox, "\n"
