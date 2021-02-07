sidekiq_config = {
  url: url = "redis://" + ENV["REDIS_URL"] + ":" + ENV["REDIS_PORT"] + "/0"
}

Sidekiq.configure_server do |config|
  config.redis = sidekiq_config
end

Sidekiq.configure_client do |config|
  config.redis = sidekiq_config
end
