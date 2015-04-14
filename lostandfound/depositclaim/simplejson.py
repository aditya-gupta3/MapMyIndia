from depositclaim.models import Deposit
import json
new_object = Deposit()
tweets_data_path = 'depositclaim/twitter_data.txt'

tweets_data = []
loop = True
print 'Hey'
while loop==True:
    tweets_file = open(tweets_data_path, "r")
    for line in tweets_file:
        try:
            tweet = json.loads(line)
            tweets_data.append(tweet)
            print (tweet['created_at'])
        except:
            continue
    