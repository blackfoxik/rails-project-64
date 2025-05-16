Sentry.init do |config|
    config.dsn = 'https://0ea49b7ea58a43e0aecd751c9fcfdefd@o4509333002256384.ingest.us.sentry.io/4509333064187904'
    # get breadcrumbs from logs
    config.breadcrumbs_logger = [:active_support_logger, :http_logger]
    # Add data like request headers and IP for users, if applicable;
    # see https://docs.sentry.io/platforms/ruby/data-management/data-collected/ for more info
    config.send_default_pii = true
  end
  