class LogService
	class << self

		def create(payload)
			local_connection(payload)
		end

		def local_connection(payload)
			HTTParty.post(
				Figaro.env.backend,
				body: {
					created_at: Time.now.to_s,
					payload: payload
				}
			)
		end
	end
end
