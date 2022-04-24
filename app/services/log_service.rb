class LogService
	class << self

		def create(payload)
			local_connection(payload)
		end

		def local_connection(payload)
			path = route(payload)

			HTTParty.post(
				Figaro.env.backend.concat(path),
				body: {
					created_at: Time.now.to_s,
					payload: payload
				}
			)
		end

		def route(payload)
			type = payload.dig(:type)
			event = payload.dig(:event)

			if type == :user && event == :create
				"user_log"
			end
		end
	end
end
