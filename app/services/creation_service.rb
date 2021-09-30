class CreationService
  class << self
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
      when args[:type] == :store_user_and_session
        HTTParty.post(
          'http://localhost:3001',
          params: {
            user: args[:user],
            session: args[:session]
          }
        )
      end
    end
  end
end
