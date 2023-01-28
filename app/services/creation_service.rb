# frozen_string_literal: true


class CreationService
	class << self
		def clean_up_test
			HTTParty.delete('http://localhost:3001/api/v1/store')
		end

		def store_user_and_session(user, session)
			type = { store_user_and_session: true }
			local_connection(
				user: user,
				session: session,
				type: type
			)
		end

		def local_connection(**args)
			case
			when args.dig(:type, :store_user_and_session) == true
				HTTParty.post(
				'http://localhost:3001/api/v1/store',
				body: {
					user: args[:user].to_json,
					session: args[:session].to_json,
					type: args[:type].to_json
				}
				)
			end
		end
	end
end
