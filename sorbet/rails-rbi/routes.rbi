# typed: strong
# This is an autogenerated file for Rails routes.
# Please run bundle exec rake rails_rbi:routes to regenerate.
class ActionController::Base
  include GeneratedUrlHelpers
end

class ActionController::API
  include GeneratedUrlHelpers
end

module ActionView::Helpers
  include GeneratedUrlHelpers
end

class ActionMailer::Base
  include GeneratedUrlHelpers
end

class ActionDispatch::IntegrationTest
  include GeneratedUrlHelpers
end

class ActionDispatch::SystemTestCase
  include GeneratedUrlHelpers
end

module GeneratedUrlHelpers
  # Sigs for route /
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def root_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def root_url(*args, **kwargs); end

  # Sigs for route /sign_up(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def sign_up_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def sign_up_url(*args, **kwargs); end

  # Sigs for route /log_in(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def log_in_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def log_in_url(*args, **kwargs); end

  # Sigs for route /log_out(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def log_out_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def log_out_url(*args, **kwargs); end

  # Sigs for route /search(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def search_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def search_url(*args, **kwargs); end

  # Sigs for route /filter(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def filter_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def filter_url(*args, **kwargs); end

  # Sigs for route /current_location(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def current_location_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def current_location_url(*args, **kwargs); end

  # Sigs for route /coffee_shop(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def coffee_shop_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def coffee_shop_url(*args, **kwargs); end

  # Sigs for route /favorite(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def favorite_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def favorite_url(*args, **kwargs); end

  # Sigs for route /recede_historical_location(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def turbo_recede_historical_location_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def turbo_recede_historical_location_url(*args, **kwargs); end

  # Sigs for route /resume_historical_location(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def turbo_resume_historical_location_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def turbo_resume_historical_location_url(*args, **kwargs); end

  # Sigs for route /refresh_historical_location(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def turbo_refresh_historical_location_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def turbo_refresh_historical_location_url(*args, **kwargs); end

  # Sigs for route /rails/action_mailbox/postmark/inbound_emails(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def rails_postmark_inbound_emails_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def rails_postmark_inbound_emails_url(*args, **kwargs); end

  # Sigs for route /rails/action_mailbox/relay/inbound_emails(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def rails_relay_inbound_emails_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def rails_relay_inbound_emails_url(*args, **kwargs); end

  # Sigs for route /rails/action_mailbox/sendgrid/inbound_emails(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def rails_sendgrid_inbound_emails_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def rails_sendgrid_inbound_emails_url(*args, **kwargs); end

  # Sigs for route /rails/action_mailbox/mandrill/inbound_emails(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def rails_mandrill_inbound_health_check_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def rails_mandrill_inbound_health_check_url(*args, **kwargs); end

  # Sigs for route /rails/action_mailbox/mandrill/inbound_emails(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def rails_mandrill_inbound_emails_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def rails_mandrill_inbound_emails_url(*args, **kwargs); end

  # Sigs for route /rails/action_mailbox/mailgun/inbound_emails/mime(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def rails_mailgun_inbound_emails_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def rails_mailgun_inbound_emails_url(*args, **kwargs); end

  # Sigs for route /rails/conductor/action_mailbox/inbound_emails(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def rails_conductor_inbound_emails_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def rails_conductor_inbound_emails_url(*args, **kwargs); end

  # Sigs for route /rails/conductor/action_mailbox/inbound_emails/new(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def new_rails_conductor_inbound_email_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def new_rails_conductor_inbound_email_url(*args, **kwargs); end

  # Sigs for route /rails/conductor/action_mailbox/inbound_emails/:id/edit(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def edit_rails_conductor_inbound_email_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def edit_rails_conductor_inbound_email_url(*args, **kwargs); end

  # Sigs for route /rails/conductor/action_mailbox/inbound_emails/:id(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def rails_conductor_inbound_email_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def rails_conductor_inbound_email_url(*args, **kwargs); end

  # Sigs for route /rails/conductor/action_mailbox/inbound_emails/sources/new(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def new_rails_conductor_inbound_email_source_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def new_rails_conductor_inbound_email_source_url(*args, **kwargs); end

  # Sigs for route /rails/conductor/action_mailbox/inbound_emails/sources(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def rails_conductor_inbound_email_sources_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def rails_conductor_inbound_email_sources_url(*args, **kwargs); end

  # Sigs for route /rails/conductor/action_mailbox/:inbound_email_id/reroute(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def rails_conductor_inbound_email_reroute_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def rails_conductor_inbound_email_reroute_url(*args, **kwargs); end

  # Sigs for route /rails/active_storage/blobs/redirect/:signed_id/*filename(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def rails_service_blob_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def rails_service_blob_url(*args, **kwargs); end

  # Sigs for route /rails/active_storage/blobs/proxy/:signed_id/*filename(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def rails_service_blob_proxy_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def rails_service_blob_proxy_url(*args, **kwargs); end

  # Sigs for route /rails/active_storage/representations/redirect/:signed_blob_id/:variation_key/*filename(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def rails_blob_representation_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def rails_blob_representation_url(*args, **kwargs); end

  # Sigs for route /rails/active_storage/representations/proxy/:signed_blob_id/:variation_key/*filename(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def rails_blob_representation_proxy_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def rails_blob_representation_proxy_url(*args, **kwargs); end

  # Sigs for route /rails/active_storage/disk/:encoded_key/*filename(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def rails_disk_service_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def rails_disk_service_url(*args, **kwargs); end

  # Sigs for route /rails/active_storage/disk/:encoded_token(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def update_rails_disk_service_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def update_rails_disk_service_url(*args, **kwargs); end

  # Sigs for route /rails/active_storage/direct_uploads(.:format)
  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def rails_direct_uploads_path(*args, **kwargs); end

  sig { params(args: T.untyped, kwargs: T.untyped).returns(String) }
  def rails_direct_uploads_url(*args, **kwargs); end
end