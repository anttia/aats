task :grab_tweets => :environment do
  Keyword.grab_all_tweets
end
