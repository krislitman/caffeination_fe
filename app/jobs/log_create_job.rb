# frozen_string_literal: true

class LogCreateJob < ApplicationJob
	queue_as :default

	after_perform do |job|
		Rails.logger.info "#{Time.now}: Job completed. #{job.inspect}"
	end

	def perform(payload)
		LogService.create(payload)
	end
end
