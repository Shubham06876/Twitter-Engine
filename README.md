# Project4


Team Members:
Shubham Saoji 26364957
Himavanth Boddu 32451847



1 Problem definition
The goal of this (and the next project) is to implement a Twitter-like engine and (in
part 2) pair up with Web Sockets to provide full functionality.
Specific things you have to do are:
In part I, implement the following functionalities:
1. Register account and delete account
2. Send tweet. Tweets can have hashtags (e.g. #COP5615isgreat) and mentions
(@bestuser). You can use predefines categories of messages for hashtags.
3. Subscribe to user's tweets.
4. Re-tweets (so that your subscribers get an interesting tweet you got by other
means).
5. Allow querying tweets subscribed to, tweets with specific hashtags, tweets in
which the user is mentioned (my mentions).
6. If the user is connected, deliver the above types of tweets live (without querying).


What is Working:
All functionalities mentioned are working as expected.


Project Description:
The goal of this (and the next project) is to implement a Twitter-like engine and (in part 2) pair up with Web Sockets to provide full functionality.

The Twitter Engine acts as server and users are clients. We have used GenServer actors for server as well as clients and simulated functionalities like create account, login, logout, subscribe, tweet etc.
Overview of all functionalities is provided later in this report.

Multiple ets tables are used as server storage or database for server/ twitter engine. Test cases have been written and successfully tested fr each functionality. 





Overview of functionalities:
The functionalities that have been implemented in this project are as follows -

1. Register account –
Client can register into twitter engine. This has been simulated in project by spawning actor for client. The entry of this new used is stored in ets table, ‘registered_user’. Each entry has another field having values “C” if user is connected, “D” if user is disconnected i.e after user logs out and “X” if user has deleted account/profile. After register, as user is connected, we set this field to “C” as user is currently connected. 


2. Login -
Client can login into account and then is eligible to send tweets, receive live feeds  or perform any other operation. Value in ets table ‘ registered_user’  is set to “C” after user is connected.

3. Logout -
After user logs out value in ets table ‘registered_user’  is set to “D” and no longer receives live feed.

4. Delete account -
After user account is deleted, value in ets table ‘registered_user’  is set to “X” which corresponds to entry being obsolete.

5. Tweet -
User when connected can send tweet. Hashtags and mentions may be included in tweet. This tweet is sent to Twitter Engine and engine stores it in ‘tweets_by_user’ table correponding to that user. Also, tweets are stored in ‘hashtag_table’ and ‘mention_table’ as per the hashtag and/or mention used in tweet. 

6. Subscribe to other users -
User can subscribe to other user, so that it can receive tweets by that user. For simulation purpose in this project, we have chosen random subscriptions for a user. ‘subscriptions’ table is used in Twitter Engine to store the subscriptions on a user.

7. Re-tweet -
A user can retweet a tweet made by one of its subscriptions so that user’s followers also get this tweet.
8. Query tweets subscribed to -
This function returns all the tweets made by subscriptions of a particular user. 

9. Tweets with specific hashtag -
This function returns all the tweets containing that hashtag. 

10. Tweets with specific mention -
This function returns all the tweets containing that mention. 

11. Live feed -
In case a user is online, he should receive, without quering, tweet containing his mention or made by the user whom he subscribed to. 

All these functionalities are working as intended and test cases for these functionalities have also been included. 

We have written function called “operation” which performs an operation requested by client. This will ensure, if client wishes to perform any operation like disconnect, query results by a particular hashtag, results for particular mention etc then these results are rendered as per operation requested.







Test Cases:
1. Disconnect User
This test case checks if the functionality to disconnect or logout the user is working properly. It is asserted that value in ets table ‘registered_user’  is set to “D”

2. Login User
This test case checks if the functionality to login account for the user is working properly. It is asserted that value in ets table ‘registered_user’  is set to “C”

3. Delete User
This test case checks if the functionality to delete account for the user is working properly. It is asserted that value in ets table ‘registered_user’  is set to “X”

4. subscribe_to_user
This test case tests if the user a client wants to subscribe to is working properly. Here, user1 is trying to subscribe to user5, which is asserted through this test case.

5. tweet_test
User1 is tweeting "Tweet No 1: I am tweeting using the #testHashTag and @2 has to been mentioned in it."

6. Retweet_test
User1 is retweeting the tweet by its subscription i.e. user2 here. So user2 tweets "Tweet No 1: I am tweeting using the #testHashTag and admin has to been mentioned in it." and this tweet is retweeted by user1 successfully.

7. Query_with_mention
User2 tweets "Tweet No 1: I am tweeting using the #testHashTag and @1 has to been mentioned in it." and it is processed and stored in database. We check if by querying tweets with mention of @1 user we get this tweet.


8. Query_with_hashtag
User2 tweets "Tweet No 1: I am tweeting using the #testHashTag and @1 has to been mentioned in it." and it is processed and stored in database. We check if by querying tweets with hashtag of #testHashTag user we get this tweet.


9. register
We try to register new user, user6 here and check if its entry is present in registered_user table of Engine database. The functionality is working as expected.
