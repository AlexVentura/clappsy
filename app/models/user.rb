class User < ApplicationRecord
	# === Devise Configs ===
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
		:recoverable, :rememberable, :trackable, :validatable,
		:confirmable, :omniauthable, omniauth_providers: [:facebook]

	def self.find_or_create_by_omniauth(auth)
		myUser = User.where(provider: auth[:provider], uid: auth[:uid]).first

		# if myUser
		# 	puts '*'*20
		# 	puts myUser.email
		# end

		# Unless the user was found (already exist) CREATE the user
		unless myUser
			myUser = User.create(
				email: auth[:email],
				uid: auth[:uid],
				provider: auth[:provider],
				password: Devise.friendly_token[0, 20],
				confirmed_at: Time.now,
				first_name: auth[:name],
				second_name: "_",
				last_name: "_"
			)
		end

		# The last line is returned by default, so it is not necesary to write return
		myUser
	end
end
