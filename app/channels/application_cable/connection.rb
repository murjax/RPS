module ApplicationCable
	class Connection < ActionCable::Connection::Base
		identified_by :current_user
		def connect
			if current_user
				current_user
			else
				reject_unauthorized_connection
			end
		end

		def disconnect

		end
	end
end