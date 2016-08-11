class Users::RegistrationsController < Devise::RegistrationsController
	# Add custom attributes to Devise
	before_action :configure_permitted_parameters

	protected

	def configure_permitted_parameters
		# Permit Devise attributes + personalized ones in a hash
		devise_parameter_sanitizer.permit(:sign_up) { |user_params|
			user_params.permit(:email, :password, :password_confirmation,
				:first_name, :second_name, :last_name, :adress, :city, :state,
				:birthday
			)
		}

		devise_parameter_sanitizer.permit(:account_update) do |user_params|
			user_params.permit(:password, :password_confirmation, :current_password,
				:first_name, :second_name, :last_name, :adress, :city, :state,
				:birthday
			)
		end
	end
end
