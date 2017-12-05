# frozen_string_literal: true

Rails.application.configure do
  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local = true

  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.seconds.to_i}"
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = { address: 'smtp.sendgrid.net',
                                         port: 25,
                                         username: 'rudygeek',
                                         domain: 'localhost:3000',
                                         authentication: :plain,
                                         password: 'sendgridc3t3tc3t' }

  # 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
  # API Key ID: LR3Z4dpdSKW5fhCZDQj3qQ

  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.perform_caching = false
  config.active_support.deprecation = :log
  config.active_record.migration_error = :page_load
  config.assets.debug = true
  config.assets.quiet = true
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker
  Bullet.enable = true
  Bullet.console = true
  Bullet.bullet_logger = true
end
