# frozen_string_literal: true

Sentry.init do |config|
  config.dsn = 'https://5affa937bdb78bc9d56f80e0ddf2169e@o4509052127281152.ingest.us.sentry.io/4509052136914944'

  config.breadcrumbs_logger = %i[active_support_logger http_logger]

  # Set traces_sample_rate to 1.0 to capture 100%
  # of transactions for performance monitoring.
  # We recommend adjusting this value in production.
  config.traces_sample_rate = 1.0
  # or
  # config.traces_sampler = lambda do |context|
  #   true
  # end

  # Set profiles_sample_rate to profile 100%
  # of sampled transactions.
  # We recommend adjusting this value in production.
  config.profiles_sample_rate = 1.0
end
