#Import the necessary methods from tweepy library
from __future__ import print_function

from tweepy.streaming import StreamListener
from tweepy import OAuthHandler
from tweepy import Stream
from django.core.files import File
import json
from depositclaim.models import Deposit
#Variables that contains the user credentials to access Twitter API 
access_token =  '1553577908-fwlOzmVyELJWEUyLyskIhxEoW1fC6HcMRHjayH2'
access_token_secret =   'C2zmtDfznWZoTGvlfnn3URUBWSkeaPbkVexlZoia4cVTQ'
consumer_key =  'eHQReqsk2I82IzP3PelrM2Hby'
consumer_secret = 'NVUAGTWgrgCiPGOEgOFshJytaVXOwkzylbhQISlzFwWMFwBzyk'

f = open('depositclaim/twitter_data.txt','w')
global any 
class StdOutListener(StreamListener):
    def __init__(self, api=None):
        super(StdOutListener, self).__init__()
        self.num_tweets = 0
    def on_data(self, data):
        any = data
        print(any, file=f)
        self.num_tweets = self.num_tweets + 1
        if self.num_tweets < 1:
            return True
        else:
            return False

    def on_error(self, status):
        print (status)



    #This handles Twitter authetification and the connection to Twitter Streaming API
l = StdOutListener()
auth = OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_token_secret)
stream = Stream(auth, l)

stream.filter(track=['wesleyan lostandfound'] and location = (41.6,72.7))

new_object = Deposit()

# loop = True
# while loop==True:
#     tweets_file = open(tweets_data_path, "r")
#     for line in tweets_file:
#         try:
#             tweet = json.loads(line)
#             tweets_data.append(tweet)
#             print (tweet['created_at'])
#         except:
#             continue


tweets_data_path = 'depositclaim/twitter_data.txt'

tweets_data = []
tweets_file = open(tweets_data_path, "r")
for line in tweets_file:
    try:
        tweet = json.loads(line)
        tweets_data.append(tweet)
    except:
        continue

for line in tweets_data:
    print (line['text'])

