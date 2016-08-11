class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
	# Callback method after login with a Provider
	def providers_auth_callback
		# Main returned data from Providers
		auth = request.env["omniauth.auth"]

		# Hash to be sent to User model
		data = {
			name: auth.info.name,
			email: auth.info.email,
			provider: auth.provider,
			uid: auth.uid
		}

		@user = User.find_or_create_by_omniauth(data)

		# persisted = true if saved succesfully, false if not
		if @user.persisted?
			# @user.update_attribute(:confirmed_at, Time.now)
			set_flash_message(:notice, :success, :kind => data[:provider]) if is_navigational_format?
			sign_in_and_redirect(@user, event: :authentication) # this will throw if @user is not activated
		else
			# Get the errors that ocurred while trying to get permissions
			session[:omniauth_errors] = @user.errors.full_messages.to_sentence unless @user.save
			# Store the data to use when the user email is already taken
			session[:facebook_data] = data
			# Redirect and reuse the data for New user registration
			redirect_to new_user_registration_url
		end
	end

	# To redirect to the same method on any provider
	User.omniauth_providers.each do |provider|
		puts '*'*20
		puts provider
		alias_method provider, :providers_auth_callback
	end
end
