class Keyword < ApplicationRecord
  def grab_tweets()
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "7bsUWtyXhKuzitwtIa5cz7GXg"
      config.consumer_secret     = "QLowvHEck0ySRHtXQtxkx46ct7YmKPOsKbGONQaOMLyKUbLerw"
      config.access_token        = "14267360-M7Qc2GNu4yXetaNlk4RPzcjqrFBfhWnDeNQsu3VeO"
      config.access_token_secret = "VPWo4tgyN5oWG1S5MPtbhYBeq0eGY51FENCB5fmDnk114"
    end

    client.search(self.word, :count => 3, :result_type => "recent").take(3).collect() do |tweet|
      "#{tweet.user.screen_name}: #{tweet.text}"
    end
  end
end
