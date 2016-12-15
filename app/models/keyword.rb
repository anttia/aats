class Keyword < ApplicationRecord
  has_many :tweets

  def grab_tweets()
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "7bsUWtyXhKuzitwtIa5cz7GXg"
      config.consumer_secret     = "QLowvHEck0ySRHtXQtxkx46ct7YmKPOsKbGONQaOMLyKUbLerw"
      config.access_token        = "14267360-M7Qc2GNu4yXetaNlk4RPzcjqrFBfhWnDeNQsu3VeO"
      config.access_token_secret = "VPWo4tgyN5oWG1S5MPtbhYBeq0eGY51FENCB5fmDnk114"
    end

    client.search(self.word, :count => 3, :result_type => "recent").take(3).collect() do |tweet|
      new_tweet = Tweet.new
      new_tweet.tweet_id = tweet.id.to_s
      new_tweet.tweet_created_at = tweet.created_at
      new_tweet.text = tweet.text
      new_tweet.user_uid = tweet.user.id
      new_tweet.user_name = tweet.user.name
      new_tweet.user_screen_name = tweet.user.screen_name
      new_tweet.user_image_url = tweet.user.profile_image_url
      new_tweet.keyword = self
      new_tweet.save
      "#{tweet.user.screen_name}: #{tweet.text}"
    end
  end
end
