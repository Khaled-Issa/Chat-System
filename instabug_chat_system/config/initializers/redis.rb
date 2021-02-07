require "redis"
url = "redis://" + ENV["REDIS_URL"] + ":" + ENV["REDIS_PORT"] + "/0"
$redis = Redis.new(url: url)
