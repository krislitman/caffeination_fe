# frozen_string_literal: true

namespace :clean_db do
  task run: :environment do
    User.destroy_all
  end
end
